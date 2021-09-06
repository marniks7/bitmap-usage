package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/model"
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

	statistics := ind.GenerateBitmapStatistics()
	statistics.Name = "500k-large-groups"
	f, err := os.Create("stats/bitmap-stats.json")
	if err != nil {
		panic(err)
	}
	encoder := json.NewEncoder(f)
	encoder.SetIndent("", "   ")
	err = encoder.Encode(statistics)
	assert.NoError(t, err)
}

func TestBitmap_Optimized_CalculateAndPrintRoaringStats(t *testing.T) {
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
	for _, sb := range ind.Index.CharValuesBitmaps {
		sb.RunOptimize()
	}
	ind.Index.DefaultBitmaps.RunOptimize()
	statistics := ind.GenerateBitmapStatistics()
	statistics.Name = "500k-large-groups"
	f, err := os.Create("stats/bitmap-stats-optimized.json")
	if err != nil {
		panic(err)
	}
	encoder := json.NewEncoder(f)
	encoder.SetIndent("", "   ")
	err = encoder.Encode(statistics)
	assert.NoError(t, err)
}

func TestFindPriceIdWithTrace(t *testing.T) {
	_, ind := prepareBitmapIndexT(t)

	priceIndex, err, bss := ind.FindPriceIndexByWithTraceInfo("00d3a020-08c4-4c94-be0a-e29794756f9e", "group2", "NRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	assert.NoError(t, err)
	assert.NotNil(t, bss)
	assert.NotZero(t, priceIndex)

	f, err := os.Create("stats/data-search-trace.info")
	assert.NoError(t, err)

	encoder := json.NewEncoder(f)
	encoder.SetIndent("", "  ")
	err = encoder.Encode(bss)
}
