package handlersmap

import (
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"github.com/rs/zerolog/log"
	"github.com/ugorji/go/codec"
	"net/http"
)

func (as *MapAggregateService) FindPriceByXUgorji(rw http.ResponseWriter, r *http.Request) {
	h := new(codec.JsonHandle)
	h.ZeroCopy = true
	dec := codec.NewDecoder(r.Body, h)
	var findPriceRequest model.FindPriceRequest
	err := dec.Decode(&findPriceRequest)

	if err != nil {
		misc.HandleDecodeError(rw, err)
		return
	}

	price, err, _ := as.Index.FindPriceBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
		findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
	if err != nil {
		http.Error(rw, err.Error(), http.StatusNotFound)
		return
	}
	enc := codec.NewEncoder(rw, h)
	err = enc.Encode(price)
	if err != nil {
		log.Err(err).Msg("Unable to encode object")
		http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return
	}
}
