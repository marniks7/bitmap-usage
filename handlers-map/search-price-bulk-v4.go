package handlersmap

import (
	"bitmap-usage/bulk"
	"bitmap-usage/model"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"golang.org/x/net/context"
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
	defer r.Body.Close()
	findPriceRequests, err := decodeRequest(r.Context(), dec)
	if err != nil {
		log.Err(err).Msg("Unable to decode")
		rw.WriteHeader(200)
		//misc.HandleDecodeError(rw, err)
		return
	}
	encoder := json.NewEncoder(rw)
	encoder.SetIndent("", "")
	//Note: errors slice is accessed concurrently, be careful
	results := make([]model.FindPriceResponseBulk, len(findPriceRequests))

	g := bulk.NewGroup(uint8(limit))
	for i, fpreq := range findPriceRequests {
		i, findPriceRequest := i, fpreq
		g.Go(func() error {
			price, err, _ := as.Index.FindPriceBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
				findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
			if err != nil {
				results[i] = model.FindPriceResponseBulk{Price: nil, Id: findPriceRequest.Id, Error: model.ErrorResponse{Message: err.Error()}}
				return nil
			}
			if price != nil {
				results[i] = model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
			} else {
				results[i] = model.FindPriceResponseBulk{Price: nil, Id: findPriceRequest.Id, Error: model.ErrorResponse{Message: ErrUnableToFindPrice.Error()}}
				return nil
			}

			return nil
		})

	}
	if err := g.Wait(); err != nil {
		log.Err(err).Msg("First err for bulk search price")
		//http.Error(rw, "Unable to find prices for at least one in a group", http.StatusBadRequest)
		//return
	}
	for _, result := range results {
		err = encoder.Encode(result)
		if err != nil {
			log.Err(err).Msg("Unable to encode")
			http.Error(rw, "Internal Server Error", http.StatusInternalServerError)
			return
		}
	}

}

func decodeRequest(ctx context.Context, dec *json.Decoder) ([]model.FindPriceRequestBulk, error) {
	var findPriceRequests []model.FindPriceRequestBulk

	for dec.More() {
		select {
		case <-ctx.Done():
			return nil, ctx.Err()
		default:
			{
				var fprb model.FindPriceRequestBulk
				err := dec.Decode(&fprb)
				if err != nil {
					return nil, err
				}
				findPriceRequests = append(findPriceRequests, fprb)
			}
		}
	}
	return findPriceRequests, nil
}
