package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark/samplev2"
	"bitmap-usage/cache"
	indexroaring "bitmap-usage/index-roaring"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareBitmapIndex(b *testing.B) (*cache.CatalogService, *indexroaring.BitmapIndexService) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := samplev2.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(b, err)

	ind := indexroaring.NewService()
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexV2(b *testing.B) (*cache.CatalogService, *indexroaring.Holder) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := samplev2.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(b, err)

	ind := indexroaring.NewHolder()
	ind.IndexPricesV2(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexV2T(t *testing.T) (*cache.CatalogService, *indexroaring.Holder) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := samplev2.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	ind := indexroaring.NewHolder()
	ind.IndexPricesV2(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexT(t *testing.T) (*cache.CatalogService, *indexroaring.BitmapIndexService) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := samplev2.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	ind := indexroaring.NewService()
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}
