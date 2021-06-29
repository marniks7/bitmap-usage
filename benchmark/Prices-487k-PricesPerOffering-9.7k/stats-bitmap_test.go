package Prices_487k_PricesPerOffering_9_7k

import (
	"encoding/json"
	"github.com/stretchr/testify/assert"
	"os"
	"testing"
)

func TestBitmap_CalculateAndPrintRoaringStats(t *testing.T) {
	if testing.Short() {
		t.Skip("skipping test in short mode.")
	}
	_, ind := prepareBitmapIndexT(t)

	for _, sb := range ind.Index.SpecBitmaps {
		sb.RunOptimize()
	}
	for _, sb := range ind.Index.OfferingBitmaps {
		sb.RunOptimize()
	}
	for _, sb := range ind.Index.GroupBitmaps {
		sb.RunOptimize()
	}

	for _, sb := range ind.Index.CharBitmaps {
		sb.RunOptimize()
	}
	ind.Index.DefaultBitmaps.RunOptimize()
	statistics := ind.GenerateBitmapStatistics()
	statistics.Name = "Prices-487k-PricesPerOffering-9.7k"
	f, err := os.Create("stats/bitmap-stats.json")
	if err != nil {
		panic(err)
	}
	encoder := json.NewEncoder(f)
	encoder.SetIndent("", "   ")
	err = encoder.Encode(statistics)
	assert.NoError(t, err)
}
