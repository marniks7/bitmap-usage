package handlerskelindar

import (
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"errors"
	"github.com/gofiber/fiber/v2"
	"github.com/ugorji/go/codec"
	"net/http"
)

func (as *BitmapAggregateService) FindPriceByX_Ugorji_FIber(ctx *fiber.Ctx) error {
	dec := codec.NewDecoderBytes(ctx.Body(), as.Codec)
	var findPriceRequest model.FindPriceRequest
	err := dec.Decode(&findPriceRequest)

	if err != nil {
		//misc.HandleDecodeError(rw, err)
		return err
	}

	index, err := as.Index.FindPriceIndexBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
		findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
	if err != nil {
		//http.Error(rw, err.Error(), http.StatusNotFound)
		return err
	}
	priceId, err := as.Index.FindPriceIdByIndex(index)
	if err != nil {
		as.L.Err(err).Msg("Unable to find price id by index")
		//http.Error(rw, err.Error(), http.StatusInternalServerError)
		return err
	}
	price := as.CS.Catalog.Prices[priceId]
	if price == nil {
		as.L.Error().Uint32("index", index).Msg("Unable to find price by index")
		//http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return errors.New("Internal server error")
	}
	var b []byte
	enc := codec.NewEncoderBytes(&b, as.Codec)

	err = enc.Encode(price)
	if err != nil {
		as.L.Err(err).Msg("Unable to encode object")
		//http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return err
	}
	_, err = ctx.Write(b)
	if err != nil {
		as.L.Err(err).Msg("Unable to encode object")
		//http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return err
	}
	return nil
}
func (as *BitmapAggregateService) FindPriceByX_Ugorji(rw http.ResponseWriter, r *http.Request) {
	dec := codec.NewDecoder(r.Body, as.Codec)
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
	enc := codec.NewEncoder(rw, as.Codec)

	err = enc.Encode(price)
	if err != nil {
		as.L.Err(err).Msg("Unable to encode object")
		http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return
	}
}
