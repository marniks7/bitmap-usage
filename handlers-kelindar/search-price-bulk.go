package handlerskelindar

import (
	indexroaring "bitmap-usage/index-roaring"
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"encoding/json"
	"errors"
	"net/http"
	"sync"
)

var ConcurrentModeRequestSize = 4

func (as *BitmapAggregateService) FindPriceBulkByX(rw http.ResponseWriter, r *http.Request) {
	dec := json.NewDecoder(r.Body)

	var findPriceRequests []model.FindPriceRequestBulk
	err := dec.Decode(&findPriceRequests)

	if err != nil {
		misc.HandleDecodeError(rw, err)
		return
	}

	encoder := json.NewEncoder(rw)
	encoder.SetIndent("", "")

	if len(findPriceRequests) >= ConcurrentModeRequestSize {
		//concurrent execution
		resp := make(chan model.FindPriceResponseBulk, 50)
		go func() {
			for _, fpreq := range findPriceRequests {
				fpreqInt := fpreq
				as.RequestChan <- model.ChanFindPriceRequestBulk{FPRB: &fpreqInt, Result: resp}
			}
			//
		}()
		ln := len(findPriceRequests) - 1
		rw.Write([]byte{'['})
		for i := 0; i < len(findPriceRequests); i++ {
			resp2 := <-resp
			err = encoder.Encode(resp2)

			if err != nil {
				http.Error(rw, "Unable encode", http.StatusInternalServerError)
				return
			}

			if i != ln {
				rw.Write([]byte(","))
			}
		}
		rw.Write([]byte{']'})
	} else {
		//single threaded execution
		rw.Write([]byte{'['})
		for i, findPriceRequest := range findPriceRequests {
			ind, err := as.Index.FindPriceIndexBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
				findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
			var price *model.Price
			if err != nil {
				if err == indexroaring.ErrUnableToFindPrice {
					price = nil
				} else {
					http.Error(rw, err.Error(), http.StatusBadRequest)
					return
				}
			} else {
				priceId, err := as.Index.FindPriceIdByIndex(ind)
				if err != nil {
					as.L.Err(err).Msg("Unable to find price id by index")
					http.Error(rw, err.Error(), http.StatusInternalServerError)
					return
				}
				price := as.CS.Catalog.Prices[priceId]
				if price == nil {
					as.L.Error().Str("priceId", priceId).Msg("Unable to find price by priceId")
					http.Error(rw, "Internal server error", http.StatusInternalServerError)
					return
				}
			}
			err = encoder.Encode(model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id})
			if err != nil {
				http.Error(rw, "Unable encode", http.StatusInternalServerError)
				return
			}

			if i != len(findPriceRequests)-1 {
				rw.Write([]byte(","))
			}
		}
		rw.Write([]byte{']'})
	}

}

var ErrUnableToFindPrice = errors.New("unable to find price by priceId")

func (as *BitmapAggregateService) worker(ch chan model.FindPriceRequestBulk,
	resp chan model.FindPriceResponseBulk,
	errch chan error, wg *sync.WaitGroup) {
	for {
		findPriceRequest := <-ch

		ind, err := as.Index.FindPriceIndexBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
			findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
		if err != nil {
			errch <- err
		} else {
			priceId, err := as.Index.FindPriceIdByIndex(ind)
			if err != nil {
				errch <- err
			} else {
				price := as.CS.Catalog.Prices[priceId]
				if price != nil {
					resp <- model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
				} else {
					errch <- ErrUnableToFindPrice
				}
			}
		}
		wg.Done()

	}
}

//TODO error channel doesn't work yet
//TODO add cancel
func (as *BitmapAggregateService) LongLiveWorker() {
	for fpr := range as.RequestChan {
		findPriceRequest := fpr.FPRB
		ind, err := as.Index.FindPriceIndexBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
			findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
		if err != nil {
			fpr.Err <- err
		} else {
			priceId, err := as.Index.FindPriceIdByIndex(ind)
			if err != nil {
				fpr.Err <- err
			} else {
				price := as.CS.Catalog.Prices[priceId]
				if price != nil {
					fpr.Result <- model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
				} else {
					fpr.Err <- ErrUnableToFindPrice
				}
			}
		}

	}
}
