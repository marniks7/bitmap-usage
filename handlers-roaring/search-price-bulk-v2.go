package handlersroaring

import (
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"encoding/json"
	"net/http"
	"sync"
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

	results := make([]model.FindPriceResponseBulk, 0, len(findPriceRequests))
	requests := make(chan model.FindPriceRequestBulk, 50)
	responses := make(chan model.FindPriceResponseBulk, 50)
	ctx := r.Context()
	wg := sync.WaitGroup{}
	wg.Add(1)
	go func() {
		defer wg.Done()
		for resp := range responses {
			results = append(results, resp)
		}
	}()
	go as.CalculateWorker(ctx, requests, responses)
	for _, fpreq := range findPriceRequests {
		requests <- fpreq
	}
	close(requests)

	wg.Wait()
	err = encoder.Encode(results)
	if err != nil {
		as.L.Err(err).Msg("Unable to encode")
		http.Error(rw, "Internal Server Error", http.StatusInternalServerError)
		return
	}

}
