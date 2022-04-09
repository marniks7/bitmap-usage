package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark/500k-large-groups/sample"
	"bitmap-usage/cache"
	indexmap "bitmap-usage/index-map"
	"bitmap-usage/validator"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareMapIndex(b *testing.B) (*cache.CatalogService, *indexmap.MapIndexService) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := sample.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(b, err)

	ind := indexmap.NewService()
	ind.IndexPrices(cs.Catalog)
	return cs, ind
}

func prepareMapIndexT(t *testing.T) (*cache.CatalogService, *indexmap.MapIndexService) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := sample.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	ind := indexmap.NewService()
	ind.IndexPrices(cs.Catalog)
	return cs, ind
}

func prepareMapIndexOptimized(b *testing.B) (*cache.CatalogService, *indexmap.MapIndexService) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := sample.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(b, err)

	ind := indexmap.NewService()
	ind.IndexPrices(cs.Catalog)
	err = validator.Validate(cs.Catalog)
	assert.NoError(b, err)
	quality, err := ind.Optimize(cs.Catalog)
	assert.NoError(b, err)
	assert.Equal(b, 100.00, quality)
	return cs, ind
}
