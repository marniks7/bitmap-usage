package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/cache"
	indexroaring "bitmap-usage/index-roaring"
	"bitmap-usage/sample"
	"fmt"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"os"
	"runtime"
	"runtime/pprof"
	"testing"
)

func TestBitmapMemoryStats(t *testing.T) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	after, before := benchmark.ReadMemStatsFuncWithGC(func() {
		err := sample.GenerateTestData5Chars5Offerings(cs)
		assert.NoError(t, err)
	})
	fmt.Println("Sample Data mem stats:")
	benchmark.PrintMemStatsBetween(after, before)

	ind := indexroaring.NewService(log.Logger)
	after, before = benchmark.ReadMemStatsFuncWithGC(func() {
		ind.IndexPrices(cs.Catalog)
	})
	fmt.Println("Indexed Prices mem stats:")
	benchmark.PrintMemStatsBetween(after, before)

	after, before = benchmark.ReadMemStatsFuncWithGC(func() {
		cs.GeneratePricesByConditionsAndClear()
	})
	fmt.Println("Generated Prices and cleared price conditions mem stats:")
	benchmark.PrintMemStatsBetween(after, before)

	fmt.Println("Memory stats after finish of initialization:")
	runtime.GC()
	runtime.GC()
	runtime.GC()
	benchmark.PrintMemStats()
	f, err := os.Create("bitmap-heapdump")
	if err != nil {
		panic(err)
	}

	//note, that results will be different each time... not 100% objects are sampled
	runtime.GC()
	err = pprof.WriteHeapProfile(f)

	benchmark.ReadAndWritePprofTop("bitmap-heapdump", "bitmap-heapdump-top.txt")
	benchmark.ReadAndWritePprofTopWithInuseObjects("bitmap-heapdump", "bitmap-heapdump-top-inuse-objects.txt")
	assert.NoError(t, err)
	assert.NotZero(t, len(cs.Catalog.Prices))
	assert.NotNil(t, ind.Index)
}
