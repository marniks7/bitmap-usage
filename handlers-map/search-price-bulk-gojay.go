package handlersmap

import (
	"bitmap-usage/misc"
	"bitmap-usage/model"
	"encoding/json"
	"github.com/francoispqt/gojay"
	"golang.org/x/sync/errgroup"
	"net/http"
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
		misc.HandleDecodeError(rw, err)
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
