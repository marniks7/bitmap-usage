package runner

import (
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

// TestWrkMapT1C1Multiple ensure that long request is not interrupted despite timeout
func TestWrkMapT1C1Multiple(t *testing.T) {
	duration := 10 * time.Second
	wrkc := []Wrk{
		{Connections: 2,
			Threads: 2, Duration: duration,
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
			Path:   "/v1/search/bitmap/prices"},
		{Connections: 5,
			Threads: 2, Duration: duration,
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
			Path:   "/v1/search/bitmap/prices"},
		{Connections: 10,
			Threads: 2, Duration: duration,
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
			Path:   "/v1/search/bitmap/prices"},
		{Connections: 15,
			Threads: 2, Duration: duration,
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
			Path:   "/v1/search/bitmap/prices"},
		{Connections: 20,
			Threads: 2, Duration: duration,
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
			Path:   "/v1/search/bitmap/prices"},
		{Connections: 25,
			Threads: 2, Duration: duration,
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
			Path:   "/v1/search/bitmap/prices"},
		{Connections: 30,
			Threads: 2, Duration: duration,
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
			Path:   "/v1/search/bitmap/prices"},
	}

	wg := sync.WaitGroup{}
	for _, wrk := range wrkc {
		execute(wrk, &wg)
	}

}

func execute(wrk Wrk, wg *sync.WaitGroup) {
	wg.Add(1)
	killTime := wrk.Duration + 10*time.Second
	timeoutCtx, cancelFunc := context.WithTimeout(context.Background(), killTime)
	defer cancelFunc()
	app := CreateAppCmdWithConsole()

	cmd := app.Cmd
	cmd.Env = append(cmd.Env, "FIBER=true", "GOGC=1000", "GOMAXPROCS=2")
	//kill the process to avoid hanging in case of problems
	go func() {
		<-time.After(killTime)
		//doesn't matter the error cause process may be already stopped (in case of properly implemented graceful shutdown)
		//goland:noinspection GoUnhandledErrorResult

		cmd.Process.Kill()
	}()
	app.Start()
	wrk.Port = app.Port
	wrkBitmap := wrk.Convert()
	go executeCommand(timeoutCtx, wg, "./wrk",
		wrkBitmap.Threads,
		wrkBitmap.Connections,
		wrkBitmap.Duration,
		"--latency",
		"-s", wrkBitmap.Script,
		wrkBitmap.Path)
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

type Wrk struct {
	Connections int
	Threads     int
	Duration    time.Duration
	Script      string
	Path        string
	Port        int
	Multiple    bool
}

func (wrk Wrk) Convert() WrkConverted {
	return WrkConverted{Connections: "-c" + strconv.Itoa(wrk.Connections),
		Threads:  "-t" + strconv.Itoa(wrk.Threads),
		Duration: "-d" + strconv.Itoa(int(wrk.Duration.Seconds())),
		Script:   wrk.Script,
		Path:     "http://localhost:" + strconv.Itoa(wrk.Port) + wrk.Path,
		Multiple: false,
	}
}

type WrkConverted struct {
	Connections string
	Threads     string
	Duration    string
	Script      string
	Path        string
	Multiple    bool
}
