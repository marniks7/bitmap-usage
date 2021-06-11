package handlers_map

import (
	"bitmap-usage/cache"
	indexMap "bitmap-usage/index-map"
	"bitmap-usage/model"
	"github.com/rs/zerolog"
)

type MapAggregateService struct {
	L           zerolog.Logger
	CS          *cache.CatalogService
	Index       *indexMap.MapIndexService
	RequestChan chan model.ChanFindPriceRequestBulk
}

func NewMapAggregateService(l zerolog.Logger, cs *cache.CatalogService,
	ind *indexMap.MapIndexService) *MapAggregateService {
	ch := make(chan model.ChanFindPriceRequestBulk, 50)
	return &MapAggregateService{L: l, CS: cs, Index: ind, RequestChan: ch}
}
