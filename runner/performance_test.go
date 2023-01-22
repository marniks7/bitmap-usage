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
	"sync"
	"testing"
	"time"
)

func TestPerformanceWrkExperiments(t *testing.T) {
	//wrkConfig := Wrk{Threads: 2, Connections: 20, Duration: 2 * time.Second}
	wrkConfig := Wrk{Threads: 2, Connections: 20, Duration: 4 * time.Second}

	//experiments := BasicExperiments(wrkConfig)
	//experiments := DockerBasicExperiments(wrkConfig)
	//experiments := DockerMemoryLimitExperiments(wrkConfig)
	experiments := DockerMemoryLimitWithGoMemLimitExperiments(wrkConfig)
	//experiments := HttpServerExperiments(wrkConfig)
	//experiments := GoGCExperiments(wrkConfig)

	for _, exp := range experiments {
		log.Info().Str("name", exp.Name).
			Interface("app", exp.Application).
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
	generateMarkdownDifference(t, experiments)
}

func BasicExperiments(wrkConfig Wrk) []Experiment {
	experiments := generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000}})
	return experiments
}

func DockerBasicExperiments(wrkConfig Wrk) []Experiment {
	experiments := generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true}})
	return experiments
}

func DockerMemoryLimitExperiments(wrkConfig Wrk) []Experiment {
	experiments := generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "2GB"}})
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "1GB"}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "800MB"}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "500MB"}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "200MB"}})...)

	return experiments
}

func DockerMemoryLimitWithGoMemLimitExperiments(wrkConfig Wrk) []Experiment {
	experiments := generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "2GB", GOMEMLIMIT: "1750MiB"}})
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "1.5GB", GOMEMLIMIT: "1250MiB"}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "1GB", GOMEMLIMIT: "750MiB"}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "800MB", GOMEMLIMIT: "650MiB"}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "500MB", GOMEMLIMIT: "400MiB"}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000, Docker: true, DockerMemoryLimit: "200MB", GOMEMLIMIT: "180MiB"}})...)
	return experiments
}
func HttpServerExperiments(wrkConfig Wrk) []Experiment {
	experiments := generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000}})
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.DefaultServer),
			GoGC: 1000}})...)
	return experiments
}

func GoGCExperiments(wrkConfig Wrk) []Experiment {
	experiments := generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 1000}})
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 800}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 600}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 400}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 200}})...)
	experiments = append(experiments, generateExperiments(ExperimentsConfig{Wrk: wrkConfig,
		Approaches: []Approach{Map32, Roaring32},
		Application: &Application{HttpServer: httpServerAddressable(handlers.FiberServer),
			GoGC: 100}})...)
	return experiments
}

func generateMarkdownDifference(t *testing.T, experiments []Experiment) {
	end := len(experiments)

	for i := 0; i < end; i++ {
		path1 := experiments[i].Wrk.JsonFilePath
		_, file1 := filepath.Split(path1)
		report1, err := analyze.ReadJsonWrkReport(reportFullpath(path1))
		assert.NoError(t, err)
		for j := 0; j < end; j++ {
			if i == j {
				continue
			}
			path2 := experiments[j].Wrk.JsonFilePath
			_, file2 := filepath.Split(path2)
			report2, err := analyze.ReadJsonWrkReport(reportFullpath(path2))
			assert.NoError(t, err)
			fullpath := reportDirFullpath(path1)
			diffFile := filepath.Join(fullpath, file1+"-"+file2+".md")
			file, err := os.Create(diffFile)
			assert.NoError(t, err)
			analyze.MarkdownDiff(report1, report2, file, file1, file2)
		}
	}
}

func TestPerformanceBulkWrkExperiments(t *testing.T) {
	wrkConfig := Wrk{Threads: 1, Connections: 1, Duration: 30 * time.Second}

	experiments := generateExperiments(ExperimentsConfig{
		Wrk:  wrkConfig,
		Bulk: true,
	})

	for _, exp := range experiments {
		wrk := merge(wrkConfig, exp.Wrk)
		log.Info().Str("name", exp.Name).Interface("app", exp.Application).
			Interface("wrk", wrk).
			Msg("Start experiment...")
		execute(exp.Application, wrk)

	}
}

func TestPerformanceBulkWrkExperimentsDifferentVersions(t *testing.T) {
	wrkConfig := Wrk{Threads: 1, Connections: 1, Duration: 10 * time.Second}

	experiments := generateExperiments(ExperimentsConfig{
		Wrk:               wrkConfig,
		Bulk:              true,
		DifferentVersions: true,
	})

	for _, exp := range experiments {
		log.Info().Str("name", exp.Name).
			Interface("app", exp.Application).
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

	generateMarkdownDifference(t, experiments)
}

func httpServerAddressable(v handlers.HttpServerType) *handlers.HttpServerType {
	return &v
}

func TestWrkKelindarExperiment(t *testing.T) {
	apps := []Application{
		{GoMaxProc: 2, GoGC: 1000, HttpServer: httpServerAddressable(handlers.FiberServer), BitmapOptStructure: true,
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
		{GoMaxProc: 2, GoGC: 1000, HttpServer: httpServerAddressable(handlers.FiberServer), BitmapOptStructure: true},
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

func execute(app Application, wrk Wrk) {
	wg := sync.WaitGroup{}
	wg.Add(1)
	killTime := wrk.Duration + 20*time.Second
	timeoutCtx, cancelFunc := context.WithTimeout(context.Background(), killTime)
	defer cancelFunc()
	var cons *TestApp
	if app.Docker {
		cons = CreateAppCmdWithConsoleDocker()
	} else {
		cons = CreateAppCmdWithConsole()
	}

	appConsole := app.Convert()
	cmd := cons.Cmd
	if app.Docker {
		newArgs := make([]string, 0, len(cmd.Args))
		addonce := true
		for i, arg := range cmd.Args {
			newArgs = append(newArgs, arg)
			if addonce && arg == "run" && (i != 0 || i < len(cmd.Args)) && cmd.Args[i-1] == "docker" {
				newArgs = append(newArgs, appConsole.All...)
				addonce = false
			}
		}
		cmd.Args = newArgs
	} else {
		cmd.Env = append(cmd.Env, appConsole.All...)
	}

	wrk.Port = cons.Port
	wrkArgs := wrk.Convert()
	consoleArgs := make([]string, 0, 10)
	consoleArgs = append(consoleArgs, wrkArgs.Threads, wrkArgs.Connections, wrkArgs.Duration,
		"--latency", "-s", wrkArgs.Script, wrkArgs.Path)
	if wrkArgs.JsonFilePath != "" {
		dir := reportDirFullpath(wrkArgs.JsonFilePath)
		log.Info().Str("dir", dir).Msg("Output json filepath")
		err := os.MkdirAll(dir, os.ModePerm)
		if err != nil {
			panic(err)
		}
		consoleArgs = append(consoleArgs, "--", wrkArgs.JsonFilePath)
	}

	//kill the process to avoid hanging in case of problems
	go func() {
		<-time.After(killTime)
		//doesn't matter the error cause process may be already stopped (in case of properly implemented graceful shutdown)
		//goland:noinspection GoUnhandledErrorResult
		cmd.Process.Kill()
	}()
	cons.Start()
	go executeCommand(timeoutCtx, &wg, "./wrk", consoleArgs...)
	wg.Wait()
	err := cmd.Process.Signal(os.Interrupt)
	if err != nil {
		panic(err)
	}
	_ = cmd.Wait()
	//if err != nil {
	//	log.Err(err).Msg("Wait for app failed")
	//}
}

//func teeCommand(wrkArgs WrkExecArgs) *exec.Cmd {
//	var c2 *exec.Cmd
//	if wrkArgs.SummaryFilepath != "" {
//		dir := reportDirFullpath(wrkArgs.SummaryFilepath)
//		log.Info().Str("dir", dir).Msg("Output txt filepath")
//		err := os.MkdirAll(dir, os.ModePerm)
//		if err != nil {
//			panic(err)
//		}
//		c2 = exec.Command("tee", wrkArgs.SummaryFilepath)
//		//consoleArgs = append(consoleArgs, "| tee "+wrkArgs.SummaryFilepath)
//	}
//	return c2
//}

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
	log.Info().Str("cmd", cmd.String()).Msg("Command")
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

func (app Application) Convert() AppExecArgs {
	intermediate := make([]string, 0, 16)

	var httpServer string
	if app.HttpServer != nil && *app.HttpServer == handlers.FiberServer {
		httpServer = "FIBER=true"
	}
	approach := string(app.Approach)
	if approach != "" {
		approach = approach + "=true"
	}
	var dockerMemoryLimit string
	if app.DockerMemoryLimit != "" {
		dockerMemoryLimit = app.DockerMemoryLimit
	}

	var env string
	if app.Docker {
		env = "--env"
	}
	intermediate = append(intermediate, httpServer)
	intermediate = append(intermediate, approach)
	intermediate = append(intermediate, "GOGC="+strconv.Itoa(app.GoGC))
	intermediate = append(intermediate, "GOMAXPROCS="+strconv.Itoa(app.GoMaxProc))
	intermediate = append(intermediate, "FIBER_PREFORK="+strconv.FormatBool(app.FiberPrefork))
	intermediate = append(intermediate, "BITMAP_OPT_STR="+strconv.FormatBool(app.BitmapOptStructure))
	intermediate = append(intermediate, "BITMAP_OPT_STATS="+strconv.FormatBool(app.BitmapOptStats))
	intermediate = append(intermediate, "BITMAP_OPT_STATS="+strconv.FormatBool(app.BitmapOptStats))

	if app.GOMEMLIMIT != "" {
		intermediate = append(intermediate, "GOMEMLIMIT="+app.GOMEMLIMIT)
	}

	all := make([]string, 0, 16)
	if app.Docker {
		env = "--env"
		for _, in := range intermediate {
			all = append(all, env, in)
		}
		if dockerMemoryLimit != "" {
			all = append(all, "-m", dockerMemoryLimit)
		}
	} else {
		all = intermediate
	}

	return AppExecArgs{All: all}
}

func (wrk Wrk) Convert() WrkExecArgs {
	return WrkExecArgs{Connections: "-c" + strconv.Itoa(wrk.Connections),
		Threads:         "-t" + strconv.Itoa(wrk.Threads),
		Duration:        "-d" + strconv.Itoa(int(wrk.Duration.Seconds())),
		Script:          wrk.Script,
		Path:            "http://localhost:" + strconv.Itoa(wrk.Port) + wrk.Path,
		JsonFilePath:    wrk.JsonFilePath,
		SummaryFilepath: wrk.SummaryFilepath,
	}
}
