package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/cache"
	"bitmap-usage/index-map"
	"bitmap-usage/model"
	"bitmap-usage/sample"
	"bitmap-usage/validator"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func BenchmarkMapOfferingIndex_FindPrice_Conditions8(b *testing.B) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexMap.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()

	_, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	assert.NoError(b, err)
	assert.Equal(b, 3824, position)

	b.ResetTimer()
	var price *model.PriceCondition
	for i := 0; i < b.N; i++ {
		price, _, _ = ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
				{"Router", "Not Included"}})
	}
	if price == nil {
		b.Fail()
	}
}

func BenchmarkMapOfferingIndex_Optimized_FindPrice_Conditions8_3824position(b *testing.B) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexMap.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	err = validator.Validate(cs.Catalog)
	assert.NoError(b, err)
	quality, err := ind.Optimize(cs.Catalog)
	assert.NoError(b, err)
	assert.Equal(b, 100.00, quality)

	cs.GeneratePricesByConditions()

	_, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	assert.NoError(b, err)
	assert.Equal(b, 3824, position)

	b.ResetTimer()
	var price *model.PriceCondition
	for i := 0; i < b.N; i++ {
		price, _, _ = ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
				{"Router", "Not Included"}})
	}
	if price == nil {
		b.Fail()
	}
}

//func BenchmarkMapOfferingIndex_Optimized_FindPrice_Conditions8_WorstCase(b *testing.B) {
//	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
//	err := sample.GenerateTestData5Chars5Offerings(cs)
//	assert.NoError(b, err)
//
//	ind := indexMap.NewService(log.Logger)
//	ind.IndexPrices(cs.Catalog)
//	err = validator.Validate(cs.Catalog)
//	assert.NoError(b, err)
//	quality, err := ind.Optimize(cs.Catalog)
//	assert.NoError(b, err)
//	assert.Equal(b, 100.00, quality)
//
//	cs.GeneratePricesByConditions()
//
//	_, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
//		[]model.CharValue{{"Term", "24"},
//			{"B2B Traffic", "5GB"},
//			{"B2B Bandwidth", "900Mbps"},
//			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
//			{"Router", "Not Included"}})
//
//	assert.NoError(b, err)
//	assert.Equal(b, 3824, position)
//
//	b.ResetTimer()
//	var price *model.PriceCondition
//	for i := 0; i < b.N; i++ {
//		price, _, _ = ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
//			[]model.CharValue{{"Term", "24"},
//				{"B2B Traffic", "5GB"},
//				{"B2B Bandwidth", "900Mbps"},
//				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"}})
//	}
//	if price == nil {
//		b.Fail()
//	}
//}
