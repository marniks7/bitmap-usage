package handlersmap

import (
	"bitmap-usage/cache"
	indexMap "bitmap-usage/index-map"
	"bitmap-usage/model"
)

type MapAggregateService struct {
	CS          *cache.CatalogService
	Index       *indexMap.MapIndexService
	RequestChan chan model.ChanFindPriceRequestBulk
}

func NewMapAggregateService(cs *cache.CatalogService, ind *indexMap.MapIndexService) *MapAggregateService {
	ch := make(chan model.ChanFindPriceRequestBulk, 50)
	return &MapAggregateService{CS: cs, Index: ind, RequestChan: ch}
}
