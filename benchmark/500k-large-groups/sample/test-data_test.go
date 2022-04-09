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
	//given
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
	//when
	h.generatePrice(chars, charsCache, 0, "offering")

	//then
	fmt.Println("PriceCondition generated", len(h.prices))
	assert.Equal(t, cnt, len(h.prices), "Generated prices amount are not as expected")
}

func TestGenerateTestData(t *testing.T) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	fmt.Println("Total amount of generated prices", len(cs.Catalog.PriceConditions))
}
func TestA(t *testing.T) {
	fmt.Println(500 << 20 / 1024 / 1024)
}

func TestMapOfferingIndex_FindPrice_3824Position(t *testing.T) {
	//given
	_, ind := prepareCatalogAndMap(t)

	//when
	price, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "group2", "NRC",
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

func TestMapOfferingIndex_FindPrice_11Position(t *testing.T) {
	//given
	_, ind := prepareCatalogAndMap(t)

	//when
	price, err, position := ind.FindPriceBy("a38e432c-3965-4c74-8251-aa640002d2b2", "group1", "MRC",
		[]model.CharValue{{"Term", "12"},
			{"B2B Traffic", "1GB"},
			{"B2B Bandwidth", "30Mbps"},
			{"VPN", "ad796998-f1c7-4fcc-9a6b-1b33042fb375"},
			{"Router", "Included"}})

	//then
	assert.NoError(t, err)
	assert.NotNil(t, price)
	assert.Equal(t, 11, position)
}

func TestMapOfferingIndex_FindPrice_9701Position(t *testing.T) {
	//given
	_, ind := prepareCatalogAndMap(t)

	//when
	price, err, position := ind.FindPriceBy("85dc39cd-52dc-49fa-9d00-051a1ff15cd6", "group2", "MRC",
		[]model.CharValue{{"Term", "60"},
			{"B2B Traffic", "100GB"},
			{"B2B Bandwidth", "75Mbps"},
			{"VPN", "170954ea-687d-42d2-9c04-7807845c66ee"},
			{"Router", "Included"}})

	//then
	assert.NoError(t, err)
	assert.NotNil(t, price)
	assert.Equal(t, 9701, position)
}

func prepareCatalogAndMap(t *testing.T) (*cache.CatalogService, *indexMap.MapIndexService) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	ind := indexMap.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	return cs, ind
}

func TestMapOfferingIndex_FindPrice_Optimized(t *testing.T) {
	//given
	cs, ind := prepareCatalogAndMap(t)
	err := validator.Validate(cs.Catalog)
	assert.NoError(t, err)
	quality, err := ind.Optimize(cs.Catalog)
	assert.NoError(t, err)
	assert.Equal(t, 100.00, quality)

	//when
	price, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "group2", "NRC",
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
	//given
	_, ind := prepareCatalogAndMap(t)

	//when
	price, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "group5", "NRC",
		[]model.CharValue{{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"}})

	//then
	assert.Error(t, err)
	assert.ErrorIs(t, err, indexMap.ErrUnableToFindPriceMoreThenOneNoDefault)
	assert.Nil(t, price)
	assert.Equal(t, -1, position)
}
