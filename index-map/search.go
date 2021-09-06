package indexmap

import (
	"bitmap-usage/model"
	"errors"
)

var ErrUnableToFindPrice = errors.New("unable find price")
var ErrUnableToFindPriceMoreThenOneNoDefault = errors.New("unable find price, no default and >1 found")

// FindPriceBy search price based on criterias.
// In case if there are >1 prices found - return first default price
// If price is not found or there are >1 price and no default - return error
func (ind *MapIndexService) FindPriceBy(offeringId, groupId, specId string,
	charValues []model.CharValue) (*model.Price, error, int) {
	var pc *model.PriceCondition
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

				//simple sort for small dataset and without allocations
				for j := 1; j < len(charValues); j++ {
					key := charValues[j]
					i := j - 1
					for i >= 0 && m[charValues[i].Char] > m[charValues[j].Char] {
						charValues[i+1] = charValues[i]
						i--
					}
					charValues[i+1] = key
				}
			}

		}
	}
	for _, v := range ind.Index[offeringId] {
		count++
		if v.OfferingID == offeringId &&
			v.Spec == specId &&
			v.GroupId == groupId {
			foundByChars := false
			if len(charValues) == 0 {
				foundByChars = true
			} else {
				for i, inpt := range charValues {
					found := false
					if isOptimizationApplied {
						found = v.Chars[i] == inpt.Char && v.Values[i] == inpt.Value
					} else {
						for j, ch := range v.Chars {
							if inpt.Char == ch {
								if inpt.Value == v.Values[j] {
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
					return &model.Price{Id: v.ID, Spec: v.Spec, Value: v.Value, Currency: v.Currency}, nil, valueIndex
				}
				if pc == nil {
					pc = v
				} else {
					moreThen1PriceFoundNoDefaultYet = true
				}
				if v.IsDefault {
					return &model.Price{Id: v.ID, Spec: v.Spec, Value: v.Value, Currency: v.Currency}, nil, valueIndex
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
	return &model.Price{Id: pc.ID, Spec: pc.Spec, Value: pc.Value, Currency: pc.Currency}, nil, valueIndex
}
