package handlersroaring

import (
	"bitmap-usage/cache"
	"bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"bytes"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestFindPriceBy(t *testing.T) {
	//given catalog
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	cs.Catalog.PriceConditions = []*model.PriceCondition{
		{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
			Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
	}

	//index
	indexer := indexroaring.NewService(log.Logger)
	indexer.IndexPrices(cs.Catalog)

	as := NewBitmapAggregateService(log.Logger, cs, indexer)
	cs.GeneratePricesByConditionsAndClear()

	//use function
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(as.FindPriceByX)

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

func TestFindPriceBy_NotFound(t *testing.T) {
	//given catalog
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	cs.Catalog.PriceConditions = []*model.PriceCondition{
		{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
			Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
	}

	//given index
	indexer := indexroaring.NewService(log.Logger)
	indexer.IndexPrices(cs.Catalog)

	as := NewBitmapAggregateService(log.Logger, cs, indexer)
	cs.GeneratePricesByConditionsAndClear()

	//given function
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(as.FindPriceByX)

	//when
	request := []byte(`{"offeringId":"offering1","groupId":"group2","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0}`)
	reader := bytes.NewReader(request)
	req, err := http.NewRequest("POST", "/v1/search/prices", reader)
	assert.NoError(t, err)
	handler.ServeHTTP(rr, req)

	//then
	assert.Equal(t, http.StatusNotFound, rr.Code)
}
