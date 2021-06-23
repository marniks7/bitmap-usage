package Prices_487k_PricesPerOffering_9_7k_64

import (
	"bitmap-usage/benchmark"
	cache64 "bitmap-usage/cache64"
	indexmap64 "bitmap-usage/index-map64"
	sample64 "bitmap-usage/sample64"
	"fmt"
	"github.com/rs/zerolog/log"
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
	cs := cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
	after, before := benchmark.ReadMemStatsFuncWithGC(func() {
		err := sample64.GenerateTestData5Chars5Offerings(cs)
		assert.NoError(t, err)
	})
	fmt.Println("Sample Data mem stats:")
	benchmark.PrintMemStatsBetween(after, before)

	ind := indexmap64.NewService(log.Logger)
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
