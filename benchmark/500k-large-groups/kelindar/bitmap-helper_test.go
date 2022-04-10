package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark/samplev2"
	"bitmap-usage/cache"
	indexkelindar "bitmap-usage/index-kelindar"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareBitmapIndexV2(b *testing.B) (*cache.CatalogService, *indexkelindar.Holder) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := samplev2.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(b, err)

	ind := indexkelindar.NewHolder()
	ind.IndexPricesV2(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexV2T(t *testing.T) (*cache.CatalogService, *indexkelindar.Holder) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := samplev2.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	ind := indexkelindar.NewHolder()
	ind.IndexPricesV2(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}
