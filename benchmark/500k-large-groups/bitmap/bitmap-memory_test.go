package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/benchmark/500k-large-groups/sample"
	"bitmap-usage/cache"
	indexroaring "bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"fmt"
	"github.com/rs/zerolog/log"
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

func TestBitmapMemoryStats_Search(t *testing.T) {
	if testing.Short() {
		t.Skip("skipping test in short mode.")
	}
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := indexroaring.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	_, err = ind.RunOptimizeBasedOnStats()
	assert.NoError(t, err)
	cs.GeneratePricesByConditionsAndClear()

	runtime.GC()
	runtime.GC()
	runtime.GC()

	var price *model.Price
	for i := 0; i < 100000; i++ {
		priceIndex := findPrice3824Position(ind)
		priceId, err := ind.FindPriceIdByIndex(priceIndex)
		if err != nil {
			t.FailNow()
		}
		price = cs.Catalog.Prices[priceId]
	}
	if price == nil {
		t.Fail()
	}

	f, err := os.Create("memory/bitmap-heapdump-search")
	if err != nil {
		panic(err)
	}

	//note, that results will be different each time... not 100% objects are sampled
	err = pprof.WriteHeapProfile(f)

	benchmark.PprofAllocSpaceAsText("memory/bitmap-heapdump-search", "memory/bitmap-heapdump-search-alloc-space.txt")
	benchmark.PprofAllocObjectsAsText("memory/bitmap-heapdump-search", "memory/bitmap-heapdump-search-alloc-objects.txt")
	benchmark.PprofAllocSpaceAsSvg("memory/bitmap-heapdump-search", "memory/bitmap-heapdump-search-alloc-space.svg")
	benchmark.PprofAllocSpaceLinesAsSvg("memory/bitmap-heapdump-search", "memory/bitmap-heapdump-search-alloc-space-lines.svg")
	assert.NoError(t, err)
	assert.NotZero(t, len(cs.Catalog.Prices))
	assert.NotNil(t, ind.Index)
}

func TestBitmapMemoryStats_SearchV2(t *testing.T) {
	if testing.Short() {
		t.Skip("skipping test in short mode.")
	}
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := indexroaring.NewHolder(log.Logger)
	err = ind.IndexPricesV2(cs.Catalog)
	assert.NoError(t, err)
	_, err = ind.RunOptimizeBasedOnStats()
	assert.NoError(t, err)
	cs.GeneratePricesByConditionsAndClear()

	runtime.GC()
	runtime.GC()
	runtime.GC()

	var price *model.Price
	for i := 0; i < 100000; i++ {
		priceIndex := findPrice3824PositionV2(ind)
		priceId, err := ind.FindPriceIdByIndex(priceIndex)
		if err != nil {
			t.FailNow()
		}
		price = cs.Catalog.Prices[priceId]
	}
	if price == nil {
		t.Fail()
	}

	f, err := os.Create("memory/bitmap-heapdump-searchv2")
	if err != nil {
		panic(err)
	}

	//note, that results will be different each time... not 100% objects are sampled
	err = pprof.WriteHeapProfile(f)

	benchmark.PprofAllocSpaceAsText("memory/bitmap-heapdump-searchv2", "memory/bitmap-heapdump-searchv2-alloc-space.txt")
	benchmark.PprofAllocObjectsAsText("memory/bitmap-heapdump-searchv2", "memory/bitmap-heapdump-searchv2-alloc-objects.txt")
	benchmark.PprofAllocSpaceAsSvg("memory/bitmap-heapdump-searchv2", "memory/bitmap-heapdump-searchv2-alloc-space.svg")
	benchmark.PprofAllocSpaceLinesAsSvg("memory/bitmap-heapdump-searchv2", "memory/bitmap-heapdump-searchv2-alloc-space-lines.svg")
	assert.NoError(t, err)
	assert.NotZero(t, len(cs.Catalog.Prices))
	assert.NotNil(t, ind.Index)
}
