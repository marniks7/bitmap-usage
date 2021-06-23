package Prices_487k_PricesPerOffering_9_7k_64

import (
	cache64 "bitmap-usage/cache64"
	indexmap64 "bitmap-usage/index-map64"
	indexroaring64 "bitmap-usage/index-roaring64"
	sample64 "bitmap-usage/sample64"
	validator64 "bitmap-usage/validator64"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareMapIndex(b *testing.B) (*cache64.CatalogService, *indexmap64.MapIndexService) {
	cs := cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
	err := sample64.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexmap64.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	return cs, ind
}

func prepareMapIndexOptimized(b *testing.B) (*cache64.CatalogService, *indexmap64.MapIndexService) {
	cs := cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
	err := sample64.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexmap64.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	err = validator64.Validate(cs.Catalog)
	assert.NoError(b, err)
	quality, err := ind.Optimize(cs.Catalog)
	assert.NoError(b, err)
	assert.Equal(b, 100.00, quality)
	return cs, ind
}

func prepareBitmapIndex(b *testing.B) (*cache64.CatalogService, *indexroaring64.BitmapIndexService) {
	cs := cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
	err := sample64.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexroaring64.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexT(t *testing.T) (*cache64.CatalogService, *indexroaring64.BitmapIndexService) {
	cs := cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
	err := sample64.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := indexroaring64.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}
