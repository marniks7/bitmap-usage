package indexmap64

import (
	model64 "bitmap-usage/model64"
	"errors"
	"sort"
)

var ErrUnableToFindPrice = errors.New("unable find price")
var ErrUnableToFindPriceMoreThenOneNoDefault = errors.New("unable find price, no default and >1 found")

// FindPriceBy search price based on criterias.
// In case if there are >1 prices found - return first default price
// If price is not found or there are >1 price and no default - return error
func (ind *MapIndexService) FindPriceBy(offeringId, groupId, specId string,
	charValues []model64.CharValue) (*model64.Price, error, int) {
	var pc *model64.PriceCondition
	count := 0
	// this is just for benchmarking purposes to understand where price is
	valueIndex := 0
	moreThen1PriceFoundNoDefaultYet := false
	isOptimizationApplied := false
	if ind.OfferingToCharIndex != nil && len(ind.OfferingToCharIndex) != 0 {
		m := ind.OfferingToCharIndex[offeringId]
		if m != nil {
			if len(m) != len(charValues) {
				//optimization is not applicable
			} else {
				isOptimizationApplied = true
				sort.Slice(charValues, func(i, j int) bool {
					return m[charValues[i].Char] < m[charValues[j].Char]
				})
			}

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
					if isOptimizationApplied {
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
				if isOptimizationApplied {
					return &model64.Price{Id: v.ID, Spec: v.Spec, Value: v.Value, Currency: v.Currency}, nil, valueIndex
				}
				if pc == nil {
					pc = v
				} else {
					moreThen1PriceFoundNoDefaultYet = true
				}
				if v.IsDefault {
					return &model64.Price{Id: v.ID, Spec: v.Spec, Value: v.Value, Currency: v.Currency}, nil, valueIndex
				}
			}
		}
	}
	if pc == nil {
		return nil, ErrUnableToFindPrice, -1
	}
	if moreThen1PriceFoundNoDefaultYet {
		return nil, ErrUnableToFindPriceMoreThenOneNoDefault, -1
	}
	return &model64.Price{Id: pc.ID, Spec: pc.Spec, Value: pc.Value, Currency: pc.Currency}, nil, valueIndex
}
