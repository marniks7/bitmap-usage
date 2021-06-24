package Prices_487k_PricesPerOffering_9_7k

import (
	handlers_roaring "bitmap-usage/handlers-roaring"
	"bitmap-usage/model"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func BenchmarkUnmarshalFindMarshal_Bitmap_FindPrice_Conditions8(b *testing.B) {
	cs, ind := prepareBitmapIndex(b)
	as := handlers_roaring.NewBitmapAggregateService(log.Logger, cs, ind)
	request := []byte(`{"offeringId":"00d3a020-08c4-4c94-be0a-e29794756f9e","groupId":"Default","priceSpecId":"MRC","charValues":[{"char":"Term","value":"12"},{"char":"B2B Traffic","value":"5GB"},{"char":"B2B Bandwidth","value":"900Mbps"},{"char":"VPN","value":"5739614e-6c52-402c-ba3a-534c51b3201a"},{"char":"Router","value":"Not Included"}],"id":0}`)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		var findPriceRequest model.FindPriceRequest
		err := json.Unmarshal(request, &findPriceRequest)
		assert.NoError(b, err)
		index, err := as.Index.FindPriceIndexBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
			findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
		assert.NoError(b, err)
		priceId, err := as.Index.FindPriceIdByIndex(index)
		assert.NoError(b, err)
		price := cs.Catalog.Prices[priceId]
		assert.NoError(b, err)
		marshal, err := json.Marshal(price)
		assert.NoError(b, err)
		assert.NotEmpty(b, marshal)
	}
}
