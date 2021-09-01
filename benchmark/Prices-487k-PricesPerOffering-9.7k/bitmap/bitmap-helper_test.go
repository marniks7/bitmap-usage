package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/cache"
	indexroaring "bitmap-usage/index-roaring"
	"bitmap-usage/sample"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareBitmapIndex(b *testing.B) (*cache.CatalogService, *indexroaring.BitmapIndexService) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexroaring.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexV2(b *testing.B) (*cache.CatalogService, *indexroaring.Holder) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexroaring.NewHolder(log.Logger)
	ind.IndexPricesV2(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
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