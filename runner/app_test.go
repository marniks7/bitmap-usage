package runner

import (
	"bitmap-usage/handlers"
	"context"
	"github.com/rs/zerolog/log"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"sync"
	"testing"
	"time"
)

func TestWrkBitmapExperiment(t *testing.T) {
	apps := []Application{
		{GoMaxProc: 2, GoGC: 100, HttpServer: handlers.FiberServer},
		{GoMaxProc: 2, GoGC: 200, HttpServer: handlers.FiberServer},
		{GoMaxProc: 2, GoGC: 300, HttpServer: handlers.FiberServer},
		{GoMaxProc: 2, GoGC: 400, HttpServer: handlers.FiberServer},
		{GoMaxProc: 2, GoGC: 500, HttpServer: handlers.FiberServer},
		{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer},
		{GoMaxProc: 2, GoGC: 2000, HttpServer: handlers.FiberServer},
	}
	for _, app := range apps {
		log.Info().Interface("app", app).Msg("Application to Test")
		globalWrkConfig := Wrk{
			Duration: 10 * time.Second,
			Path:     "/v1/search/bitmap/prices",
			Script:   "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
		}
		wrkc := wkrStatic(globalWrkConfig)

		wg := sync.WaitGroup{}
		for _, wrk := range wrkc {
			log.Info().Interface("wrk", wrk).Msg("Wrk to Test")
			execute(app, *wrk, &wg)
		}
	}

}

func TestWrkMapExperiment(t *testing.T) {
	app := Application{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer}
	globalWrkConfig := Wrk{
		Duration: 3 * time.Second,
		Path:     "/v1/search/map/prices",
		Script:   "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
	}
	wrkc := wkrStatic(globalWrkConfig)

	wg := sync.WaitGroup{}
	for _, wrk := range wrkc {
		execute(app, *wrk, &wg)
	}
}

func TestWrkBitmapVsMapExperiment(t *testing.T) {
	apps := []Application{
		{GoMaxProc: 2, GoGC: 1000, HttpServer: handlers.FiberServer, BitmapOptStructure: true},
	}
	for _, app := range apps {
		log.Info().Interface("app", app).Msg("Application to Test")
		globalWrkBitmapConfig := Wrk{
			Duration: 10 * time.Second, Path: "/v1/search/bitmap/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-100.lua",
		}

		wrkBitmap := wkrStatic(globalWrkBitmapConfig)

		wg := sync.WaitGroup{}
		for _, wrk := range wrkBitmap {
			log.Info().Interface("wrk", wrk).Msg("Wrk to Test")
			execute(app, *wrk, &wg)
		}
		globalWrkMapConfig := Wrk{
			Duration: 10 * time.Second, Path: "/v1/search/map/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-map-multiple-request-100.lua",
		}

		wrkMap := wkrStatic(globalWrkMapConfig)

		for _, wrk := range wrkMap {
			log.Info().Interface("wrk", wrk).Msg("Wrk to Test")
			execute(app, *wrk, &wg)
		}
	}
}

func wkrStatic(globalWrk Wrk) []*Wrk {
	wrkc := []*Wrk{
		//{Connections: 2,
		//	Threads: 2,
		//},
		//{Connections: 5,
		//	Threads: 2,
		//},
		//{Connections: 10,
		//	Threads: 2,
		//},
		//{Connections: 15,
		//	Threads: 2,
		//},
		{Connections: 20,
			Threads: 2,
		},
		//{Connections: 25,
		//	Threads: 2,
		//},
		//{Connections: 30,
		//	Threads: 2,
		//},
	}
	for _, wrk := range wrkc {
		if globalWrk.Connections != 0 {
			wrk.Connections = 0
		}
		if globalWrk.Threads != 0 {
			wrk.Threads = globalWrk.Threads
		}
		if globalWrk.Duration != 0 {
			wrk.Duration = globalWrk.Duration
		}

		if globalWrk.Port != 0 {
			wrk.Port = globalWrk.Port
		}

		if globalWrk.Script != "" {
			wrk.Script = globalWrk.Script
		}

		if globalWrk.Path != "" {
			wrk.Path = globalWrk.Path
		}
	}
	return wrkc
}

func execute(app Application, wrk Wrk, wg *sync.WaitGroup) {
	wg.Add(1)
	killTime := wrk.Duration + 10*time.Second
	timeoutCtx, cancelFunc := context.WithTimeout(context.Background(), killTime)
	defer cancelFunc()
	cons := CreateAppCmdWithConsole()

	appConsole := app.Convert()
	cmd := cons.Cmd
	cmd.Env = append(cmd.Env, appConsole.HttpServer, appConsole.GoGC, appConsole.GoMaxProc,
		appConsole.FiberPrefork, appConsole.BitmapOptStats, appConsole.BitmapOptStructure)
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
	go executeCommand(timeoutCtx, wg, "./wrk",
		wrkArgs.Threads,
		wrkArgs.Connections,
		wrkArgs.Duration,
		"--latency",
		"-s", wrkArgs.Script,
		wrkArgs.Path)
	wg.Wait()
	err := cmd.Process.Signal(os.Interrupt)
	if err != nil {
		panic(err)
	}
}

func executeCommand(ctx context.Context, wg *sync.WaitGroup, app string, args ...string) {
	defer wg.Done()
	cmd := exec.Command(app, args...)
	getwd, err := os.Getwd()
	if err != nil {
		panic(err)
	}
	dir := filepath.Dir(getwd)
	cmd.Dir = dir
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

	err = cmd.Start()
	if err != nil {
		log.Err(err).Msg("Command start failed")
	}
	err = cmd.Wait()
	if err != nil {
		log.Err(err).Msg("Command wait failed")
	}
}

type Run struct {
	Application *Application
	Wrk         *Wrk
}

// Application - developer-friendly way to describe params of application
type Application struct {
	HttpServer         handlers.HttpServerType
	GoGC               int
	GoMaxProc          int
	FiberPrefork       bool
	BitmapOptStructure bool
	BitmapOptStats     bool
}

// Wrk - developer-friendly way to describe params of WRK performance tool
type Wrk struct {
	Connections int
	Threads     int
	Duration    time.Duration
	Script      string
	Multiple    bool
	Path        string
	Port        int
}

// AppExecArgs - formatted params for application startup
type AppExecArgs struct {
	HttpServer         string
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
	return AppExecArgs{
		HttpServer:         httpServer,
		GoGC:               "GOGC=" + strconv.Itoa(app.GoGC),
		GoMaxProc:          "GOMAXPROCS=" + strconv.Itoa(app.GoMaxProc),
		FiberPrefork:       "FIBER_PREFORK=" + strconv.FormatBool(app.FiberPrefork),
		BitmapOptStructure: "BITMAP_OPT_STR=" + strconv.FormatBool(app.BitmapOptStructure),
		BitmapOptStats:     "BITMAP_OPT_STATS=" + strconv.FormatBool(app.BitmapOptStats),
	}
}

func (wrk Wrk) Convert() WrkExecArgs {
	return WrkExecArgs{Connections: "-c" + strconv.Itoa(wrk.Connections),
		Threads:  "-t" + strconv.Itoa(wrk.Threads),
		Duration: "-d" + strconv.Itoa(int(wrk.Duration.Seconds())),
		Script:   wrk.Script,
		Path:     "http://localhost:" + strconv.Itoa(wrk.Port) + wrk.Path,
	}
}

// WrkExecArgs - formatted params for WRK tool
type WrkExecArgs struct {
	Connections string
	Threads     string
	Duration    string
	Script      string
	Path        string
}
