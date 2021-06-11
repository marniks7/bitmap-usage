package handlers_roaring

import (
	"bitmap-usage/cache"
	"bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"github.com/rs/zerolog"
)

type BitmapAggregateService struct {
	L           zerolog.Logger
	CS          *cache.CatalogService
	Index       *indexRoaring.BitmapIndexService
	RequestChan chan model.ChanFindPriceRequestBulk
}

func NewBitmapAggregateService(l zerolog.Logger, cs *cache.CatalogService,
	ind *indexRoaring.BitmapIndexService) *BitmapAggregateService {
	ch := make(chan model.ChanFindPriceRequestBulk, 50)
	return &BitmapAggregateService{L: l, CS: cs, Index: ind, RequestChan: ch}
}
