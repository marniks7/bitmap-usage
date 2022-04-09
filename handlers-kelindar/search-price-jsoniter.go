package handlerskelindar

import (
	"bitmap-usage/misc"
	"bitmap-usage/model"
	jsoniter "github.com/json-iterator/go"
	"github.com/rs/zerolog/log"
	"io/ioutil"
	"net/http"
)

func (as *BitmapAggregateService) FindPriceByXJsoniter(rw http.ResponseWriter, r *http.Request) {
	var json = jsoniter.ConfigFastest
	//dec := json.NewDecoder(r.Body)
	body, err := ioutil.ReadAll(r.Body)

	var findPriceRequest model.FindPriceRequest
	err = json.Unmarshal(body, &findPriceRequest)
	//err := dec.Decode(&findPriceRequest)

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
		log.Error().Uint32("index", index).Msg("Unable to find price by index")
		http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return
	}
	marshal, err := json.Marshal(price)
	if err != nil {
		log.Err(err).Msg("Unable to encode object")
		http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return
	}
	rw.Write(marshal)
	//enc := json.NewEncoder(rw)
	//err = enc.Encode(price)

}
