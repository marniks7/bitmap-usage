package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark/samplev2"
	"bitmap-usage/cache"
	indexbitsblooms "bitmap-usage/index-bits-and-blooms"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareBitmapIndexV2(b *testing.B) (*cache.CatalogService, *indexbitsblooms.Holder) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := samplev2.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(b, err)

	ind := indexbitsblooms.NewHolder()
	ind.IndexPricesV2(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexV2T(t *testing.T) (*cache.CatalogService, *indexbitsblooms.Holder) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := samplev2.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	ind := indexbitsblooms.NewHolder()
	ind.IndexPricesV2(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}
