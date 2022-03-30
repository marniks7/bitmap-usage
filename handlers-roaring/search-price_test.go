package handlersroaring

import (
	"bitmap-usage/model"
	"bytes"
	"encoding/json"
	"github.com/stretchr/testify/assert"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestFindPriceBy(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestFindPrice(t, as.FindPriceByX)
}

func TestFindPriceBy_NotFound(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestPriceNotFound(t, as.FindPriceByX)
}

func TestFindPriceByError(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//use function
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(as.FindPriceByX)

	//when
	request := []byte(`{"offeringId":"offering1","groupId":"group1","test":"abc","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0}`)
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
	//test
	FuncTestFindPrice(t, as.FindPriceByX)
}
