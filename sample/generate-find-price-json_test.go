package sample

import (
	"bitmap-usage/model"
	"fmt"
	"testing"
)

func TestGenerateJson(t *testing.T) {
	GenerateJson(1)
	GenerateJson(5)
	GenerateJson(1000)
	GenerateJson(10000)
	GenerateJson(100000)
}

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
	fmt.Println("Maximum Possible PriceConditions For Char Conditions", cnt)
	h := &Holder{
		prices: make([]*model.PriceConditions, 0, cnt),
	}
	cache := make([]string, len(chars))
	h.generatePrice(chars, cache, 0, "offering")
	fmt.Println("PriceConditions generated", len(h.prices))
	if cnt != len(h.prices) {
		t.Error("Generated prices is not as expected", "expected", cnt, "actual", len(h.prices))
		t.Fail()
	}
}
