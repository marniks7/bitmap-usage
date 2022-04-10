package cache64

import (
	model64 "bitmap-usage/model64"
)

type Catalog struct {
	PriceConditions []*model64.PriceCondition
	Prices          map[string]*model64.Price
}

func NewCatalog() *Catalog {
	return &Catalog{}
}

type CatalogService struct {
	Catalog *Catalog
}

func NewCatalogService(catalog *Catalog) *CatalogService {
	return &CatalogService{Catalog: catalog}
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
