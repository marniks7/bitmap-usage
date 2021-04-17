package cache

import (
	"bitmap-usage/model"
	"github.com/rs/zerolog"
)

type Catalog struct {
	L               zerolog.Logger
	PriceConditions []*model.PriceConditions
	Prices          map[string]*model.Price
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

// FinishInitialization creates prices and removes price conditions
func (cs *CatalogService) FinishInitialization() {
	cs.Catalog.Prices = make(map[string]*model.Price, len(cs.Catalog.PriceConditions))
	for _, v := range cs.Catalog.PriceConditions {
		cs.Catalog.Prices[v.ID] = &model.Price{ID: v.ID, Spec: v.Spec, Value: v.Value, Currency: v.Currency}
	}
	cs.Catalog.PriceConditions = nil
}
