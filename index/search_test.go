package index

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
	"bitmap-usage/sample"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestFindPriceId(t *testing.T) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	priceIndex, err := ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	assert.NoError(t, err)
	assert.NotZero(t, priceIndex)
}

func TestFindPrice(t *testing.T) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()

	priceIndex, err := ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})
	assert.NoError(t, err)
	assert.NotZero(t, priceIndex)

	priceId, err := ind.FindPriceIdByIndex(priceIndex)
	assert.NoError(t, err)

	price := cs.Catalog.Prices[priceId]
	assert.NotNil(t, price)

}
