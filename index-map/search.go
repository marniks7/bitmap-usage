package indexMap

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
	charValues []model.CharValue) (*model.PriceCondition, error, int) {
	var pc *model.PriceCondition
	count := 0
	// this is just for benchmarking purposes to understand where price is
	valueIndex := 0
	moreThen1PriceFound := false
	for _, v := range ind.Index[offeringId] {
		count++
		if v.OfferingID == offeringId && v.Spec == specId && v.GroupId == groupId {
			foundByChars := false
			if len(charValues) == 0 {
				foundByChars = true
			} else {
				for _, inpt := range charValues {
					found := false
					for i, ch := range v.Chars {
						if inpt.Char == ch {
							if inpt.Value == v.Values[i] {
								found = true
							}
							break
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
