package indexMap

import (
	"bitmap-usage/model"
	"errors"
	"sort"
)

var ErrUnableToFindPrice = errors.New("unable find price")
var ErrUnableToFindPriceMoreThenOneNoDefault = errors.New("unable find price, no default and >1 found")

// FindPriceBy search price based on criterias.
// In case if there are >1 prices found - return first default price
// If price is not found or there are >1 price and no default - return error
//
// Note: This find price returns model.PriceCondition instead model.Price.
// This can be changed in future
func (ind *MapIndexService) FindPriceBy(offeringId, groupId, specId string,
	charValues []model.CharValue) (*model.PriceCondition, error, int) {
	var pc *model.PriceCondition
	count := 0
	// this is just for benchmarking purposes to understand where price is
	valueIndex := 0
	moreThen1PriceFound := false
	isOptimizationTurnedOn := false
	if ind.OfferingToCharIndex != nil {
		m := ind.OfferingToCharIndex[offeringId]
		if m != nil {
			isOptimizationTurnedOn = true
			sort.Slice(charValues, func(i, j int) bool {
				return m[charValues[i].Char] < m[charValues[j].Char]
			})
		}
	}
	for _, v := range ind.Index[offeringId] {
		count++
		if v.OfferingID == offeringId && v.Spec == specId && v.GroupId == groupId {
			foundByChars := false
			if len(charValues) == 0 {
				foundByChars = true
			} else {
				for i, inpt := range charValues {
					found := false
					if isOptimizationTurnedOn {
						found = v.Chars[i] == inpt.Char && v.Values[i] == inpt.Value
					} else {
						for i, ch := range v.Chars {
							if inpt.Char == ch {
								if inpt.Value == v.Values[i] {
									found = true
								}
								break
							}
						}
					}
					if found {
						foundByChars = true
					} else {
						foundByChars = false
						break
					}
				}
			}
			if foundByChars == true {
				valueIndex = count
				if isOptimizationTurnedOn {
					return v, nil, valueIndex
				}
				if pc == nil {
					pc = v
				} else {
					moreThen1PriceFound = true
				}
				if v.IsDefault {
					return v, nil, valueIndex
				}
			}
		}
	}
	if pc == nil {
		return nil, ErrUnableToFindPrice, -1
	}
	if moreThen1PriceFound {
		return nil, ErrUnableToFindPriceMoreThenOneNoDefault, -1
	}
	return pc, nil, valueIndex
}
