package map64

import (
	handlersmap64 "bitmap-usage/handlers-map64"
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

func BenchmarkHttpClientServer_Map_FindPrice(b *testing.B) {
	cs, ind := prepareMapIndex(b)
	mapAggregateService := handlersmap64.NewMapAggregateService(log.Logger, cs, ind)
	ts := httptest.NewServer(http.HandlerFunc(mapAggregateService.FindPriceByX))
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

func BenchmarkMapOfferingIndex_FindPrice_11position(b *testing.B) {
	_, ind := prepareMapIndex(b)

	b.ResetTimer()
	var price *model64.Price
	for i := 0; i < b.N; i++ {
		price, _, _ = ind.FindPriceBy("a38e432c-3965-4c74-8251-aa640002d2b2", "Default", "MRC",
			[]model64.CharValue{{"Term", "12"},
				{"B2B Traffic", "1GB"},
				{"B2B Bandwidth", "30Mbps"},
				{"VPN", "ad796998-f1c7-4fcc-9a6b-1b33042fb375"},
				{"Router", "Included"}})
	}
	if price == nil {
		b.Fail()
	}
}

func BenchmarkMapOfferingIndex_FindPrice_3824position(b *testing.B) {
	_, ind := prepareMapIndex(b)

	b.ResetTimer()
	var price *model64.Price
	for i := 0; i < b.N; i++ {
		price, _, _ = ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model64.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
				{"Router", "Not Included"}})
	}
	if price == nil {
		b.Fail()
	}
}

func BenchmarkMapOfferingIndex_FindPrice_9701position(b *testing.B) {
	_, ind := prepareMapIndex(b)

	b.ResetTimer()
	var price *model64.Price
	for i := 0; i < b.N; i++ {
		price, _, _ = ind.FindPriceBy("85dc39cd-52dc-49fa-9d00-051a1ff15cd6", "Default", "MRC",
			[]model64.CharValue{{"Term", "60"},
				{"B2B Traffic", "100GB"},
				{"B2B Bandwidth", "75Mbps"},
				{"VPN", "170954ea-687d-42d2-9c04-7807845c66ee"},
				{"Router", "Included"}})
	}
	if price == nil {
		b.Fail()
	}
}

func BenchmarkMapOfferingIndex_FindPrice_MultiplePricesErr(b *testing.B) {
	_, ind := prepareMapIndex(b)

	b.ResetTimer()
	var errFindPrice error
	for i := 0; i < b.N; i++ {
		_, errFindPrice, _ = ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model64.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"}})
	}
	if errFindPrice == nil {
		b.Fail()
	}
}

func BenchmarkMapOfferingIndex_FindPrice_3824position_Optimized(b *testing.B) {
	_, ind := prepareMapIndexOptimized(b)

	b.ResetTimer()
	var price *model64.Price
	for i := 0; i < b.N; i++ {
		price, _, _ = ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model64.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
				{"Router", "Not Included"}})
	}
	if price == nil {
		b.Fail()
	}
}

func BenchmarkMapOfferingIndex_FindPrice_MultiplePricesErr_Optimized(b *testing.B) {
	_, ind := prepareMapIndexOptimized(b)

	b.ResetTimer()
	var errFindPrice error
	for i := 0; i < b.N; i++ {
		_, errFindPrice, _ = ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
			[]model64.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"}})
	}
	if errFindPrice == nil {
		b.Fail()
	}
}
