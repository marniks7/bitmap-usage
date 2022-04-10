package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/benchmark/samplev2"
	"bitmap-usage/cache"
	indexbitsblooms "bitmap-usage/index-bits-and-blooms"
	"fmt"
	"github.com/stretchr/testify/assert"
	"os"
	"runtime"
	"runtime/pprof"
	"testing"
)

func TestBitmapMemoryStats(t *testing.T) {
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

	ind := indexbitsblooms.NewHolder()
	after, before = benchmark.ReadMemStatsFuncWithGC(func() {
		ind.IndexPricesV2(cs.Catalog)
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
	f, err := os.Create("memory/bitmap-heapdump")
	if err != nil {
		panic(err)
	}

	//note, that results will be different each time... not 100% objects are sampled
	runtime.GC()
	err = pprof.WriteHeapProfile(f)

	benchmark.PprofInUseSpaceAsText("memory/bitmap-heapdump", "memory/bitmap-heapdump-inuse-space.txt")
	benchmark.PprofInUseSpaceAsSvg("memory/bitmap-heapdump", "memory/bitmap-heapdump-inuse-space.svg")
	benchmark.PprofInuseObjectsAsText("memory/bitmap-heapdump", "memory/bitmap-heapdump-inuse-objects.txt")
	assert.NoError(t, err)
	assert.NotZero(t, len(cs.Catalog.Prices))
	assert.NotNil(t, ind.Index)
}
