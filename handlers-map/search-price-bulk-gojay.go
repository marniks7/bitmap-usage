package handlers_map

import (
	"bitmap-usage/model"
	"encoding/json"
	"errors"
	"fmt"
	"github.com/francoispqt/gojay"
	"golang.org/x/sync/errgroup"
	"io"
	"log"
	"net/http"
	"strings"
)

type EncodeError struct {
	Err error
}

func (e *EncodeError) Error() string { return e.Err.Error() }

type StreamChan chan *model.FindPriceResponseBulk

func (s StreamChan) MarshalStream(enc *gojay.StreamEncoder) {
	select {
	case <-enc.Done():
		return
	case o := <-s:
		enc.Object(o)
	}
}

func (as *MapAggregateService) FindPriceBulkByXV3(rw http.ResponseWriter, r *http.Request) {
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
	g, _ := errgroup.WithContext(r.Context())

	enc := gojay.Stream.BorrowEncoder(rw).NConsumer(10).LineDelimited()
	defer enc.Release()
	s := StreamChan(make(chan *model.FindPriceResponseBulk))
	go enc.EncodeStream(s)

	for _, fpreq := range findPriceRequests {
		findPriceRequest := fpreq
		g.Go(func() error {
			price, err, _ := as.Index.FindPriceBy(findPriceRequest.OfferingId, findPriceRequest.GroupId,
				findPriceRequest.PriceSpecId, findPriceRequest.CharValues)
			if err != nil {
				return err
			}
			if price != nil {
				s <- &model.FindPriceResponseBulk{Price: price, Id: findPriceRequest.Id}
			} else {
				return ErrUnableToFindPrice //TODO actually, this should not be treated as an error
			}
			return nil
		})
	}
	if err := g.Wait(); err != nil {
		if _, ok := err.(*EncodeError); ok {
			as.L.Err(err).Msg("Unable to encode")
			http.Error(rw, "Internal Server Error", http.StatusInternalServerError)
		} else {
			http.Error(rw, "Unable to find prices for at least one in a group", http.StatusBadRequest)
		}

		return
	}
	<-enc.Done()
}
