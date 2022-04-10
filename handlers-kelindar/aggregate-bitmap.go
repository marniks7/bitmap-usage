package handlerskelindar

import (
	"bitmap-usage/cache"
	indexroaring "bitmap-usage/index-kelindar"
	"bitmap-usage/model"
	"github.com/ugorji/go/codec"
)

type BitmapAggregateService struct {
	CS          *cache.CatalogService
	Index       *indexroaring.Holder
	RequestChan chan model.ChanFindPriceRequestBulk
	Codec       *codec.JsonHandle //temporary holder for 'code' lib testing
}

func NewBitmapAggregateService(cs *cache.CatalogService, ind *indexroaring.Holder) *BitmapAggregateService {
	ch := make(chan model.ChanFindPriceRequestBulk, 50)
	return &BitmapAggregateService{CS: cs, Index: ind, RequestChan: ch}
}
