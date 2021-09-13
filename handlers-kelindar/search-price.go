package handlerskelindar

import (
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"encoding/json"
	"github.com/gofiber/fiber/v2"
	"net/http"
)

func (as *BitmapAggregateService) FindPriceByX(rw http.ResponseWriter, r *http.Request) {
	dec := json.NewDecoder(r.Body)

	var findPriceRequest model.FindPriceRequest
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
	encoder := json.NewEncoder(rw)
	err = encoder.Encode(price)
	if err != nil {
		as.L.Err(err).Msg("Unable to encode object")
		http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return
	}
}

func (as *BitmapAggregateService) FindPriceByX_Fiber(c *fiber.Ctx) error {
	var findPriceRequest model.FindPriceRequest
	err := json.Unmarshal(c.Body(), &findPriceRequest)

	if err != nil {
		//misc.HandleDecodeError(rw, err)
		return err
	}

	index, err := as.Index.FindPriceIndexBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
		findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
	if err != nil {
		c.Response().SetStatusCode(http.StatusNotFound)
		//http.Error(rw, err.Error(), http.StatusNotFound)
		return err
	}
	priceId, err := as.Index.FindPriceIdByIndex(index)
	if err != nil {
		as.L.Err(err).Msg("Unable to find price id by index")
		c.Response().SetStatusCode(http.StatusInternalServerError)
		//http.Error(rw, err.Error(), http.StatusInternalServerError)
		return err
	}
	price := as.CS.Catalog.Prices[priceId]
	if price == nil {
		as.L.Error().Uint32("index", index).Msg("Unable to find price by index")
		c.Response().SetStatusCode(http.StatusInternalServerError)
		//http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return nil
	}
	encoder := json.NewEncoder(c.Response().BodyWriter())
	err = encoder.Encode(price)

	if err != nil {
		as.L.Err(err).Msg("Unable to encode object")
		c.Response().SetStatusCode(http.StatusInternalServerError)
		//http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return err
	}
	return nil
}
