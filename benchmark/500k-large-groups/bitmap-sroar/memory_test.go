package bitmapsroar

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/benchmark/sample64"
	cache64 "bitmap-usage/cache64"
	indexsroar "bitmap-usage/index-sroar"
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
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	after, before := benchmark.ReadMemStatsFuncWithGC(func() {
		sampleService := sample64.Service{Cs: cs}
		err := sampleService.GenerateTestData5Chars50Offerings()
		assert.NoError(t, err)
	})
	fmt.Println("Sample Data mem stats:")
	benchmark.PrintMemStatsBetween(after, before)

	ind := indexsroar.NewService()
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

	benchmark.PprofInUseSpaceAsText("bitmap-heapdump", "bitmap-heapdump-inuse-space.txt")
	benchmark.PprofInuseObjectsAsText("bitmap-heapdump", "bitmap-heapdump-inuse-objects.txt")
	assert.NoError(t, err)
	assert.NotZero(t, len(cs.Catalog.Prices))
	assert.NotNil(t, ind.Index)
}
