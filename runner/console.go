package runner

import (
	"bitmap-usage/handlers"
	"bitmap-usage/runner/wrk"
	"context"
	"github.com/rs/zerolog/log"
	"net"
	"net/http"
	"os"
	"os/exec"
	"strconv"
	"sync"
	"time"
)

type TestApp struct {
	Cmd  *exec.Cmd
	Port int
	Url  string
}

// execute - main executor: run application and run WRK load
func execute(app Application, wrk wrk.Wrk) {
	wg := sync.WaitGroup{}
	wg.Add(1)
	killTime := time.Duration(wrk.Duration) + 20*time.Second
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

// Start app and become ready
func (app *TestApp) Start() {
	err := app.Cmd.Start()
	if err != nil {
		panic(err)
	}

	req, err := http.NewRequest("GET", app.Url+"/ready", nil)
	if err != nil {
		panic(err)
	}
	client := http.Client{}
	for {
		_, err := client.Do(req)
		if err != nil {
			time.Sleep(10 * time.Millisecond)
		} else {
			return
		}
	}
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

// CreateAppCmd
// check https://github.com/golang/go/blob/master/src/os/exec/exec_test.go for examples
func CreateAppCmd() *TestApp {
	cmd := exec.Command(os.Args[0], "-test.run=TestStartApp")
	port, err := GetFreePort()
	if err != nil {
		panic(err)
	}
	portStr := strconv.Itoa(port)
	cmd.Env = append(os.Environ(), "TEST_HELPER_PROCESS=1", "ADDR=:"+portStr)
	return &TestApp{Cmd: cmd, Port: port, Url: "http://localhost:" + portStr}
}

// CreateAppCmdWithConsole - use current stdin\out\err and attach to the cmd
// check https://github.com/golang/go/blob/master/src/os/exec/exec_test.go for examples
func CreateAppCmdWithConsole() *TestApp {
	cmd := exec.Command(os.Args[0], "-test.run=TestStartApp")
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	port, err := GetFreePort()
	if err != nil {
		panic(err)
	}
	portStr := strconv.Itoa(port)
	cmd.Env = append(os.Environ(), "TEST_HELPER_PROCESS=1", "ADDR=:"+portStr)
	return &TestApp{Cmd: cmd, Port: port, Url: "http://localhost:" + portStr}
}

func CreateAppCmdWithConsoleDocker() *TestApp {
	port, err := GetFreePort()
	if err != nil {
		panic(err)
	}
	portStr := strconv.Itoa(port)
	cmd := exec.Command("docker", "run", "-p", portStr+":8080", "bitmap-usage")
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	cmd.Env = append(os.Environ(), "TEST_HELPER_PROCESS=1")
	return &TestApp{Cmd: cmd, Port: port, Url: "http://localhost:" + portStr}
}

// GetFreePort to be able to run on machine concurrently
func GetFreePort() (int, error) {
	addr, err := net.ResolveTCPAddr("tcp", "localhost:0")
	if err != nil {
		return 0, err
	}

	l, err := net.ListenTCP("tcp", addr)
	if err != nil {
		return 0, err
	}
	//goland:noinspection GoUnhandledErrorResult
	defer l.Close()
	return l.Addr().(*net.TCPAddr).Port, nil
}
