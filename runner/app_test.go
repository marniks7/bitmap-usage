package runner

import (
	"os"
	"os/exec"
	"strconv"
	"sync"
	"testing"
	"time"
)

const (
	killAfter = 40 * 1000
)

// TestWrkMapT1C1Multiple ensure that long request is not interrupted despite timeout
func TestWrkMapT1C1Multiple(t *testing.T) {
	app := CreateAppCmdWithConsole()

	cmd := app.Cmd
	cmd.Env = append(cmd.Env, "FIBER=true", "GOGC=1000", "GOMAXPROCS=2")
	app.Start()

	//kill the process to avoid hanging in case of problems with graceful shutdown impl
	go func() {
		<-time.After(killAfter * time.Millisecond)
		//doesn't matter the error cause process may be already stopped (in case of properly implemented graceful shutdown)
		//goland:noinspection GoUnhandledErrorResult
		cmd.Process.Kill()
	}()

	appMake := "make"

	wrkMapT1C1Multiple3 := "wrk-map-t1-c1-multiple"
	arg1 := "-C"
	arg2 := "../"
	arg3 := "-e"
	arg4 := "APP_PORT=" + strconv.Itoa(app.Port)
	wg := sync.WaitGroup{}
	wg.Add(1)
	go executeCommand(&wg, appMake, wrkMapT1C1Multiple3, arg1, arg2, arg3, arg4)
	wg.Wait()
	//in case if kill called - the test will fail
	cmd.Wait()
}

func executeCommand(wg *sync.WaitGroup, app string, args ...string) {
	defer wg.Done()
	cmd := exec.Command(app, args...)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	err := cmd.Run()
	if err != nil {
		panic(err)
	}
}

type Wrk struct {
	Connections int
	Thread      int
	Duration    int
	Multiple    bool
}
