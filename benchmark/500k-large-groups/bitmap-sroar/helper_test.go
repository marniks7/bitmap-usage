package bitmapsroar

import (
	"bitmap-usage/benchmark/sample64"
	cache64 "bitmap-usage/cache64"
	indexsroar "bitmap-usage/index-sroar"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareBitmapIndex(b *testing.B) (*cache64.CatalogService, *indexsroar.BitmapIndexService) {
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	sampleService := sample64.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(b, err)

	ind := indexsroar.NewService()
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexT(t *testing.T) (*cache64.CatalogService, *indexsroar.BitmapIndexService) {
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	sampleService := sample64.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	ind := indexsroar.NewService()
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}
