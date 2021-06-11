package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/cache"
	"bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"bitmap-usage/sample"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func BenchmarkBitmap_FindPriceIndexId_Conditions8(b *testing.B) {
	_, ind := prepareBitmapIndex(b)

	b.ResetTimer()
	var price uint32
	for i := 0; i < b.N; i++ {
		price, _ = ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
				{"Router", "Not Included"}})
	}
	if price == 0 {
		b.Fail()
	}
}

func BenchmarkBitmap_FindPrice_Conditions8(b *testing.B) {
	cs, ind := prepareBitmapIndex(b)

	b.ResetTimer()
	var priceIndex uint32
	var price *model.Price
	for i := 0; i < b.N; i++ {
		priceIndex, _ = ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
				{"Router", "Not Included"}})
		priceId, err := ind.FindPriceIdByIndex(priceIndex)
		if err != nil {
			b.FailNow()
		}
		price = cs.Catalog.Prices[priceId]
	}
	if price == nil {
		b.FailNow()
	}
}

func BenchmarkBitmap_FindPrice_Conditions8_MultiplePricesErr(b *testing.B) {
	_, ind := prepareBitmapIndex(b)

	b.ResetTimer()
	var errFindPrice error
	for i := 0; i < b.N; i++ {
		_, errFindPrice = ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"}})
		if errFindPrice == nil {
			b.FailNow()
		}
	}
	if errFindPrice == nil {
		b.FailNow()
	}
}

func prepareBitmapIndex(b *testing.B) (*cache.CatalogService, *indexroaring.BitmapIndexService) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexroaring.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}
