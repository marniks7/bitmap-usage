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
	cs, ind := prepareBitmapIndexT(t)
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
	for i := 0; i < 500000; i++ {
		priceIndex := findPrice3824Position(ind)
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

func TestFindPriceV2_3824position_CpuProfiling(t *testing.T) {
	if testing.Short() {
		t.Skip("skipping test in short mode.")
	}
	cs, ind := prepareBitmapIndexV2T(t)
	runtime.GC()

	f, err := os.Create("cpu/cpuv2.pprof")
	if err != nil {
		assert.NoError(t, err)
	}
	defer f.Close() // error handling omitted for example
	if err := pprof.StartCPUProfile(f); err != nil {
		assert.NoError(t, err)
	}
	var price *model.Price
	for i := 0; i < 500000; i++ {
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
	benchmark.PprofCpuAsSvg("cpu/cpuv2.pprof", "cpu/cpuv2.svg")
	benchmark.PprofCpuLinesAsSvg("cpu/cpuv2.pprof", "cpu/cpuv2-lines.svg")
}

func TestFindPriceV2_3824position_OptStr_CpuProfiling(t *testing.T) {
	if testing.Short() {
		t.Skip("skipping test in short mode.")
	}
	cs, ind := prepareBitmapIndexV2T(t)
	err := ind.RunOptimizeBitmapsInternalStructure()
	assert.NoError(t, err)
	runtime.GC()

	f, err := os.Create("cpu/cpuv2-optstr.pprof")
	if err != nil {
		assert.NoError(t, err)
	}
	defer f.Close() // error handling omitted for example
	if err := pprof.StartCPUProfile(f); err != nil {
		assert.NoError(t, err)
	}
	var price *model.Price
	for i := 0; i < 500000; i++ {
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
	benchmark.PprofCpuAsSvg("cpu/cpuv2-optstr.pprof", "cpu/cpuv2-optstr.svg")
	benchmark.PprofCpuLinesAsSvg("cpu/cpuv2-optstr.pprof", "cpu/cpuv2-optstr-lines.svg")
}
