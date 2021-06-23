package handlersmap64

import (
	cache64 "bitmap-usage/cache64"
	indexmap64 "bitmap-usage/index-map64"
	model64 "bitmap-usage/model64"
	"github.com/rs/zerolog"
)

type MapAggregateService struct {
	L           zerolog.Logger
	CS          *cache64.CatalogService
	Index       *indexmap64.MapIndexService
	RequestChan chan model64.ChanFindPriceRequestBulk
}

func NewMapAggregateService(l zerolog.Logger, cs *cache64.CatalogService,
	ind *indexmap64.MapIndexService) *MapAggregateService {
	ch := make(chan model64.ChanFindPriceRequestBulk, 50)
	return &MapAggregateService{L: l, CS: cs, Index: ind, RequestChan: ch}
}
