package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/model"
	"github.com/stretchr/testify/assert"
	"os"
	"runtime"
	"runtime/pprof"
	"testing"
)

func TestFindPrice_3824position_CpuProfiling(t *testing.T) {
	if testing.Short() {
		t.Skip("skipping test in short mode.")
	}
	cs, ind := prepareBitmapIndexV2T(t)
	runtime.GC()

	f, err := os.Create("cpu/cpu.pprof")
	if err != nil {
		assert.NoError(t, err)
	}
	defer f.Close() // error handling omitted for example
	if err := pprof.StartCPUProfile(f); err != nil {
		assert.NoError(t, err)
	}
	var price *model.Price
	for i := 0; i < 50000; i++ {
		priceIndex := findPrice3824PositionV2(ind)
		priceId, err := ind.FindPriceIdByIndex(priceIndex)
		if err != nil {
			t.FailNow()
		}
		price = cs.Catalog.Prices[priceId]
	}
	if price == nil {
		t.FailNow()
	}

	pprof.StopCPUProfile()
	benchmark.PprofCpuAsSvg("cpu/cpu.pprof", "cpu/cpu.svg")
	benchmark.PprofCpuLinesAsSvg("cpu/cpu.pprof", "cpu/cpu-lines.svg")
}
