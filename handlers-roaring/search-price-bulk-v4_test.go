package handlersroaring

import (
	"bitmap-usage/model"
	"bytes"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"go.uber.org/goleak"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestFindPriceBulkV4(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	type test struct {
		Name               string
		Request            []byte
		ExpectedStatusCode int
		ExpectedResponse   []model.FindPriceResponseBulk
	}
	tests := []test{
		{Name: "Few Requests",
			Request:            []byte(`[{"offeringId":"offering1","groupId":"group1","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0},{"offeringId":"offering3","groupId":"group2","priceSpecId":"spec1","charValues":[{"char":"char2","value":"value2"}],"id":2},{"offeringId":"offering2","groupId":"group2","priceSpecId":"spec1","charValues":[{"char":"char2","value":"value2"}],"id":3}]`),
			ExpectedStatusCode: http.StatusOK,
			ExpectedResponse: []model.FindPriceResponseBulk{
				{Id: 0, Price: &model.Price{Id: "id1", Spec: "spec1", Value: 100, Currency: "USD"}},
				{Id: 2, Price: &model.Price{Id: "id5", Spec: "spec1", Value: 161, Currency: "USD"}},
				{Id: 3, Price: &model.Price{Id: "id4", Spec: "spec1", Value: 170, Currency: "USD"}}}},
		{Name: "Malformed delimiter between requests",
			Request: []byte(`[{"offeringId":"offering1","groupId":"group1","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0}\n
			{"offeringId":"offering3","groupId":"group2","priceSpecId":"spec1","charValues":[{"char":"char2","value":"value2"}],"id":2}]`),
			ExpectedStatusCode: http.StatusBadRequest,
			ExpectedResponse:   nil},
		{Name: "Line delimiter",
			Request:            []byte("[{\"offeringId\":\"offering1\",\"groupId\":\"group1\",\"priceSpecId\":\"spec1\",\"charValues\":[{\"char\":\"char1\",\"value\":\"value1\"}],\"id\":0},{\"offeringId\":\"offering3\",\"groupId\":\"group2\",\"priceSpecId\":\"spec1\",\"charValues\":[{\"char\":\"char2\",\"value\":\"value2\"}],\"id\":2}]"),
			ExpectedStatusCode: http.StatusOK,
			ExpectedResponse: []model.FindPriceResponseBulk{
				{Id: 0, Price: &model.Price{Id: "id1", Spec: "spec1", Value: 100, Currency: "USD"}},
				{Id: 2, Price: &model.Price{Id: "id5", Spec: "spec1", Value: 161, Currency: "USD"}}}},
		{
			Name:               "One Request",
			Request:            []byte(`[{"offeringId":"offering1","groupId":"group1","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0}]`),
			ExpectedStatusCode: http.StatusOK,
			ExpectedResponse: []model.FindPriceResponseBulk{
				{Id: 0, Price: &model.Price{Id: "id1", Spec: "spec1", Value: 100, Currency: "USD"}}},
		},
		{
			Name:               "Not Found",
			Request:            []byte(`[{"offeringId":"offering1","groupId":"group2","priceSpecId":"spec1","charValues":[{"char":"char1","value":"value1"}],"id":0}]`),
			ExpectedStatusCode: http.StatusOK,
			ExpectedResponse: []model.FindPriceResponseBulk{
				{Id: 0, Price: nil, Error: model.ErrorResponse{Message: "unable find price"}}},
		},
		{
			Name:               "Malformed request inside",
			Request:            []byte(`[{"offeringId":"offering1","groupId":"group1","priceSpecId":"spec1","charValues":{"char":"char1","value":"value1"}],"id":0}]`),
			ExpectedStatusCode: http.StatusBadRequest,
			ExpectedResponse:   nil,
		},
	}

	for _, tt := range tests {
		t.Run(tt.Name, func(t *testing.T) {
			//use function
			rr := httptest.NewRecorder()
			handler := http.HandlerFunc(as.FindPriceBulkByXV4)

			reader := bytes.NewReader(tt.Request)
			req, err := http.NewRequest("POST", "/v1/search/prices", reader)
			assert.NoError(t, err)
			handler.ServeHTTP(rr, req)

			//then
			assert.Equal(t, tt.ExpectedStatusCode, rr.Code)

			dec := json.NewDecoder(rr.Body)
			actual := decodeArray(dec)

			assert.NoError(t, err)
			assert.ElementsMatch(t, tt.ExpectedResponse, actual)
			goleak.VerifyNone(t)
		})
	}
}

func decodeArray(dec *json.Decoder) []model.FindPriceResponseBulk {
	var actual []model.FindPriceResponseBulk
	err := dec.Decode(&actual)
	if err != nil {
		log.Err(err).Msg("Unable to decode price, skip all")
		return nil
	}
	return actual
}
