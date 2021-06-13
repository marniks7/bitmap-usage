package Prices_487k_PricesPerOffering_9_7k

import (
	"os"
	"runtime"
	"testing"
)

func TestMain(m *testing.M) {
	//see all allocated objects
	//another option - use '-test.memprofilerate=1' when running the tests,
	//but this TestMain allows to run from IDE without any changes.
	runtime.MemProfileRate = 1
	exitVal := m.Run()
	os.Exit(exitVal)
}
