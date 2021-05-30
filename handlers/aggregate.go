package handlers

import (
	"bitmap-usage/cache"
	"bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"github.com/rs/zerolog"
)

type AggregateService struct {
	L           zerolog.Logger
	CS          *cache.CatalogService
	Index       *index_roaring.BitMapIndexService
	RequestChan chan model.ChanFindPriceRequestBulk
}

func NewAggregateService(l zerolog.Logger, cs *cache.CatalogService,
	ind *index_roaring.BitMapIndexService) *AggregateService {
	ch := make(chan model.ChanFindPriceRequestBulk, 50)
	return &AggregateService{L: l, CS: cs, Index: ind, RequestChan: ch}
}
