package handlers

import (
	"bitmap-usage/cache"
	"bitmap-usage/index-roaring"
	"bitmap-usage/sample"
	"bytes"
	"fmt"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestFindPriceBy(t *testing.T) {
	// Create a request to pass to our handler. We don't have any query parameters for now, so we'll
	// pass 'nil' as the third parameter.
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	indexer := index_roaring.NewService(log.Logger)
	indexer.IndexPrices(cs.Catalog)

	as := NewAggregateService(log.Logger, cs, indexer)
	cs.GeneratePricesByConditionsAndClear()

	// We create a ResponseRecorder (which satisfies http.ResponseWriter) to record the response.
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(as.FindPriceByX)

	request := []byte(`{"offeringId":"00d3a020-08c4-4c94-be0a-e29794756f9e","groupId":"Default","priceSpecId":"MRC","charValues":[{"char":"Term","value":"12"},{"char":"B2B Traffic","value":"5GB"},{"char":"B2B Bandwidth","value":"900Mbps"},{"char":"VPN","value":"5739614e-6c52-402c-ba3a-534c51b3201a"},{"char":"Router","value":"Not Included"}],"id":0}`)
	reader := bytes.NewReader(request)
	req, err := http.NewRequest("POST", "/v1/search/prices", reader)
	assert.NoError(t, err)

	// Our handlers satisfy http.Handler, so we can call their ServeHTTP method
	// directly and pass in our Request and ResponseRecorder.
	handler.ServeHTTP(rr, req)

	// Check the status code is what we expect
	assert.Equal(t, http.StatusOK, rr.Code)

	fmt.Println(rr.Body.String())
	// Check the response body is what we expect.
	//expected := `{"availableFrom":0,"basePrice":false,"catalogProjectId":"","currencyId":"","defaultPrice":false,"id":"priceContainer239462","noCharge":false,"offeringId":"","priceKey":"","priceListId":"default","priceSpecId":"PriceSpec1","priceValue":0,"priceValueMax":0,"priceValueMin":0,"startDate":0,"tariffStartDate":0,"IndexId":4,"IndexPriceSpecID":1}`
	//if rr.Body.String() != expected {
	//	t.Errorf("handler returned unexpected body: got %v want %v",
	//		rr.Body.String(), expected)
	//}
}
