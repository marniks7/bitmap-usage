package handlers

import (
	"bitmap-usage/cache"
	"bitmap-usage/index"
	"bitmap-usage/model"
	"github.com/rs/zerolog"
)

type AggregateService struct {
	L           zerolog.Logger
	CS          *cache.CatalogService
	Index       *index.BitMapIndexService
	RequestChan chan model.ChanFindPriceRequestBulk
}

func NewAggregateService(l zerolog.Logger, cs *cache.CatalogService,
	ind *index.BitMapIndexService) *AggregateService {
	ch := make(chan model.ChanFindPriceRequestBulk, 50)
	return &AggregateService{L: l, CS: cs, Index: ind, RequestChan: ch}
}
