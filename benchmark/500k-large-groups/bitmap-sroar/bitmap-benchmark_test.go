package bitmapsroar

import (
	handlerssroar "bitmap-usage/handlers-sroar"
	model64 "bitmap-usage/model64"
	"bytes"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"testing"
)

func BenchmarkHttpClientServer_Bitmap_FindPrice_Conditions8(b *testing.B) {
	cs, ind := prepareBitmapIndex(b)
	bitmapAggregateService := handlerssroar.NewBitmapAggregateService(log.Logger, cs, ind)
	ts := httptest.NewServer(http.HandlerFunc(bitmapAggregateService.FindPriceByX))
	defer ts.Close()
	tr := &http.Transport{}
	defer tr.CloseIdleConnections()
	cl := &http.Client{
		Transport: tr,
	}
	request := []byte(`{"offeringId":"00d3a020-08c4-4c94-be0a-e29794756f9e","groupId":"Default","priceSpecId":"MRC","charValues":[{"char":"Term","value":"12"},{"char":"B2B Traffic","value":"5GB"},{"char":"B2B Bandwidth","value":"900Mbps"},{"char":"VPN","value":"5739614e-6c52-402c-ba3a-534c51b3201a"},{"char":"Router","value":"Not Included"}],"id":0}`)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		res, err := cl.Post(ts.URL, "application/json", bytes.NewBuffer(request))
		assert.NoError(b, err)
		body, err := ioutil.ReadAll(res.Body)
		assert.NoError(b, err)
		var price = &model64.Price{}
		err = json.Unmarshal(body, price)
		assert.NoError(b, err)
		assert.NotNil(b, price)
	}
}

func BenchmarkBitmap_FindPrice_Conditions8_11position(b *testing.B) {
	cs, ind := prepareBitmapIndex(b)

	b.ResetTimer()
	var price *model64.Price
	for i := 0; i < b.N; i++ {
		priceIndex, _ := ind.FindPriceIndexBy("a38e432c-3965-4c74-8251-aa640002d2b2", "Default", "MRC",
			[]model64.CharValue{{"Term", "12"},
				{"B2B Traffic", "1GB"},
				{"B2B Bandwidth", "30Mbps"},
				{"VPN", "ad796998-f1c7-4fcc-9a6b-1b33042fb375"},
				{"Router", "Included"}})
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

func BenchmarkBitmap_FindPrice_Conditions8_3824Position(b *testing.B) {
	cs, ind := prepareBitmapIndex(b)

	b.ResetTimer()
	var priceIndex uint64
	var price *model64.Price
	for i := 0; i < b.N; i++ {
		priceIndex, _ = ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model64.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
				{"Router", "Not Included"}})
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

func BenchmarkBitmap_FindPrice_Conditions8_9701position(b *testing.B) {
	cs, ind := prepareBitmapIndex(b)

	b.ResetTimer()
	var price *model64.Price
	for i := 0; i < b.N; i++ {
		priceIndex, _ := ind.FindPriceIndexBy("85dc39cd-52dc-49fa-9d00-051a1ff15cd6", "Default", "MRC",
			[]model64.CharValue{{"Term", "60"},
				{"B2B Traffic", "100GB"},
				{"B2B Bandwidth", "75Mbps"},
				{"VPN", "170954ea-687d-42d2-9c04-7807845c66ee"},
				{"Router", "Included"}})
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

func BenchmarkBitmap_FindPriceIndexId_Conditions8_3824Position(b *testing.B) {
	_, ind := prepareBitmapIndex(b)

	b.ResetTimer()
	var price uint64
	for i := 0; i < b.N; i++ {
		price, _ = ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model64.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
				{"Router", "Not Included"}})
	}
	if price == 0 {
		b.Fail()
	}
}

func BenchmarkBitmap_FindPrice_Conditions8_MultiplePricesErr(b *testing.B) {
	_, ind := prepareBitmapIndex(b)

	b.ResetTimer()
	var errFindPrice error
	for i := 0; i < b.N; i++ {
		_, errFindPrice = ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model64.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
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
