package runner

import (
	"bitmap-usage/app"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
	"net"
	"net/http"
	"os"
	"os/exec"
	"strconv"
	"testing"
	"time"
)

// Add common functionality to tests
func TestMain(m *testing.M) {
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stdout, TimeFormat: time.RFC3339})
	code := m.Run()
	os.Exit(code)
}

// TestStartApp - start real fully functional app
func TestStartApp(t *testing.T) {
	if os.Getenv("TEST_HELPER_PROCESS") != "1" {
		return
	}
	app.StartApp()
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

type TestApp struct {
	Cmd  *exec.Cmd
	Port int
	Url  string
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

func (app *TestApp) Shutdown() {
	//doesn't matter the error cause process may be finished before
	//goland:noinspection GoUnhandledErrorResult
	app.Cmd.Process.Kill()
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
