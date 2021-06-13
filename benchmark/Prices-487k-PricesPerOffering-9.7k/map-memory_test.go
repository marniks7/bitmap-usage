package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/cache"
	indexmap "bitmap-usage/index-map"
	"bitmap-usage/sample"
	"fmt"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"os"
	"runtime"
	"runtime/pprof"
	"testing"
)

func TestMapMemoryStats(t *testing.T) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	after, before := benchmark.ReadMemStatsFuncWithGC(func() {
		err := sample.GenerateTestData5Chars5Offerings(cs)
		assert.NoError(t, err)
	})
	fmt.Println("Sample Data mem stats:")
	benchmark.PrintMemStatsBetween(after, before)

	ind := indexmap.NewService(log.Logger)
	after, before = benchmark.ReadMemStatsFuncWithGC(func() {
		ind.IndexPrices(cs.Catalog)
	})
	fmt.Println("Indexed Prices mem stats:")
	benchmark.PrintMemStatsBetween(after, before)
	fmt.Println("Memory stats after finish of initialization:")
	benchmark.PrintMemStats()
	f, err := os.Create("map-heapdump")
	if err != nil {
		panic(err)
	}

	runtime.GC()
	err = pprof.WriteHeapProfile(f)
	assert.NoError(t, err)
	benchmark.ReadAndWritePprofTop("map-heapdump", "map-heapdump-top.txt")
	benchmark.ReadAndWritePprofTopWithInuseObjects("map-heapdump", "map-heapdump-top-inuse-objects.txt")
	assert.NotZero(t, len(cs.Catalog.PriceConditions))
	assert.NotZero(t, len(ind.Index))
}
