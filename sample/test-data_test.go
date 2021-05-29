package sample

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
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
