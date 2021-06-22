package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/cache"
	indexroaring "bitmap-usage/index-roaring"
	"bitmap-usage/sample"
	"fmt"
	"github.com/RoaringBitmap/roaring"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"os"
	"testing"
)

func TestBitmap_CalculateAndPrintRoaringStats(t *testing.T) {
	if testing.Short() {
		t.Skip("skipping test in short mode.")
	}
	_, ind := prepareBitmapIndexT(t)

	f, err := os.Create("bitmap-stats.txt")
	if err != nil {
		panic(err)
	}
	var bSum uint64
	var sbSum uint64

	var cnt int
	_, b, sb := benchmark.PrintBitmapStats(f, ind.Index.CharBitmaps, "CharBitmaps")
	bSum += b
	sbSum += sb
	cnt += len(ind.Index.CharBitmaps)
	_, b, sb = benchmark.PrintBitmapStats(f, ind.Index.SpecBitmaps, "SpecBitmaps")
	bSum += b
	sbSum += sb
	cnt += len(ind.Index.SpecBitmaps)
	_, b, sb = benchmark.PrintBitmapStats(f, ind.Index.GroupBitmaps, "GroupBitmaps")
	bSum += b
	sbSum += sb
	cnt += len(ind.Index.GroupBitmaps)
	_, b, sb = benchmark.PrintBitmapStats(f, ind.Index.OfferingBitmaps, "OfferingBitmaps")
	bSum += b
	sbSum += sb
	cnt += len(ind.Index.OfferingBitmaps)
	_, b, sb = benchmark.PrintBitmapStats(f, ind.Index.CharValuesBitmaps, "CharValuesBitmaps")
	bSum += b
	sbSum += sb
	cnt += len(ind.Index.CharValuesBitmaps)
	arr := make([]*roaring.Bitmap, 1)
	arr[0] = ind.Index.DefaultBitmaps
	_, b, sb = benchmark.PrintBitmapStats(f, arr, "DefaultBitmaps")
	bSum += b
	sbSum += sb
	cnt += 1
	fmt.Fprintln(f, "============================== Total ==============================================")
	fmt.Fprintf(f, "Size: %v\n", benchmark.ConvertToHumanReadableSizeUint64(bSum))
	fmt.Fprintf(f, "Serialized Size: %v\n", benchmark.ConvertToHumanReadableSizeUint64(sbSum))
	fmt.Fprintf(f, "Count: %v\n", cnt)
}

func prepareBitmapIndexT(t *testing.T) (*cache.CatalogService, *indexroaring.BitmapIndexService) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := indexroaring.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}
