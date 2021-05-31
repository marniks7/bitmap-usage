package handlers_roaring

import (
	"bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"log"
	"net/http"
	"strings"
	"sync"
)

var ConcurrentModeRequestSize = 4

func (as *AggregateService) FindPriceBulkByX(rw http.ResponseWriter, r *http.Request) {
	dec := json.NewDecoder(r.Body)

	var findPriceRequests []model.FindPriceRequestBulk
	err := dec.Decode(&findPriceRequests)

	if err != nil {
		var syntaxError *json.SyntaxError
		var unmarshalTypeError *json.UnmarshalTypeError

		switch {
		// Catch any syntax errors in the JSON and send an error message
		// which interpolates the location of the problem to make it
		// easier for the client to fix.
		case errors.As(err, &syntaxError):
			msg := fmt.Sprintf("Request body contains badly-formed JSON (at position %d)", syntaxError.Offset)
			http.Error(rw, msg, http.StatusBadRequest)

		// In some circumstances Decode() may also return an
		// io.ErrUnexpectedEOF error for syntax errors in the JSON. There
		// is an open issue regarding this at
		// https://github.com/golang/go/issues/25956.
		case errors.Is(err, io.ErrUnexpectedEOF):
			msg := fmt.Sprintf("Request body contains badly-formed JSON")
			http.Error(rw, msg, http.StatusBadRequest)

		// Catch any type errors, like trying to assign a string in the
		// JSON request body to a int field in our Person struct. We can
		// interpolate the relevant field name and position into the error
		// message to make it easier for the client to fix.
		case errors.As(err, &unmarshalTypeError):
			msg := fmt.Sprintf("Request body contains an invalid Value for the %q field (at position %d)", unmarshalTypeError.Field, unmarshalTypeError.Offset)
			http.Error(rw, msg, http.StatusBadRequest)

		// Catch the error caused by extra unexpected fields in the request
		// body. We extract the field name from the error message and
		// interpolate it in our custom error message. There is an open
		// issue at https://github.com/golang/go/issues/29035 regarding
		// turning this into a sentinel error.
		case strings.HasPrefix(err.Error(), "json: unknown field "):
			fieldName := strings.TrimPrefix(err.Error(), "json: unknown field ")
			msg := fmt.Sprintf("Request body contains unknown field %s", fieldName)
			http.Error(rw, msg, http.StatusBadRequest)

		// An io.EOF error is returned by Decode() if the request body is
		// empty.
		case errors.Is(err, io.EOF):
			msg := "Request body must not be empty"
			http.Error(rw, msg, http.StatusBadRequest)

		// Catch the error caused by the request body being too large. Again
		// there is an open issue regarding turning this into a sentinel
		// error at https://github.com/golang/go/issues/30715.
		case err.Error() == "http: request body too large":
			msg := "Request body must not be larger than 1MB"
			http.Error(rw, msg, http.StatusRequestEntityTooLarge)

		// Otherwise default to logging the error and sending a 500 Internal
		// Server Error response.
		default:
			log.Println(err.Error())
			http.Error(rw, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
		}
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
				if err == indexRoaring.ErrUnableToFindPrice {
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

func (as *AggregateService) worker(ch chan model.FindPriceRequestBulk,
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

// Deprecated: another approach, not used right now
func (as *AggregateService) worker1(ch chan model.FindPriceRequestBulk,
	resp chan model.FindPriceResponseBulk,
	errch chan error) {
	for findPriceRequest := range ch {
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

	}
}

//TODO error channel doesn't work yet
//TODO add cancel
func (as *AggregateService) LongLiveWorker() {
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
