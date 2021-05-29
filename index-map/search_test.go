package indexMap

import (
	"bitmap-usage/cache"
	"bitmap-usage/index"
	"bitmap-usage/model"
	"bitmap-usage/sample"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestFindPrice(t *testing.T) {
	//given
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	//when
	price, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	//then
	log.Info().Int("position", position).Msg("Found price on")
	assert.NoError(t, err)
	assert.NotNil(t, price)
}

func TestFindPriceCompareSearches(t *testing.T) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	price, err, _ := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	assert.NoError(t, err)
	assert.NotNil(t, price)

	priceMapIndex := cs.Catalog.Prices[price.ID]

	indBitmap := index.NewService(log.Logger)
	indBitmap.IndexPrices(cs.Catalog)

	priceBitmapIndex, err := indBitmap.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	assert.NoError(t, err)
	assert.NotZero(t, priceBitmapIndex)

	priceId, err := indBitmap.FindPriceIdByIndex(priceBitmapIndex)
	priceBitmap := cs.Catalog.Prices[priceId]

	assert.Equal(t, priceBitmap, priceMapIndex)
}
