package handlersroaring

import (
	"bitmap-usage/model"
	"encoding/json"
	"errors"
	"github.com/rs/zerolog/log"
	"net/http"
)

func (as *BitmapAggregateService) FindPriceBulkByXV5(rw http.ResponseWriter, r *http.Request) {
	dec := json.NewDecoder(r.Body)
	br, err := dec.Token()
	if err != nil {
		log.Err(err)
		http.Error(rw, "Unable decode body", http.StatusBadRequest)
		return
	}
	if br != json.Delim('[') {
		log.Err(err)
		http.Error(rw, "Unable decode body", http.StatusBadRequest)
		return
	}
	requestIn := make(chan model.FindPriceRequestBulk, 50)
	OutChan := make(chan model.FindPriceResponseBulk, 50)
	ErrChan := make(chan error, 50)
	done := make(chan bool)

	go as.CalculateWorker(requestIn, OutChan, ErrChan)
	en := json.NewEncoder(rw)
	en.SetIndent("", "")
	go as.DeserializeWorker(rw, en, OutChan, done)

	for dec.More() {
		var fprb model.FindPriceRequestBulk
		err := dec.Decode(&fprb)
		if err != nil {
			log.Err(err)
			http.Error(rw, "Unable decode body", http.StatusBadRequest)
			return
		}
		requestIn <- fprb
	}
	close(requestIn)
	<-done
}

var ErrUnableToFindPrice2 = errors.New("unable to find price by priceId")

func (as *BitmapAggregateService) CalculateWorker(RequestChan chan model.FindPriceRequestBulk,
	OutChan chan model.FindPriceResponseBulk, ErrChar chan error) {
	for fpr := range RequestChan {
		findPriceRequest := fpr
		ind, err := as.Index.FindPriceIndexBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
			findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
		if err != nil {
			ErrChar <- err
			OutChan <- model.FindPriceResponseBulk{Price: nil, Id: findPriceRequest.Id}
		} else {
			priceId, err := as.Index.FindPriceIdByIndex(ind)
			if err != nil {
				ErrChar <- err
				OutChan <- model.FindPriceResponseBulk{Price: nil, Id: findPriceRequest.Id}
			} else {
				price := as.CS.Catalog.Prices[priceId]
				if price != nil {
					OutChan <- model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
				} else {
					ErrChar <- ErrUnableToFindPrice
					OutChan <- model.FindPriceResponseBulk{Price: nil, Id: findPriceRequest.Id}
				}
			}
		}

	}
	close(OutChan)
	close(ErrChar)
}

func (as *BitmapAggregateService) DeserializeWorker(rw http.ResponseWriter, jsonEncoder *json.Encoder, result chan model.FindPriceResponseBulk, out chan bool) {
	first := false
	rw.Write([]byte{'['})
	for fpr := range result {
		if first {
			rw.Write([]byte(","))
		}
		err := jsonEncoder.Encode(fpr)
		if err != nil {
			http.Error(rw, "Unable encode", http.StatusInternalServerError)
			return
		}
		first = true
	}
	rw.Write([]byte{']'})
	out <- true
}
