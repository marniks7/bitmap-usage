package bitmap64

import (
	"bitmap-usage/benchmark/500k-large-groups/sample64"
	cache64 "bitmap-usage/cache64"
	indexroaring64 "bitmap-usage/index-roaring64"
	"github.com/stretchr/testify/assert"
	"testing"
)

func prepareBitmapIndex(b *testing.B) (*cache64.CatalogService, *indexroaring64.BitmapIndexService) {
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	err := sample64.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(b, err)

	ind := indexroaring64.NewService()
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}

func prepareBitmapIndexT(t *testing.T) (*cache64.CatalogService, *indexroaring64.BitmapIndexService) {
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	err := sample64.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := indexroaring64.NewService()
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()
	return cs, ind
}
