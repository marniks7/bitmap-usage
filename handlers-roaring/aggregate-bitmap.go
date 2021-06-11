package handlersroaring

import (
	"bitmap-usage/cache"
	"bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"github.com/rs/zerolog"
)

type BitmapAggregateService struct {
	L           zerolog.Logger
	CS          *cache.CatalogService
	Index       *indexroaring.BitmapIndexService
	RequestChan chan model.ChanFindPriceRequestBulk
}

func NewBitmapAggregateService(l zerolog.Logger, cs *cache.CatalogService,
	ind *indexroaring.BitmapIndexService) *BitmapAggregateService {
	ch := make(chan model.ChanFindPriceRequestBulk, 50)
	return &BitmapAggregateService{L: l, CS: cs, Index: ind, RequestChan: ch}
}
