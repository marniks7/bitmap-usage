package handlersmap

import (
	"bitmap-usage/index-roaring"
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"encoding/json"
	"errors"
	"net/http"
	"sync"
)

var ConcurrentModeRequestSize = 4

func (as *MapAggregateService) FindPriceBulkByX(rw http.ResponseWriter, r *http.Request) {
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
			price, err, _ := as.Index.FindPriceBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
				findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
			if err != nil {
				if err == indexroaring.ErrUnableToFindPrice {
					price = nil
				} else {
					http.Error(rw, err.Error(), http.StatusBadRequest)
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

func (as *MapAggregateService) worker(ch chan model.FindPriceRequestBulk,
	resp chan model.FindPriceResponseBulk,
	errch chan error, wg *sync.WaitGroup) {
	for {
		findPriceRequest := <-ch

		price, err, _ := as.Index.FindPriceBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
			findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
		if err != nil {
			errch <- err
		}
		if price != nil {
			resp <- model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
		} else {
			errch <- ErrUnableToFindPrice
		}
		wg.Done()

	}
}

// Deprecated: another approach, not used right now
func (as *MapAggregateService) worker1(ch chan model.FindPriceRequestBulk,
	resp chan model.FindPriceResponseBulk,
	errch chan error) {
	for findPriceRequest := range ch {
		price, err, _ := as.Index.FindPriceBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
			findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
		if err != nil {
			errch <- err
		}
		if price != nil {
			resp <- model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
		} else {
			errch <- ErrUnableToFindPrice
		}

	}
}

//TODO error channel doesn't work yet
//TODO add cancel
func (as *MapAggregateService) LongLiveWorker() {
	for fpr := range as.RequestChan {
		findPriceRequest := fpr.FPRB
		price, err, _ := as.Index.FindPriceBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
			findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
		if err != nil {
			fpr.Err <- err
		}
		if price != nil {
			fpr.Result <- model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
		} else {
			fpr.Err <- ErrUnableToFindPrice
		}

	}
}
