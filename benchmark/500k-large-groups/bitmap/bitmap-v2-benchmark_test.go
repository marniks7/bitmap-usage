package Prices_487k_PricesPerOffering_9_7k

import (
	"bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"github.com/stretchr/testify/assert"
	"runtime"
	"testing"
)

func BenchmarkFindPriceV2_11position(b *testing.B) {
	cs, ind := prepareBitmapIndexV2(b)

	b.ResetTimer()
	var price *model.Price
	for i := 0; i < b.N; i++ {
		priceIndex, err := ind.FindPriceIndexBy("a38e432c-3965-4c74-8251-aa640002d2b2", "group1", "MRC",
			[]model.CharValue{{"Term", "12"},
				{"B2B Traffic", "1GB"},
				{"B2B Bandwidth", "30Mbps"},
				{"VPN", "ad796998-f1c7-4fcc-9a6b-1b33042fb375"},
				{"Router", "Included"}})
		assert.NoError(b, err)
		priceId, err := ind.FindPriceIdByIndex(priceIndex)
		if err != nil {
			b.FailNow()
		}
		price = cs.Catalog.Prices[priceId]
	}
	if price == nil {
		b.Fail()
	}
}

func BenchmarkFindPriceV2_3824position(b *testing.B) {
	cs, ind := prepareBitmapIndexV2(b)
	runtime.GC()
	b.ResetTimer()
	b.ReportAllocs()
	var price *model.Price
	for i := 0; i < b.N; i++ {
		priceIndex := findPrice3824PositionV2(ind)
		priceId, err := ind.FindPriceIdByIndex(priceIndex)
		if err != nil {
			b.FailNow()
		}
		price = cs.Catalog.Prices[priceId]
	}
	if price == nil {
		b.FailNow()
	}
}

func BenchmarkFindPriceV2_3824position_OptStr(b *testing.B) {
	cs, ind := prepareBitmapIndexV2(b)
	err := ind.RunOptimizeBitmapsInternalStructure()
	assert.NoError(b, err)

	runtime.GC()
	b.ResetTimer()
	b.ReportAllocs()
	var price *model.Price
	for i := 0; i < b.N; i++ {
		priceIndex := findPrice3824PositionV2(ind)
		priceId, err := ind.FindPriceIdByIndex(priceIndex)
		if err != nil {
			b.FailNow()
		}
		price = cs.Catalog.Prices[priceId]
	}
	if price == nil {
		b.FailNow()
	}
}

func BenchmarkFindPriceV2_3824position_OptStats(b *testing.B) {
	cs, ind := prepareBitmapIndexV2(b)
	_, err := ind.RunOptimizeBasedOnStats()
	assert.NoError(b, err)

	b.ResetTimer()
	var price *model.Price
	for i := 0; i < b.N; i++ {
		priceIndex := findPrice3824PositionV2(ind)
		priceId, err := ind.FindPriceIdByIndex(priceIndex)
		if err != nil {
			b.FailNow()
		}
		price = cs.Catalog.Prices[priceId]
	}
	if price == nil {
		b.Fail()
	}
}

func findPrice3824PositionV2(ind *indexroaring.Holder) uint32 {
	priceIndex, err := ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "group2", "NRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})
	if err != nil {
		panic(err)
	}
	return priceIndex
}

func BenchmarkFindPriceV2_3824position_OptAll(b *testing.B) {
	cs, ind := prepareBitmapIndexV2(b)
	err := ind.RunOptimize()
	assert.NoError(b, err)
	b.ResetTimer()
	var price *model.Price
	for i := 0; i < b.N; i++ {
		priceIndex := findPrice3824PositionV2(ind)
		priceId, err := ind.FindPriceIdByIndex(priceIndex)
		if err != nil {
			b.FailNow()
		}
		price = cs.Catalog.Prices[priceId]
	}
	if price == nil {
		b.Fail()
	}
}

func BenchmarkFindPriceV2_9701position(b *testing.B) {
	cs, ind := prepareBitmapIndexV2(b)

	b.ResetTimer()
	var price *model.Price
	for i := 0; i < b.N; i++ {
		priceIndex, err := ind.FindPriceIndexBy("85dc39cd-52dc-49fa-9d00-051a1ff15cd6", "group2", "MRC",
			[]model.CharValue{{"Term", "60"},
				{"B2B Traffic", "100GB"},
				{"B2B Bandwidth", "75Mbps"},
				{"VPN", "170954ea-687d-42d2-9c04-7807845c66ee"},
				{"Router", "Included"}})
		assert.NoError(b, err)
		priceId, err := ind.FindPriceIdByIndex(priceIndex)
		if err != nil {
			b.FailNow()
		}
		price = cs.Catalog.Prices[priceId]
	}
	if price == nil {
		b.Fail()
	}
}

func BenchmarkFindPriceV2_MultiplePricesErr(b *testing.B) {
	_, ind := prepareBitmapIndexV2(b)

	b.ResetTimer()
	var errFindPrice error
	for i := 0; i < b.N; i++ {
		_, errFindPrice = ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "group5", "NRC",
			[]model.CharValue{{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"}})
		if errFindPrice == nil {
			b.FailNow()
		}
	}
	if errFindPrice == nil {
		b.FailNow()
	}
}
