package bitmap64

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/misc"
	"fmt"
	"github.com/RoaringBitmap/roaring/roaring64"
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

	_, b, sb := benchmark.PrintBitmapStats64(f, ind.Index.SpecBitmaps, "SpecBitmaps")
	bSum += b
	sbSum += sb
	_, b, sb = benchmark.PrintBitmapStats64(f, ind.Index.GroupBitmaps, "GroupBitmaps")
	bSum += b
	sbSum += sb
	_, b, sb = benchmark.PrintBitmapStats64(f, ind.Index.OfferingBitmaps, "OfferingBitmaps")
	bSum += b
	sbSum += sb
	_, b, sb = benchmark.PrintBitmapStats64(f, ind.Index.CharValuesBitmaps, "CharValuesBitmaps")
	bSum += b
	sbSum += sb
	arr := make([]*roaring64.Bitmap, 1)
	arr[0] = ind.Index.DefaultBitmaps
	_, b, sb = benchmark.PrintBitmapStats64(f, arr, "DefaultBitmaps")
	bSum += b
	sbSum += sb
	fmt.Fprintln(f, "============================== Total ==============================================")
	fmt.Fprintf(f, "Size: %v\n", misc.ConvertToHumanReadableSizeUint64(bSum))
	fmt.Fprintf(f, "Serialized Size: %v\n", misc.ConvertToHumanReadableSizeUint64(sbSum))
}
