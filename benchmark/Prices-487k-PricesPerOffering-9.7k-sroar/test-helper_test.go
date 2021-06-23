package Prices_487k_PricesPerOffering_9_7k_sroar

import (
	cache64 "bitmap-usage/cache64"
	indexsroar "bitmap-usage/index-sroar"
	sample64 "bitmap-usage/sample64"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareBitmapIndex(b *testing.B) (*cache64.CatalogService, *indexsroar.BitmapIndexService) {
	cs := cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
	err := sample64.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexsroar.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexT(t *testing.T) (*cache64.CatalogService, *indexsroar.BitmapIndexService) {
	cs := cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
	err := sample64.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := indexsroar.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}
