package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/benchmark/500k-large-groups/sample"
	"bitmap-usage/cache"
	indexkelindarcolumn "bitmap-usage/index-kelindar-column"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareBitmapIndexV2(b *testing.B) (*cache.CatalogService, *indexkelindarcolumn.Holder) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexkelindarcolumn.NewHolder(log.Logger)
	ind.IndexPricesV2(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexV2T(t *testing.T) (*cache.CatalogService, *indexkelindarcolumn.Holder) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := indexkelindarcolumn.NewHolder(log.Logger)
	ind.IndexPricesV2(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}
