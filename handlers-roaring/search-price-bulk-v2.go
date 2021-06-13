package handlersroaring

import (
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"encoding/json"
	"golang.org/x/sync/errgroup"
	"net/http"
)

func (as *BitmapAggregateService) FindPriceBulkByXV2(rw http.ResponseWriter, r *http.Request) {
	dec := json.NewDecoder(r.Body)

	var findPriceRequests []model.FindPriceRequestBulk
	err := dec.Decode(&findPriceRequests)

	if err != nil {
		misc.HandleDecodeError(rw, err)
		return
	}
	encoder := json.NewEncoder(rw)
	encoder.SetIndent("", "")

	g, _ := errgroup.WithContext(r.Context())

	results := make([]model.FindPriceResponseBulk, len(findPriceRequests))
	for i, fpreq := range findPriceRequests {
		i, findPriceRequest := i, fpreq
		g.Go(func() error {

			ind, err := as.Index.FindPriceIndexBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
				findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
			if err != nil {
				return err
			} else {
				priceId, err := as.Index.FindPriceIdByIndex(ind)
				if err != nil {
					return err
				} else {
					price := as.CS.Catalog.Prices[priceId]
					if price != nil {
						results[i] = model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
					} else {
						return ErrUnableToFindPrice //TODO actually, this should not be treated as an error
					}
				}
			}
			return nil
		})

	}
	if err := g.Wait(); err != nil {
		http.Error(rw, "Unable to find prices for at least one in a group", http.StatusBadRequest)
		return
	}
	err = encoder.Encode(results)
	if err != nil {
		as.L.Err(err).Msg("Unable to encode")
		http.Error(rw, "Internal Server Error", http.StatusInternalServerError)
		return
	}

}
