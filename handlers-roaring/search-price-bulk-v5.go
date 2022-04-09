package handlersroaring

import (
	"bitmap-usage/model"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"golang.org/x/net/context"
	"net/http"
	"sync"
)

const CalculateConcurrentLevel = 2

// FindPriceBulkByXV5 Accepts line-delimited request(s) and uses line-delimited responses
// Details https://en.wikipedia.org/wiki/JSON_streaming#Line-delimited_JSON
func (as *BitmapAggregateService) FindPriceBulkByXV5(rw http.ResponseWriter, r *http.Request) {
	dec := json.NewDecoder(r.Body)
	defer r.Body.Close()
	rw.Header().Set("Transfer-Encoding", "chunked")
	requests := make(chan model.FindPriceRequestBulk, 50)
	responses := make(chan model.FindPriceResponseBulk, 50)
	ctx := r.Context()
	go as.CalculateWorker(ctx, requests, responses)
	en := json.NewEncoder(rw)
	en.SetIndent("", "")

	last := sync.WaitGroup{}
	last.Add(1)
	go as.DeserializeWorker(en, responses, &last)
	err := decodeRequest(ctx, dec, requests)
	last.Wait()
	//rw write should be in the end to avoid race conditions with DeserializeWorker
	if err != nil {
		http.Error(rw, "Unable decode body", http.StatusBadRequest)
		return
	}
}

func decodeRequest(ctx context.Context, dec *json.Decoder, requests chan model.FindPriceRequestBulk) error {
	defer func() {
		close(requests)
	}()
	for dec.More() {
		select {
		case <-ctx.Done():
			return nil
		default:
			{
				var fprb model.FindPriceRequestBulk
				err := dec.Decode(&fprb)
				if err != nil {
					return err
				}
				requests <- fprb
			}
		}
	}
	return nil
}

func (as *BitmapAggregateService) CalculateWorker(ctx context.Context, requestChan chan model.FindPriceRequestBulk,
	responseChan chan model.FindPriceResponseBulk) {
	wg2 := sync.WaitGroup{}
	defer func() {
		close(responseChan)
	}()
	for i := 0; i < CalculateConcurrentLevel; i++ {
		wg2.Add(1)
		go as.Calculate(ctx, &wg2, requestChan, responseChan)
	}
	wg2.Wait()

}

func (as *BitmapAggregateService) Calculate(ctx context.Context, wg *sync.WaitGroup,
	RequestChan chan model.FindPriceRequestBulk,
	OutChan chan model.FindPriceResponseBulk) {
	defer wg.Done()
	for fpr := range RequestChan {
		findPriceRequest := fpr
		ind, err := as.Index.FindPriceIndexBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
			findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
		if err != nil {
			OutChan <- model.FindPriceResponseBulk{Price: nil, Id: findPriceRequest.Id, Error: model.ErrorResponse{Message: err.Error()}}
		} else {
			priceId, err := as.Index.FindPriceIdByIndex(ind)
			if err != nil {
				OutChan <- model.FindPriceResponseBulk{Price: nil, Id: findPriceRequest.Id, Error: model.ErrorResponse{Message: err.Error()}}
			} else {
				price := as.CS.Catalog.Prices[priceId]
				if price != nil {
					OutChan <- model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
				} else {
					OutChan <- model.FindPriceResponseBulk{Price: nil, Id: findPriceRequest.Id, Error: model.ErrorResponse{Message: ErrUnableToFindPrice.Error()}}
				}
			}
		}

	}
}

func (as *BitmapAggregateService) DeserializeWorker(jsonEncoder *json.Encoder,
	responses chan model.FindPriceResponseBulk, out *sync.WaitGroup) {
	defer out.Done()
	for fpr := range responses {
		err := jsonEncoder.Encode(fpr)
		if err != nil {
			log.Err(err).Msg("Unable to encode response")
			//TODO no panic handling
			return
		}
	}

}
