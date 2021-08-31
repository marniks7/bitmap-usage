package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/cache"
	indexmap "bitmap-usage/index-map"
	indexroaring "bitmap-usage/index-roaring"
	"bitmap-usage/sample"
	"bitmap-usage/validator"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareMapIndex(b *testing.B) (*cache.CatalogService, *indexmap.MapIndexService) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexmap.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	return cs, ind
}

func prepareMapIndexOptimized(b *testing.B) (*cache.CatalogService, *indexmap.MapIndexService) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexmap.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	err = validator.Validate(cs.Catalog)
	assert.NoError(b, err)
	quality, err := ind.Optimize(cs.Catalog)
	assert.NoError(b, err)
	assert.Equal(b, 100.00, quality)
	return cs, ind
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
