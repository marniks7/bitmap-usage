package map64

import (
	"bitmap-usage/benchmark/sample64"
	cache64 "bitmap-usage/cache64"
	indexmap64 "bitmap-usage/index-map64"
	validator64 "bitmap-usage/validator64"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareMapIndex(b *testing.B) (*cache64.CatalogService, *indexmap64.MapIndexService) {
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	sampleService := sample64.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(b, err)

	ind := indexmap64.NewService()
	ind.IndexPrices(cs.Catalog)
	return cs, ind
}

func prepareMapIndexOptimized(b *testing.B) (*cache64.CatalogService, *indexmap64.MapIndexService) {
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	sampleService := sample64.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(b, err)

	ind := indexmap64.NewService()
	ind.IndexPrices(cs.Catalog)
	err = validator64.Validate(cs.Catalog)
	assert.NoError(b, err)
	quality, err := ind.Optimize(cs.Catalog)
	assert.NoError(b, err)
	assert.Equal(b, 100.00, quality)
	return cs, ind
}
