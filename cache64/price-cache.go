package cache64

import (
	model64 "bitmap-usage/model64"
	"github.com/rs/zerolog"
)

type Catalog struct {
	L               zerolog.Logger
	PriceConditions []*model64.PriceCondition
	Prices          map[string]*model64.Price
}

func NewCatalog(l zerolog.Logger) *Catalog {
	return &Catalog{L: l}
}

type CatalogService struct {
	L       zerolog.Logger
	Catalog *Catalog
}

func NewCatalogService(l zerolog.Logger, catalog *Catalog) *CatalogService {
	return &CatalogService{L: l, Catalog: catalog}
}

// GeneratePricesByConditionsAndClear creates prices and removes price conditions
func (cs *CatalogService) GeneratePricesByConditionsAndClear() {
	cs.Catalog.Prices = make(map[string]*model64.Price, len(cs.Catalog.PriceConditions))
	for _, v := range cs.Catalog.PriceConditions {
		cs.Catalog.Prices[v.ID] = &model64.Price{Id: v.ID, Spec: v.Spec, Value: v.Value, Currency: v.Currency}
	}
	cs.Catalog.PriceConditions = nil
}

// GeneratePricesByConditions creates prices
func (cs *CatalogService) GeneratePricesByConditions() {
	cs.Catalog.Prices = make(map[string]*model64.Price, len(cs.Catalog.PriceConditions))
	for _, v := range cs.Catalog.PriceConditions {
		cs.Catalog.Prices[v.ID] = &model64.Price{Id: v.ID, Spec: v.Spec, Value: v.Value, Currency: v.Currency}
	}
}
