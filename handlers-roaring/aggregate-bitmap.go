package handlersroaring

import (
	"bitmap-usage/cache"
	"bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"github.com/ugorji/go/codec"
)

type BitmapAggregateService struct {
	CS          *cache.CatalogService
	Index       *indexroaring.BitmapIndexService
	RequestChan chan model.ChanFindPriceRequestBulk
	Codec       *codec.JsonHandle //temporary holder for 'code' lib testing
}

func NewBitmapAggregateService(cs *cache.CatalogService, ind *indexroaring.BitmapIndexService) *BitmapAggregateService {
	ch := make(chan model.ChanFindPriceRequestBulk, 50)
	return &BitmapAggregateService{CS: cs, Index: ind, RequestChan: ch}
}
