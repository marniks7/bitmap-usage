package handlersmap

import (
	"bitmap-usage/bulk"
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"net/http"
	"strconv"
)

// FindPriceBulkByXV4 is used for bulk price search with next properties
// Decode: single-threaded, all in one without streaming
// Encode: single-threaded, all in one without streaming
// Goroutine: created during execution without pooling
// Concurrency: limited by 8 or as provided in limit
// TODO errors are not serialized
func (as *MapAggregateService) FindPriceBulkByXV4(rw http.ResponseWriter, r *http.Request) {
	limitStr := r.Form.Get("limit")
	limit := 8
	if limitStr != "" {
		limitV, err := strconv.Atoi(limitStr)
		if err != nil {
			http.Error(rw, "Wrong `limit` param - "+err.Error(), 400)
			return
		} else {
			limit = limitV
		}
	}

	dec := json.NewDecoder(r.Body)

	var findPriceRequests []model.FindPriceRequestBulk
	err := dec.Decode(&findPriceRequests)

	if err != nil {
		misc.HandleDecodeError(rw, err)
		return
	}
	encoder := json.NewEncoder(rw)

	//todo check the approach with error unmarshal from perf perspective := make([]interface{}, len(findPriceRequests))
	//Note: results slice is accessed concurrently, be careful
	results := make([]model.FindPriceResponseBulk, len(findPriceRequests))
	//Note: errors slice is accessed concurrently, be careful
	errors := make([]error, len(findPriceRequests))

	g := bulk.NewGroup(uint8(limit))
	for i, fpreq := range findPriceRequests {
		i, findPriceRequest := i, fpreq
		g.Go(func() error {
			price, err, _ := as.Index.FindPriceBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
				findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
			if err != nil {
				errors[i] = err
				return err
			}
			if price != nil {
				results[i] = model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
			} else {
				errors[i] = ErrUnableToFindPrice
				return ErrUnableToFindPrice
			}

			return nil
		})

	}
	if err := g.Wait(); err != nil {
		log.Err(err).Msg("First err for bulk search price")
		//http.Error(rw, "Unable to find prices for at least one in a group", http.StatusBadRequest)
		//return
	}
	err = encoder.Encode(results)
	if err != nil {
		as.L.Err(err).Msg("Unable to encode")
		http.Error(rw, "Internal Server Error", http.StatusInternalServerError)
		return
	}

}