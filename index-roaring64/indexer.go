package indexroaring64

import (
	"bitmap-usage/cache64"
	"bitmap-usage/model64"
	"github.com/RoaringBitmap/roaring/roaring64"
)

func (s *BitmapIndexService) IndexPrices(catalog *cache64.Catalog) *PriceBitmaps {
	for key, v := range catalog.PriceConditions {
		v.IndexId = uint64(key)
	}

	groupBitmaps, groupIndex := mapGroupBitmaps(catalog.PriceConditions)
	specBitmaps, specIdToIndex := mapSpecBitmaps(catalog.PriceConditions)
	offeringBitmaps, offeringIdToIndex := offeringBitmaps(catalog.PriceConditions)
	defaultBitmaps := mapDefaultBitmaps(catalog.PriceConditions)
	charValuesBitmaps, charsToValuesIndex := conditionBitmaps(catalog.PriceConditions)

	indexToId := make([]string, len(catalog.PriceConditions))
	for i, v := range catalog.PriceConditions {
		indexToId[i] = v.ID
	}
	bmi := &PriceBitmaps{GroupBitmaps: groupBitmaps,
		SpecBitmaps:        specBitmaps,
		GroupIdIndex:       groupIndex,
		SpecIdToIndex:      specIdToIndex,
		OfferingIdToIndex:  offeringIdToIndex,
		OfferingBitmaps:    offeringBitmaps,
		DefaultBitmaps:     defaultBitmaps,
		CharValuesBitmaps:  charValuesBitmaps,
		CharsToValuesIndex: charsToValuesIndex,
		IndexToPriceId:     indexToId}
	s.Index = bmi
	return bmi
}

func offeringBitmaps(prices []*model64.PriceCondition) ([]*roaring64.Bitmap, map[string]uint64) {
	var count uint64 = 0
	index := make(map[string]uint64, 128)

	//find all unique values
	for _, v := range prices {
		if _, ok := index[v.OfferingID]; !ok {
			index[v.OfferingID] = count
			count++
		}
	}

	//pre-init bitmaps
	bitmaps := make([]*roaring64.Bitmap, len(index))
	for i := 0; i < len(bitmaps); i++ {
		bitmaps[i] = roaring64.NewBitmap()
	}
	//add prices to bitmaps
	for _, v := range prices {
		u := index[v.OfferingID]
		bitmap := bitmaps[u]
		bitmap.Add(v.IndexId)
	}
	return bitmaps, index
}

func conditionBitmaps(prices []*model64.PriceCondition) ([]*roaring64.Bitmap, map[string]map[string]uint64) {
	var valueCount uint64 = 0

	valueBitmaps := make([]*roaring64.Bitmap, 0, 10)
	charsToValuesIndex := make(map[string]map[string]uint64, 128)
	for _, v := range prices {
		for i, cc := range v.Chars {

			var valueToIndex map[string]uint64
			if u, ok := charsToValuesIndex[cc]; ok {
				valueToIndex = u
			} else {
				valueToIndex = make(map[string]uint64, 8)
				charsToValuesIndex[cc] = valueToIndex
			}

			val := v.Values[i]
			if u, ok := valueToIndex[val]; ok {
				valueBitmaps[u].Add(v.IndexId)
			} else {
				valueToIndex[val] = valueCount
				bitmap := roaring64.NewBitmap()
				bitmap.Add(v.IndexId)
				valueBitmaps = append(valueBitmaps, bitmap)
				valueCount++
			}
		}
	}

	return valueBitmaps, charsToValuesIndex
}

func mapGroupBitmaps(prices []*model64.PriceCondition) ([]*roaring64.Bitmap, map[string]uint16) {
	index := make(map[string]uint16)

	//find all unique groups
	var count uint16 = 0
	for _, v := range prices {
		if _, ok := index[v.GroupId]; !ok {
			index[v.GroupId] = count
			count++
		}
	}

	//pre-init bitmaps
	bitmaps := make([]*roaring64.Bitmap, len(index))
	for i := 0; i < len(bitmaps); i++ {
		bitmaps[i] = roaring64.NewBitmap()
	}
	//add prices to bitmaps
	for _, v := range prices {
		u := index[v.GroupId]
		bitmap := bitmaps[u]
		bitmap.Add(v.IndexId)
	}
	return bitmaps, index
}

func mapSpecBitmaps(prices []*model64.PriceCondition) ([]*roaring64.Bitmap, map[string]uint8) {
	index := make(map[string]uint8)

	//find all unique list keys
	var count uint8 = 0
	for _, v := range prices {
		if _, ok := index[v.Spec]; !ok {
			index[v.Spec] = count
			count++
		}
	}

	//pre-init bitmaps
	bitmaps := make([]*roaring64.Bitmap, len(index))
	for i := 0; i < len(bitmaps); i++ {
		bitmaps[i] = roaring64.NewBitmap()
	}
	for _, v := range prices {
		u := index[v.Spec]
		bitmap := bitmaps[u]
		bitmap.Add(v.IndexId)
	}
	return bitmaps, index
}

func mapDefaultBitmaps(prices []*model64.PriceCondition) *roaring64.Bitmap {
	bitmap := roaring64.NewBitmap()
	for _, v := range prices {
		if v.IsDefault {
			bitmap.Add(v.IndexId)
		}
	}
	return bitmap
}
