package Prices_487k_PricesPerOffering_9_7k_64

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

func BenchmarkHttpClientServer_Map_FindPrice_Conditions8(b *testing.B) {
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
