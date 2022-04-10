package handlerssroar

import (
	"bitmap-usage/misc"
	"bitmap-usage/model64"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"net/http"
)

func (as *BitmapAggregateService) FindPriceByX(rw http.ResponseWriter, r *http.Request) {
	dec := json.NewDecoder(r.Body)

	var findPriceRequest model64.FindPriceRequest
	err := dec.Decode(&findPriceRequest)

	if err != nil {
		misc.HandleDecodeError(rw, err)
		return
	}

	index, err := as.Index.FindPriceIndexBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
		findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
	if err != nil {
		http.Error(rw, err.Error(), http.StatusNotFound)
		return
	}
	priceId, err := as.Index.FindPriceIdByIndex(index)
	if err != nil {
		log.Err(err).Msg("Unable to find price id by index")
		http.Error(rw, err.Error(), http.StatusInternalServerError)
		return
	}
	price := as.CS.Catalog.Prices[priceId]
	if price == nil {
		log.Error().Uint64("index", index).Msg("Unable to find price by index")
		http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return
	}
	encoder := json.NewEncoder(rw)
	err = encoder.Encode(price)
	if err != nil {
		log.Err(err).Msg("Unable to encode object")
		http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return
	}
}
