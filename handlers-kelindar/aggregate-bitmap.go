package handlerskelindar

import (
	"bitmap-usage/cache"
	indexroaring "bitmap-usage/index-kelindar"
	"bitmap-usage/model"
	"github.com/rs/zerolog"
	"github.com/ugorji/go/codec"
)

type BitmapAggregateService struct {
	L           zerolog.Logger
	CS          *cache.CatalogService
	Index       *indexroaring.Holder
	RequestChan chan model.ChanFindPriceRequestBulk
	Codec       *codec.JsonHandle //temporary holder for 'code' lib testing
}

func NewBitmapAggregateService(l zerolog.Logger, cs *cache.CatalogService,
	ind *indexroaring.Holder) *BitmapAggregateService {
	ch := make(chan model.ChanFindPriceRequestBulk, 50)
	return &BitmapAggregateService{L: l, CS: cs, Index: ind, RequestChan: ch}
}
