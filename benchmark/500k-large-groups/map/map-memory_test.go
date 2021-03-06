package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/benchmark/samplev2"
	"bitmap-usage/cache"
	indexmap "bitmap-usage/index-map"
	"fmt"
	"github.com/stretchr/testify/assert"
	"os"
	"runtime"
	"runtime/pprof"
	"testing"
)

func TestMapMemoryStats(t *testing.T) {
	if testing.Short() {
		t.Skip("skipping test in short mode.")
	}
	cs := cache.NewCatalogService(cache.NewCatalog())
	after, before := benchmark.ReadMemStatsFuncWithGC(func() {
		sampleService := samplev2.Service{Cs: cs}
		err := sampleService.GenerateTestData5Chars50Offerings()
		assert.NoError(t, err)
	})
	fmt.Println("Sample Data mem stats:")
	benchmark.PrintMemStatsBetween(after, before)

	ind := indexmap.NewService()
	after, before = benchmark.ReadMemStatsFuncWithGC(func() {
		ind.IndexPrices(cs.Catalog)
	})
	fmt.Println("Indexed Prices mem stats:")
	benchmark.PrintMemStatsBetween(after, before)
	fmt.Println("Memory stats after finish of initialization:")
	benchmark.PrintMemStats()
	f, err := os.Create("memory/map-heapdump")
	if err != nil {
		panic(err)
	}

	runtime.GC()
	err = pprof.WriteHeapProfile(f)
	assert.NoError(t, err)
	benchmark.PprofInUseSpaceAsText("memory/map-heapdump", "memory/map-heapdump-inuse-space.txt")
	benchmark.PprofInUseSpaceAsSvg("memory/map-heapdump", "memory/map-heapdump-inuse-space.svg")
	benchmark.PprofInuseObjectsAsText("memory/map-heapdump", "memory/map-heapdump-inuse-objects.txt")
	assert.NotZero(t, len(cs.Catalog.PriceConditions))
	assert.NotZero(t, len(ind.Index))
}
