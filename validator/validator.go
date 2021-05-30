package validator

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
	"fmt"
	"sort"
	"strings"
)

func Validate(catalog *cache.Catalog) error {
	//group by offering
	offeringToConditions := make(map[string][]*model.PriceCondition)
	for _, v := range catalog.PriceConditions {
		if _, ok := offeringToConditions[v.OfferingID]; !ok {
			offeringToConditions[v.OfferingID] = []*model.PriceCondition{v}
		} else {
			offeringToConditions[v.OfferingID] = append(offeringToConditions[v.OfferingID], v)
		}
	}
	//validate all prices per offering are unique
	for _, v := range offeringToConditions {
		uniquePrices := make(map[string]bool, len(v))
		for _, cond := range v {
			var b strings.Builder
			b.Grow(32)
			b.WriteString(cond.GroupId)
			b.WriteString(cond.Spec)
			//b.WriteString(cond.Currency)

			var list []KeyValue
			for i, ch := range cond.Chars {
				list = append(list, KeyValue{ch, cond.Values[i]})
			}
			sort.SliceStable(list, func(i, j int) bool {
				return strings.Compare(list[i].Key, list[j].Key) < 0
			})
			for _, ch := range list {
				b.WriteString(ch.Key)
				b.WriteString(ch.Value)
			}
			hash := b.String()
			if _, ok := uniquePrices[hash]; ok {
				return &NonUniquePricesError{Value: hash, Id: cond.ID}
			} else {
				uniquePrices[hash] = true
			}

		}
	}
	return nil
}

type KeyValue struct {
	Key   string
	Value string
}

type NonUniquePricesError struct {
	Value string
	Id    string
}

func (e *NonUniquePricesError) Error() string {
	return fmt.Sprintf("Found at least 2 non-unique prices - %v. One of ids: %v. Check catalog or list of expected unique fields", e.Value, e.Id)
}
