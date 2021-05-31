package sample

import (
	"bitmap-usage/cache"
	indexMap "bitmap-usage/index-map"
	"bitmap-usage/model"
	"bitmap-usage/validator"
	"fmt"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestGeneratePrice(t *testing.T) {
	chars := []string{"Term",
		"B2B Traffic", "VPN", "B2B Bandwidth", "Router"}
	cnt := 1
	for _, cc := range chars {
		if values, ok := ValuePool[cc]; ok {
			cnt *= len(values)
		} else {
			fmt.Println("Unable to find values for Char", "Char", cc)
			return
		}
	}
	fmt.Println("Maximum Possible PriceCondition For Char Conditions", cnt)
	h := &Holder{
		prices: make([]*model.PriceCondition, 0, cnt),
	}
	charsCache := make([]string, len(chars))
	h.generatePrice(chars, charsCache, 0, "offering")
	fmt.Println("PriceCondition generated", len(h.prices))
	assert.Equal(t, cnt, len(h.prices), "Generated prices amount are not as expected")
}

func TestGenerateTestData(t *testing.T) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	fmt.Println("Total amount of generated prices", len(cs.Catalog.PriceConditions))
}

func TestMapOfferingIndex_FindPrice(t *testing.T) {
	//given
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := indexMap.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	//when
	price, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	//then
	assert.NoError(t, err)
	assert.NotNil(t, price)
	assert.Equal(t, 3824, position)
}

func TestMapOfferingIndex_FindPrice_Optimized(t *testing.T) {
	//given
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := indexMap.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	err = validator.Validate(cs.Catalog)
	assert.NoError(t, err)
	quality, err := ind.Optimize(cs.Catalog)
	assert.NoError(t, err)
	assert.Equal(t, 100.00, quality)

	//when
	price, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	//then
	log.Info().Int("position", position).Msg("Found price on")
	assert.NoError(t, err)
	assert.NotNil(t, price)
}

func TestMapOfferingIndex_FindPrice_MultiplePricesErr(t *testing.T) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := indexMap.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	p, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"}})

	assert.Error(t, err)
	assert.Nil(t, p)
	assert.Equal(t, -1, position)
}
