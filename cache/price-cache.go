package cache

import (
	"bitmap-usage/model"
)

type Catalog struct {
	PriceConditions []*model.PriceCondition
	Prices          map[string]*model.Price
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

func Statistics(catalog *Catalog) *CatalogStats {
	offeringTo := make(map[string]int)
	specTo := make(map[string]int)
	groupTo := make(map[string]int)
	currencyTo := make(map[string]int)
	charsTo := make(map[string]int)
	valuesTo := make(map[string]int)
	for _, pc := range catalog.PriceConditions {
		offeringTo[pc.OfferingID] += 1
		specTo[pc.Spec] += 1
		groupTo[pc.GroupId] += 1
		currencyTo[pc.Currency] += 1
		for _, c := range pc.Chars {
			charsTo[c] += 1
		}
		for _, v := range pc.Values {
			valuesTo[v] += 1
		}
	}
	return &CatalogStats{Offering: offeringTo, Spec: specTo,
		Group: groupTo, Currency: currencyTo,
		Chars: charsTo, Values: valuesTo}
}

type CatalogStats struct {
	Offering map[string]int
	Spec     map[string]int
	Group    map[string]int
	Currency map[string]int
	Chars    map[string]int
	Values   map[string]int
}

// GeneratePricesByConditionsAndClear creates prices and removes price conditions
func (cs *CatalogService) GeneratePricesByConditionsAndClear() {
	cs.Catalog.Prices = make(map[string]*model.Price, len(cs.Catalog.PriceConditions))
	for _, v := range cs.Catalog.PriceConditions {
		cs.Catalog.Prices[v.ID] = &model.Price{Id: v.ID, Spec: v.Spec, Value: v.Value, Currency: v.Currency}
	}
	cs.Catalog.PriceConditions = nil
}

// GeneratePricesByConditions creates prices
func (cs *CatalogService) GeneratePricesByConditions() {
	cs.Catalog.Prices = make(map[string]*model.Price, len(cs.Catalog.PriceConditions))
	for _, v := range cs.Catalog.PriceConditions {
		cs.Catalog.Prices[v.ID] = &model.Price{Id: v.ID, Spec: v.Spec, Value: v.Value, Currency: v.Currency}
	}
}
