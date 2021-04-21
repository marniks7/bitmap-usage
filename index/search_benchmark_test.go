package index

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
	"bitmap-usage/sample"
	"github.com/rs/zerolog/log"
	"testing"
)

func BenchmarkFindPrice(b *testing.B) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData(cs)
	if err != nil {
		log.Err(err).Msg("Unable to GenerateTestData")
		b.Fail()
		return
	}
	ind := NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	_, err = ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

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
	if price != 0 {

	}
}
