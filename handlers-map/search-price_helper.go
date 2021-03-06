package handlersmap

import (
	"bitmap-usage/cache"
	indexMap "bitmap-usage/index-map"
	"bitmap-usage/model"
	"bytes"
	"encoding/json"
	"github.com/stretchr/testify/assert"
	"net/http"
	"net/http/httptest"
	"testing"
)

func PrepareMap() *MapAggregateService {
	cs := cache.NewCatalogService(cache.NewCatalog())
	cs.Catalog.PriceConditions = []*model.PriceCondition{
		{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
			Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
		{ID: "id2", OfferingID: "offering2", GroupId: "group1", Spec: "spec1",
			Currency: "USD", Value: 130.00, Chars: []string{"char1"}, Values: []string{"value1"}},
		{ID: "id5", OfferingID: "offering3", GroupId: "group2", Spec: "spec1",
			Currency: "USD", Value: 161.00, Chars: []string{"char2"}, Values: []string{"value2"}},
		{ID: "id3", OfferingID: "offering2", GroupId: "group1", Spec: "spec1",
			Currency: "USD", Value: 190.00, Chars: []string{"char2"}, Values: []string{"value2"}},
		{ID: "id4", OfferingID: "offering2", GroupId: "group2", Spec: "spec1",
			Currency: "USD", Value: 170.00, Chars: []string{"char2"}, Values: []string{"value2"}},
	}

	//index
	indexer := indexMap.NewService()
	indexer.IndexPrices(cs.Catalog)

	as := NewMapAggregateService(cs, indexer)
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
	expected := &model.Price{Id: "id1", Spec: "spec1", Value: 100, Currency: "USD"}
	actual := &model.Price{}
	err = json.Unmarshal(rr.Body.Bytes(), actual)
	assert.NoError(t, err)
	assert.Equal(t, expected, actual)
}
