package handlers_roaring

import (
	"bitmap-usage/cache"
	"bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"github.com/rs/zerolog"
)

type AggregateService struct {
	L           zerolog.Logger
	CS          *cache.CatalogService
	Index       *indexRoaring.BitmapIndexService
	RequestChan chan model.ChanFindPriceRequestBulk
}

func NewAggregateService(l zerolog.Logger, cs *cache.CatalogService,
	ind *indexRoaring.BitmapIndexService) *AggregateService {
	ch := make(chan model.ChanFindPriceRequestBulk, 50)
	return &AggregateService{L: l, CS: cs, Index: ind, RequestChan: ch}
}
