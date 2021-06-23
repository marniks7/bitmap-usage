package handlersmap64

import (
	cache64 "bitmap-usage/cache64"
	indexmap64 "bitmap-usage/index-map64"
	model64 "bitmap-usage/model64"
	"bytes"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"net/http"
	"net/http/httptest"
	"testing"
)

func PrepareMap() *MapAggregateService {
	cs := cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
	cs.Catalog.PriceConditions = []*model64.PriceCondition{
		{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
			Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
	}

	//index
	indexer := indexmap64.NewService(log.Logger)
	indexer.IndexPrices(cs.Catalog)

	as := NewMapAggregateService(log.Logger, cs, indexer)
	cs.GeneratePricesByConditionsAndClear()
	return as
}

func FuncTestPriceNotFound(t *testing.T, fnc func(rw http.ResponseWriter, r *http.Request)) {
	//given function
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(fnc)

	//when
	request := []byte(`{"offeringId":"offering1","groupId":"group2","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0}`)
	reader := bytes.NewReader(request)
	req, err := http.NewRequest("POST", "/v1/search/prices", reader)
	assert.NoError(t, err)
	handler.ServeHTTP(rr, req)

	//then
	assert.Equal(t, http.StatusNotFound, rr.Code)
}

func FuncTestFindPriceGeneric(t *testing.T, fnc func(rw http.ResponseWriter, r *http.Request)) {
	//use function
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(fnc)

	//when
	request := []byte(`{"offeringId":"offering1","groupId":"group1","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0}`)
	reader := bytes.NewReader(request)
	req, err := http.NewRequest("POST", "/v1/search/prices", reader)
	assert.NoError(t, err)
	handler.ServeHTTP(rr, req)

	//then
	assert.Equal(t, http.StatusOK, rr.Code)
	expected := &model64.Price{Id: "id1", Spec: "spec1", Value: 100, Currency: "USD"}
	actual := &model64.Price{}
	err = json.Unmarshal(rr.Body.Bytes(), actual)
	assert.NoError(t, err)
	assert.Equal(t, expected, actual)
}
