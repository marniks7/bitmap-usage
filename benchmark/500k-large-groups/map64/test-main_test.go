package map64

import (
	"os"
	"testing"
)

func TestMain(m *testing.M) {

	//another option - use '-test.memprofilerate=1' when running the tests,
	//this TestMain allows to run from IDE without any changes.
	//But this main is executed for any test (including benchmarks) in the folder and affects it performance

	//sample all allocated objects
	//runtime.MemProfileRate = 1
	exitVal := m.Run()
	os.Exit(exitVal)
}
