package handlersroaring64

import (
	cache64 "bitmap-usage/cache64"
	indexroaring64 "bitmap-usage/index-roaring64"
	model64 "bitmap-usage/model64"
	"bytes"
	"encoding/json"
	"github.com/stretchr/testify/assert"
	"net/http"
	"net/http/httptest"
	"testing"
)

func PrepareBitmap() *BitmapAggregateService {
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	cs.Catalog.PriceConditions = []*model64.PriceCondition{
		{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
			Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
	}

	//index
	indexer := indexroaring64.NewService()
	indexer.IndexPrices(cs.Catalog)

	as := NewBitmapAggregateService(cs, indexer)
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
	expected := &model64.Price{Id: "id1", Spec: "spec1", Value: 100, Currency: "USD"}
	actual := &model64.Price{}
	err = json.Unmarshal(rr.Body.Bytes(), actual)
	assert.NoError(t, err)
	assert.Equal(t, expected, actual)
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
