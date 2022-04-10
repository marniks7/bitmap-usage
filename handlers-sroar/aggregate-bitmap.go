package handlerssroar

import (
	cache64 "bitmap-usage/cache64"
	indexsroar "bitmap-usage/index-sroar"
	model64 "bitmap-usage/model64"
	"github.com/ugorji/go/codec"
)

type BitmapAggregateService struct {
	CS          *cache64.CatalogService
	Index       *indexsroar.BitmapIndexService
	RequestChan chan model64.ChanFindPriceRequestBulk
	Codec       *codec.JsonHandle //temporary holder for 'code' lib testing
}

func NewBitmapAggregateService(cs *cache64.CatalogService, ind *indexsroar.BitmapIndexService) *BitmapAggregateService {
	ch := make(chan model64.ChanFindPriceRequestBulk, 50)
	return &BitmapAggregateService{CS: cs, Index: ind, RequestChan: ch}
}
