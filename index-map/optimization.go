package indexmap

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
	"math"
)

// Optimize - the primary idea of that optimization is data.
// It is assumed that prices are configured based on Templates:
// All (or almost all) prices for one offering depends on the same list of characteristics.
// And if the whole list is passed from client - the only one price exists
//
// Example when this optimization is useful:
// char1 value1 - 20 (Default)
// char1 value1 char2 value2.1 - 50
// char1 value1 char2 value2.2 - 100
// char1 value1.2 char2 value2.3- 40
//
// Example when this optimization is NOT useful:
// Prices for one offering depends on different chars
// char1 value1 char2 value2
// char3 value3 char4 value4
// char5 value5 char6 value6
//
// This optimization allows to achieve two things:
// 1. reorder list of characteristics (and values) to the same single order
// 		cause of that it will be possible to search by char position instead of equals or maps usage
//		which is efficient in case if there are a lot of prices for each offering
// Example. Before Optimization (unordered):
// char1 value1 - 20 (Default)
// char2  value2.1 char1 value1 - 50
// char1 value1 char2 value2.2 - 100
// char2 value2.3 char1 value1- 40
//
// Example. After Optimization (ordered):
// char1 value1 - 20 (Default)
// char1 value1 char2 value2.1 - 50
// char1 value1 char2 value2.2 - 100
// char1 value1.2 char2 value2.3- 40
//
// 2. In case if request to search contains all chars - use first found price - it will be the only one applicable
// This assumption is based on the fact that there should be the only unique price exist
// if few unique prices (which is wrong configuration) - system will use first found.
// At the same time to ensure that all prices are unique could be used validator.Validate
//
// To ensure quality of the optimization it prints the results in percentage. Closer to 100% - the better.
//
// Works for 'Equals' and could be adopted for 'In'. In case if there are prices with `Not Equals` or `Not in` -
// should be carefully analyzed.
func (s *MapIndexService) Optimize(catalog *cache.Catalog) (float64, error) {
	//group by offering
	offeringToConditions := make(map[string][]*model.PriceCondition)
	for _, v := range catalog.PriceConditions {
		if _, ok := offeringToConditions[v.OfferingID]; !ok {
			offeringToConditions[v.OfferingID] = []*model.PriceCondition{v}
		} else {
			offeringToConditions[v.OfferingID] = append(offeringToConditions[v.OfferingID], v)
		}
	}
	mk := make(map[string]map[string]uint16)
	total := 0
	totalQuality := 0
	for offering, v := range offeringToConditions {
		//find all price impacting chars
		count := 0
		//todo make deduplication of this map (reuse it)
		mp := make(map[string]uint16)
		for _, cond := range v {
			for _, ch := range cond.Chars {
				if _, ok := mp[ch]; !ok {
					mp[ch] = uint16(count)
					count++
				}
			}
		}

		totalPerOffering := len(v)
		qualityPerOffering := len(v)
		//optimization, order chars and values
		for _, cond := range v {
			if len(cond.Chars) == len(mp) {
				for i := 0; i < len(mp); i++ {
					//swap
					newIndex := mp[cond.Chars[i]]
					cond.Chars[newIndex], cond.Chars[i] = cond.Chars[i], cond.Chars[newIndex]
					cond.Values[newIndex], cond.Values[i] = cond.Values[i], cond.Values[newIndex]
				}
			} else {
				qualityPerOffering--
				//todo make deduplication of this char array (reuse it)
				newChars := make([]string, len(mp))
				newCharValues := make([]string, len(mp))
				for i := 0; i < len(cond.Chars); i++ {
					newInd := mp[cond.Chars[i]]
					newChars[newInd] = cond.Chars[i]
					newCharValues[newInd] = cond.Values[i]
				}
				cond.Chars = newChars
				cond.Values = newCharValues
			}
			mk[offering] = mp
		}
		total += totalPerOffering
		totalQuality += qualityPerOffering
	}
	s.OfferingToCharIndex = mk

	if total != 0 {
		return math.Round(float64(100 * totalQuality / total)), nil
	}

	return 0, nil
}
