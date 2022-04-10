package runner

import (
	"bitmap-usage/benchmark/analyze/analyze"
	"bitmap-usage/handlers"
	"context"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"strings"
	"sync"
	"testing"
	"time"
)

func TestPerformanceWrkExperiments(t *testing.T) {
	roaring32, kelindar32, map32, sroar, map64, roaring64 := basicApplications()
	wrkConfig := Wrk{Threads: 2, Connections: 20, Duration: 5 * time.Second}

	expsType1 := basicExperiments(roaring32, map32, kelindar32, roaring64, map64, sroar)

	dt := time.Now().Format("2006-01-02T15-04-05Z")
	expsType2 := make([]Experiment, 0, len(expsType1))
	for _, exp := range expsType1 {
		//if exp.Name != "Roaring32" {
		//	continue
		//}
		wrk := merge(wrkConfig, exp.Wrk)
		filename := "/wrk" +
			"-t" + strconv.Itoa(wrk.Threads) +
			"-c" + strconv.Itoa(wrk.Connections) +
			"-" + strings.ToLower(string(exp.Application.Approach)) +
			".json"
		wrk.JsonFilePath = "reports/" + dt + "/" + filename
		//wrk.Script = "benchmark/500k-large-groups/sample/wrk-search-price-request.lua"
		expsType2 = append(expsType2, Experiment{Name: exp.Name, Application: exp.Application, Wrk: wrk})
	}

	expsType3 := make([]Experiment, 0, len(expsType1))
	for _, exp := range expsType1 {
		if exp.Application.Approach != Roaring32 {
			continue
		}
		for i := 1; i < 6; i++ {
			newWrk := Wrk{Threads: 2, Connections: i * 5, Duration: 10 * time.Second}
			wrk := merge(newWrk, exp.Wrk)
			expsType3 = append(expsType3, Experiment{Name: exp.Name, Application: exp.Application, Wrk: wrk})
		}

	}

	for _, exp := range expsType2 {
		log.Info().Str("name", exp.Name).Interface("app", exp.Application).
			Interface("wrk", exp.Wrk).
			Msg("Start experiment...")
		execute(exp.Application, exp.Wrk)
		path := exp.Wrk.JsonFilePath
		if path != "" {
			report, err := analyze.ReadJsonWrkReport(reportFullpath(path))
			if err != nil {
				log.Err(err).Msg("unable to read wrk report")
				t.FailNow()
			}
			assert.Zero(t, report.Errors.Write)
			assert.Zero(t, report.Errors.Read)
			assert.Zero(t, report.Errors.Timeout)
			assert.Zero(t, report.Errors.Status)
			assert.Zero(t, report.Errors.Connect)
		}
	}
}

func TestPerformanceBulkWrkExperiments(t *testing.T) {
	roaring32, kelindar32, map32, sroar, map64, roaring64 := basicApplications()
	wrkConfig := Wrk{Threads: 1, Connections: 1, Duration: 30 * time.Second}

	expsType1 := bulkExperiments(roaring32, map32, kelindar32, roaring64, map64, sroar)

	for _, exp := range expsType1 {
		wrk := merge(wrkConfig, exp.Wrk)
		log.Info().Str("name", exp.Name).Interface("app", exp.Application).
			Interface("wrk", wrk).
			Msg("Start experiment...")
		execute(exp.Application, wrk)

	}
}

func TestPerformanceBulkWrkExperimentsDifferentVersions(t *testing.T) {
	roaring32, kelindar32, map32, sroar, map64, roaring64 := basicApplications()
	wrkConfig := Wrk{Threads: 1, Connections: 1, Duration: 10 * time.Second}

	expsType1 := bulkExperimentsDifferentVersions(roaring32, map32, kelindar32, roaring64, map64, sroar)

	for _, exp := range expsType1 {
		wrk := merge(wrkConfig, exp.Wrk)
		log.Info().Str("name", exp.Name).Interface("app", exp.Application).
			Interface("wrk", wrk).
			Msg("Start experiment...")
		execute(exp.Application, wrk)
	}
}

func basicApplications() (Application, Application, Application, Application, Application, Application) {
	roaring32 := Application{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer, BitmapOptStructure: true,
		Approach: Roaring32}
	kelindar32 := Application{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer, BitmapOptStructure: true,
		Approach: Kelindar32}
	map32 := Application{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer, BitmapOptStructure: true,
		Approach: Map32}
	sroar := Application{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer, BitmapOptStructure: true,
		Approach: Sroar}
	map64 := Application{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer, BitmapOptStructure: true,
		Approach: Map64}
	roaring64 := Application{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer, BitmapOptStructure: true,
		Approach: Roaring64}
	return roaring32, kelindar32, map32, sroar, map64, roaring64
}

func basicExperiments(roaring32 Application,
	map32 Application,
	kelindar32 Application, roaring64 Application,
	map64 Application,
	sroar Application) []Experiment {
	expsType1 := []Experiment{
		{Name: "Roaring32", Application: roaring32, Wrk: Wrk{
			Path:   "/v1/search/bitmap/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-1000.lua",
		}},
		{Name: "Map32", Application: map32, Wrk: Wrk{
			Path:   "/v1/search/map/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-map-multiple-request-1000.lua",
		}},
		{Name: "Kelindar32", Application: kelindar32, Wrk: Wrk{
			Path:   "/v1/search/kelindar/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-kelindar-multiple-request-1000.lua",
		}},
		{Name: "Roaring64", Application: roaring64, Wrk: Wrk{
			Path:   "/v1/search/bitmap/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-1000.lua",
		}},
		{Name: "Map64", Application: map64, Wrk: Wrk{
			Path:   "/v1/search/map/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-map-multiple-request-1000.lua",
		}},
		{Name: "Sroar", Application: sroar, Wrk: Wrk{
			Path:   "/v1/search/bitmap/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-1000.lua",
		}},
	}
	return expsType1
}

func bulkExperiments(bitmap32 Application,
	map32 Application,
	kelindar32 Application, roaring64 Application,
	map64 Application,
	sroar Application) []Experiment {
	expsType1 := []Experiment{
		{Name: "Roaring32", Application: bitmap32, Wrk: Wrk{
			Path:   "/v5/search/bitmap/bulk/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000-nd.lua",
		}},
		{Name: "Map32", Application: map32, Wrk: Wrk{
			Path:   "/v4/search/map/bulk/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000-nd.lua",
		}},
		//{Name: "Kelindar32", Application: kelindar32, Wrk: Wrk{
		//	Path:   "/v1/search/kelindar/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Name: "Roaring64", Application: roaring64, Wrk: Wrk{
		//	Path:   "/v1/search/bitmap/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Name: "Map64", Application: map64, Wrk: Wrk{
		//	Path:   "/v1/search/map/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Name: "Sroar", Application: sroar, Wrk: Wrk{
		//	Path:   "/v1/search/bitmap/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
	}
	return expsType1
}

func bulkExperimentsDifferentVersions(bitmap32 Application,
	map32 Application,
	kelindar32 Application, roaring64 Application,
	map64 Application,
	sroar Application) []Experiment {
	expsType1 := []Experiment{
		{Name: "Roaring32. V5", Application: bitmap32, Wrk: Wrk{
			Path:   "/v5/search/bitmap/bulk/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000-nd.lua",
		}},
		{Name: "Roaring32. V4", Application: bitmap32, Wrk: Wrk{
			Path:   "/v4/search/bitmap/bulk/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		}},
		{Name: "Roaring32. V2", Application: bitmap32, Wrk: Wrk{
			Path:   "/v2/search/bitmap/bulk/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		}},
		//{Name: "Kelindar32", Application: kelindar32, Wrk: Wrk{
		//	Path:   "/v1/search/kelindar/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Name: "Roaring64", Application: roaring64, Wrk: Wrk{
		//	Path:   "/v1/search/bitmap/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Name: "Map64", Application: map64, Wrk: Wrk{
		//	Path:   "/v1/search/map/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Name: "Sroar", Application: sroar, Wrk: Wrk{
		//	Path:   "/v1/search/bitmap/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
	}
	return expsType1
}

func TestWrkKelindarExperiment(t *testing.T) {
	apps := []Application{
		{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer, BitmapOptStructure: true,
			Approach: Kelindar32},
	}
	//globalWrkConfig := Wrk{
	//	Duration: 3 * time.Second,
	//	Path:     "/v1/search/kelindar/prices",
	//	Script:   "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
	//	//JsonFilePath: "reports/wrk-search-result.json",
	//}

	for _, app := range apps {
		log.Info().Interface("app", app).Msg("Application to Test")
		globalWrkConfig := Wrk{
			Duration: 30 * time.Second,
			Path:     "/v1/search/kelindar/prices",
			Script:   "benchmark/500k-large-groups/sample/wrk-search-price-kelindar-multiple-request-1000.lua",
		}
		wrkc := []*Wrk{{Threads: 2, Connections: 20}}
		mergeArray(globalWrkConfig, wrkc)
		for _, wrk := range wrkc {
			log.Info().Interface("wrk", wrk).Msg("Wrk to Test")
			execute(app, *wrk)
		}

		globalWrkConfig2 := Wrk{
			Duration: 30 * time.Second,
			Path:     "/v1/search/map/prices",
			Script:   "benchmark/500k-large-groups/sample/wrk-search-price-map-multiple-request-1000.lua",
		}
		wrkc2 := []*Wrk{{Threads: 2, Connections: 20}}
		mergeArray(globalWrkConfig2, wrkc2)

		for _, wrk := range wrkc2 {
			log.Info().Interface("wrk", wrk).Msg("Wrk to Test")
			execute(app, *wrk)
		}
	}
}

func TestWrkBulkExperiment(t *testing.T) {
	apps := []Application{
		{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer, BitmapOptStructure: true},
	}

	for _, app := range apps {
		log.Info().Interface("app", app).Msg("Application to Test")
		globalWrkConfig := Wrk{
			Duration: 30 * time.Second,
			Path:     "/v5/search/bitmap/bulk/prices",
			Script:   "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		}
		wrkc := []*Wrk{{Threads: 1, Connections: 1}}
		mergeArray(globalWrkConfig, wrkc)
		for _, wrk := range wrkc {
			log.Info().Interface("wrk", wrk).Msg("Wrk to Test")
			execute(app, *wrk)
		}
	}
}

func mergeArray(globalWrk Wrk, wrkc []*Wrk) {
	for _, wrk := range wrkc {
		merge(globalWrk, *wrk)
	}
}

func merge(from Wrk, to Wrk) Wrk {
	if from.Connections != 0 {
		to.Connections = from.Connections
	}
	if from.Threads != 0 {
		to.Threads = from.Threads
	}
	if from.Duration != 0 {
		to.Duration = from.Duration
	}

	if from.Port != 0 {
		to.Port = from.Port
	}

	if from.Script != "" {
		to.Script = from.Script
	}

	if from.Path != "" {
		to.Path = from.Path
	}

	if from.JsonFilePath != "" {
		to.JsonFilePath = from.JsonFilePath
	}
	return to
}

func execute(app Application, wrk Wrk) {
	wg := sync.WaitGroup{}
	wg.Add(1)
	killTime := wrk.Duration + 10*time.Second
	timeoutCtx, cancelFunc := context.WithTimeout(context.Background(), killTime)
	defer cancelFunc()
	cons := CreateAppCmdWithConsole()

	appConsole := app.Convert()
	cmd := cons.Cmd
	cmd.Env = append(cmd.Env, appConsole.HttpServer, appConsole.GoGC, appConsole.GoMaxProc,
		appConsole.FiberPrefork, appConsole.BitmapOptStats,
		appConsole.BitmapOptStructure, appConsole.Approach)
	//kill the process to avoid hanging in case of problems
	go func() {
		<-time.After(killTime)
		//doesn't matter the error cause process may be already stopped (in case of properly implemented graceful shutdown)
		//goland:noinspection GoUnhandledErrorResult
		cmd.Process.Kill()
	}()
	cons.Start()
	wrk.Port = cons.Port
	wrkArgs := wrk.Convert()
	consoleArgs := make([]string, 0, 10)
	consoleArgs = append(consoleArgs, wrkArgs.Threads, wrkArgs.Connections, wrkArgs.Duration,
		"--latency", "-s", wrkArgs.Script, wrkArgs.Path)
	if wrkArgs.JsonFilePath != "" {
		dir := reportDirFullpath(wrkArgs.JsonFilePath)
		log.Info().Str("dir", dir).Msg("test")
		err := os.MkdirAll(dir, os.ModePerm)
		if err != nil {
			panic(err)
		}
		consoleArgs = append(consoleArgs, "--", wrkArgs.JsonFilePath)
	}
	go executeCommand(timeoutCtx, &wg, "./wrk", consoleArgs...)
	wg.Wait()
	err := cmd.Process.Signal(os.Interrupt)
	if err != nil {
		panic(err)
	}
}

func reportDirFullpath(fp string) string {
	dir, _ := filepath.Split(fp)
	if !filepath.IsAbs(dir) {
		dir = filepath.Join(commandDir(), dir)
	}
	return dir
}

func reportFullpath(fp string) string {
	dir, file := filepath.Split(fp)
	if !filepath.IsAbs(dir) {
		dir = filepath.Join(commandDir(), dir)
	}
	return filepath.Join(dir, file)
}

func executeCommand(ctx context.Context, wg *sync.WaitGroup, app string, args ...string) {
	defer wg.Done()
	cmd := exec.Command(app, args...)
	cmd.Dir = commandDir()
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	log.Info().Msg("Start Test...")
	go func() {
		select {
		case _ = <-ctx.Done():
			cmd.Process.Kill()
			return
		}
	}()

	err := cmd.Start()
	if err != nil {
		log.Err(err).Msg("Command start failed")
	}
	err = cmd.Wait()
	if err != nil {
		log.Err(err).Msg("Command wait failed")
	}
}

func commandDir() string {
	getwd, err := os.Getwd()
	if err != nil {
		panic(err)
	}
	dir := filepath.Dir(getwd)
	return dir
}

// Application - developer-friendly way to describe params of application
type Application struct {
	HttpServer         handlers.HttpServerType
	Approach           Approach
	FiberPrefork       bool
	GoGC               int
	GoMaxProc          int
	BitmapOptStructure bool
	BitmapOptStats     bool
}
type Approach string

const (
	Map32      Approach = "MAP32"
	Map64      Approach = "MAP64"
	Roaring32  Approach = "ROARING32"
	Roaring64  Approach = "ROARING64"
	Kelindar32 Approach = "KELINDAR32"
	Sroar      Approach = "SROAR"
)

// Wrk - developer-friendly way to describe params of WRK performance tool
type Wrk struct {
	Connections  int
	Threads      int
	Duration     time.Duration
	Script       string
	Path         string
	Port         int
	JsonFilePath string
}

// AppExecArgs - formatted params for application startup
type AppExecArgs struct {
	HttpServer         string
	Approach           string
	GoGC               string
	GoMaxProc          string
	FiberPrefork       string
	BitmapOptStructure string
	BitmapOptStats     string
}

func (app Application) Convert() AppExecArgs {
	var httpServer string
	if app.HttpServer == handlers.FiberServer {
		httpServer = "FIBER=true"
	}
	approach := string(app.Approach)
	if approach != "" {
		approach = approach + "=true"
	}
	return AppExecArgs{
		HttpServer:         httpServer,
		Approach:           approach,
		GoGC:               "GOGC=" + strconv.Itoa(app.GoGC),
		GoMaxProc:          "GOMAXPROCS=" + strconv.Itoa(app.GoMaxProc),
		FiberPrefork:       "FIBER_PREFORK=" + strconv.FormatBool(app.FiberPrefork),
		BitmapOptStructure: "BITMAP_OPT_STR=" + strconv.FormatBool(app.BitmapOptStructure),
		BitmapOptStats:     "BITMAP_OPT_STATS=" + strconv.FormatBool(app.BitmapOptStats),
	}
}

func (wrk Wrk) Convert() WrkExecArgs {
	return WrkExecArgs{Connections: "-c" + strconv.Itoa(wrk.Connections),
		Threads:      "-t" + strconv.Itoa(wrk.Threads),
		Duration:     "-d" + strconv.Itoa(int(wrk.Duration.Seconds())),
		Script:       wrk.Script,
		Path:         "http://localhost:" + strconv.Itoa(wrk.Port) + wrk.Path,
		JsonFilePath: wrk.JsonFilePath,
	}
}

// WrkExecArgs - formatted params for WRK tool
type WrkExecArgs struct {
	Connections  string
	Threads      string
	Duration     string
	Script       string
	Path         string
	JsonFilePath string
}

type Experiment struct {
	Name        string
	Application Application
	Wrk         Wrk
}
