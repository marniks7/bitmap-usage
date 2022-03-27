package handlersroaring

import (
	"bitmap-usage/cache"
	indexroaring "bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"bytes"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"net/http"
	"net/http/httptest"
	"testing"
)

func PrepareBitmap() *BitmapAggregateService {
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
	indexer := indexroaring.NewService(log.Logger)
	indexer.IndexPrices(cs.Catalog)

	as := NewBitmapAggregateService(log.Logger, cs, indexer)
	cs.GeneratePricesByConditionsAndClear()
	return as
}

func FuncTestFindPrice(t *testing.T, fnc func(rw http.ResponseWriter, r *http.Request)) {
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

func FuncTestBulkFindPrice(t *testing.T, fnc func(rw http.ResponseWriter, r *http.Request)) {
	//use function
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(fnc)

	//when
	request := []byte(`[{"offeringId":"offering1","groupId":"group1","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0}]`)
	reader := bytes.NewReader(request)
	req, err := http.NewRequest("POST", "/v1/search/prices", reader)
	assert.NoError(t, err)
	handler.ServeHTTP(rr, req)

	//then
	assert.Equal(t, http.StatusOK, rr.Code)
	expectedPriceResponse := model.FindPriceResponseBulk{Id: 0,
		Price: &model.Price{Id: "id1", Spec: "spec1", Value: 100, Currency: "USD"}}

	dec := json.NewDecoder(rr.Body)

	var actual []model.FindPriceResponseBulk
	err = dec.Decode(&actual)

	var expected []model.FindPriceResponseBulk
	expected = append(expected, expectedPriceResponse)
	assert.NoError(t, err)
	assert.Equal(t, expected, actual)
}

func FuncTestBulkFindPriceFew(t *testing.T, fnc func(rw http.ResponseWriter, r *http.Request)) {
	//use function
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(fnc)

	//when
	request := []byte(`[{"offeringId":"offering1","groupId":"group1","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0},
	{"offeringId":"offering3","groupId":"group2","priceSpecId":"spec1","charValues":[{"char":"char2","value":"value2"}],"id":2}]`)
	reader := bytes.NewReader(request)
	req, err := http.NewRequest("POST", "/v1/search/prices", reader)
	assert.NoError(t, err)
	handler.ServeHTTP(rr, req)

	//then
	assert.Equal(t, http.StatusOK, rr.Code)
	expectedPriceResponse := model.FindPriceResponseBulk{Id: 0,
		Price: &model.Price{Id: "id1", Spec: "spec1", Value: 100, Currency: "USD"}}
	expectedPriceResponse2 := model.FindPriceResponseBulk{Id: 2,
		Price: &model.Price{Id: "id5", Spec: "spec1", Value: 161, Currency: "USD"}}
	dec := json.NewDecoder(rr.Body)

	var actual []model.FindPriceResponseBulk
	err = dec.Decode(&actual)

	var expected []model.FindPriceResponseBulk
	expected = append(expected, expectedPriceResponse)
	expected = append(expected, expectedPriceResponse2)
	assert.NoError(t, err)
	assert.ElementsMatch(t, expected, actual)
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

func FuncTestBulkPriceNotFound(t *testing.T, fnc func(rw http.ResponseWriter, r *http.Request)) {
	//given function
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(fnc)

	//when
	request := []byte(`[{"offeringId":"offering1","groupId":"group2","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0}]`)
	reader := bytes.NewReader(request)
	req, err := http.NewRequest("POST", "/v1/search/prices", reader)
	assert.NoError(t, err)
	handler.ServeHTTP(rr, req)

	//then
	assert.Equal(t, http.StatusOK, rr.Code)
	expectedPriceResponse := model.FindPriceResponseBulk{Price: nil, Id: 0}

	dec := json.NewDecoder(rr.Body)

	var actual []model.FindPriceResponseBulk
	err = dec.Decode(&actual)

	var expected []model.FindPriceResponseBulk
	expected = append(expected, expectedPriceResponse)
	assert.NoError(t, err)
	assert.Equal(t, expected, actual)
}
