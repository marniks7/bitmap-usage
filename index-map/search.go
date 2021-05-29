package indexMap

import (
	"bitmap-usage/model"
	"errors"
)

var ErrUnableToFindPrice = errors.New("unable find price")
var ErrUnableToFindPriceMoreThenOneNoDefault = errors.New("unable find price, no default and >1 found")
var ErrUnableToFindPriceDefaults = errors.New("unable find price, >1 default prices")

func (ind *MapIndexService) FindPriceBy(offeringId, groupId, specId string,
	charValues []model.CharValue) (*model.PriceCondition, error, int) {
	var pc *model.PriceCondition
	defaultPriceFound := false
	count := 0
	// this is just for benchmarking purposes to understand where price is
	firstValueIndex := 0
	moreThen1PriceFound := false
	for _, v := range ind.Ind[offeringId] {
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
				firstValueIndex = count
				if pc == nil {
					pc = v
					if v.IsDefault {
						defaultPriceFound = true
					}
				} else {
					moreThen1PriceFound = true
					if v.IsDefault {
						if defaultPriceFound {
							return nil, ErrUnableToFindPriceDefaults, -1
						} else {
							defaultPriceFound = true
							pc = v
						}
					}
				}
			}
		}
	}
	if pc == nil {
		return nil, ErrUnableToFindPrice, -1
	}
	if moreThen1PriceFound && !defaultPriceFound {
		return nil, ErrUnableToFindPriceMoreThenOneNoDefault, -1
	}
	return pc, nil, firstValueIndex
}
