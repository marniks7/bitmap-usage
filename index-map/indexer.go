package indexMap

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
)

func (s *MapIndexService) IndexPrices(catalog *cache.Catalog) {
	offeringToConditions := make(map[string][]*model.PriceCondition)
	for _, v := range catalog.PriceConditions {
		if _, ok := offeringToConditions[v.OfferingID]; !ok {
			offeringToConditions[v.OfferingID] = []*model.PriceCondition{v}
		} else {
			offeringToConditions[v.OfferingID] = append(offeringToConditions[v.OfferingID], v)
		}
	}
	s.Index = offeringToConditions
}
