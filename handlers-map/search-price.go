package handlersmap

import (
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"encoding/json"
	"github.com/gofiber/fiber/v2"
	"github.com/valyala/fasthttp"
	"net/http"
)

func (as *MapAggregateService) FindPriceByX(rw http.ResponseWriter, r *http.Request) {
	dec := json.NewDecoder(r.Body)

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
	encoder := json.NewEncoder(rw)
	err = encoder.Encode(price)
	if err != nil {
		as.L.Err(err).Msg("Unable to encode object")
		http.Error(rw, "Internal server error", http.StatusInternalServerError)
		return
	}
}

func (as *MapAggregateService) FindPriceByX_FastHttp(ctx *fasthttp.RequestCtx) {
	var findPriceRequest model.FindPriceRequest
	err := json.Unmarshal(ctx.Request.Body(), &findPriceRequest)

	if err != nil {
		ctx.Response.SetStatusCode(http.StatusInternalServerError)
		//misc.HandleDecodeError(ctx, err) TODO
		return
	}

	price, err, _ := as.Index.FindPriceBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
		findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
	if err != nil {
		ctx.Response.SetStatusCode(http.StatusNotFound)
		ctx.Response.SetBodyString(err.Error())
		return
	}
	encoder := json.NewEncoder(ctx.Response.BodyWriter())
	err = encoder.Encode(price)
	if err != nil {
		as.L.Err(err).Msg("Unable to encode object")
		ctx.Response.SetStatusCode(http.StatusInternalServerError)
		return
	}
}

func (as *MapAggregateService) FindPriceByX_Fiber(c *fiber.Ctx) error {
	var findPriceRequest model.FindPriceRequest
	err := json.Unmarshal(c.Body(), &findPriceRequest)

	if err != nil {
		c.Response().SetStatusCode(http.StatusInternalServerError)
		//misc.HandleDecodeError(ctx, err) TODO
		return nil
	}

	price, err, _ := as.Index.FindPriceBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
		findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
	if err != nil {
		c.Response().SetStatusCode(http.StatusNotFound)
		c.Response().SetBodyString(err.Error())
		return nil
	}
	encoder := json.NewEncoder(c.Response().BodyWriter())
	err = encoder.Encode(price)
	if err != nil {
		as.L.Err(err).Msg("Unable to encode object")
		c.Response().SetStatusCode(http.StatusInternalServerError)
		return nil
	}
	return nil
}
