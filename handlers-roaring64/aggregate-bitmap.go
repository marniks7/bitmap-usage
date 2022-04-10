package handlersroaring64

import (
	cache64 "bitmap-usage/cache64"
	indexroaring64 "bitmap-usage/index-roaring64"
	model64 "bitmap-usage/model64"
	"github.com/ugorji/go/codec"
)

type BitmapAggregateService struct {
	CS          *cache64.CatalogService
	Index       *indexroaring64.BitmapIndexService
	RequestChan chan model64.ChanFindPriceRequestBulk
	Codec       *codec.JsonHandle //temporary holder for 'code' lib testing
}

func NewBitmapAggregateService(cs *cache64.CatalogService, ind *indexroaring64.BitmapIndexService) *BitmapAggregateService {
	ch := make(chan model64.ChanFindPriceRequestBulk, 50)
	return &BitmapAggregateService{CS: cs, Index: ind, RequestChan: ch}
}
