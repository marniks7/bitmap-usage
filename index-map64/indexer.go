package indexmap64

import (
	cache64 "bitmap-usage/cache64"
	model64 "bitmap-usage/model64"
)

func (s *MapIndexService) IndexPrices(catalog *cache64.Catalog) {
	offeringToConditions := make(map[string][]*model64.PriceCondition)
	for _, v := range catalog.PriceConditions {
		if _, ok := offeringToConditions[v.OfferingID]; !ok {
			offeringToConditions[v.OfferingID] = []*model64.PriceCondition{v}
		} else {
			offeringToConditions[v.OfferingID] = append(offeringToConditions[v.OfferingID], v)
		}
	}
	s.Index = offeringToConditions
}
