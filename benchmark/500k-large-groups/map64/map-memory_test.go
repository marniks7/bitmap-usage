package map64

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/benchmark/sample64"
	cache64 "bitmap-usage/cache64"
	indexmap64 "bitmap-usage/index-map64"
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
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	after, before := benchmark.ReadMemStatsFuncWithGC(func() {
		sampleService := sample64.Service{Cs: cs}
		err := sampleService.GenerateTestData5Chars50Offerings()
		assert.NoError(t, err)
	})
	fmt.Println("Sample Data mem stats:")
	benchmark.PrintMemStatsBetween(after, before)

	ind := indexmap64.NewService()
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
	benchmark.PprofInUseSpaceAsText("map-heapdump", "map-heapdump-inuse-space.txt")
	benchmark.PprofInuseObjectsAsText("map-heapdump", "map-heapdump-inuse-objects.txt")
	assert.NotZero(t, len(cs.Catalog.PriceConditions))
	assert.NotZero(t, len(ind.Index))
}
