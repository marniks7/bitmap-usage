package runner

import (
	"bitmap-usage/app"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
	"os"
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

func (app *TestApp) Shutdown() {
	//doesn't matter the error cause process may be finished before
	//goland:noinspection GoUnhandledErrorResult
	app.Cmd.Process.Kill()
}
