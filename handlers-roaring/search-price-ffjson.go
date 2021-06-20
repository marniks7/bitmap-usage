package handlersroaring

import (
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"github.com/pquerna/ffjson/ffjson"
	"io/ioutil"
	"net/http"
)

func (as *BitmapAggregateService) FindPriceByX_FFJson(rw http.ResponseWriter, r *http.Request) {
	var findPriceRequest model.FindPriceRequest
	body, err := ioutil.ReadAll(r.Body)
	err = ffjson.Unmarshal(body, &findPriceRequest)
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
		as.L.Err(err).Msg("Unable to find price id by index")
		http.Error(rw, err.Error(), http.StatusInternalServerError)
		return
	}
	price := as.CS.Catalog.Prices[priceId]
	if price == nil {
		as.L.Error().Uint32("index", index).Msg("Unable to find price by index")
		http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return
	}
	//enc := ffjson.NewEncoder(rw)
	fast, err := ffjson.MarshalFast(price)

	if err != nil {
		as.L.Err(err).Msg("Unable to encode object")
		http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return
	}
	rw.Write(fast)
	ffjson.Pool(fast)
}