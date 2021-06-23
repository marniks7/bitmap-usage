package indexsroar

import (
	cache64 "bitmap-usage/cache64"
	model64 "bitmap-usage/model64"
	"github.com/dgraph-io/sroar"
)

func (s *BitmapIndexService) IndexPrices(catalog *cache64.Catalog) *PriceBitmaps {
	for key, v := range catalog.PriceConditions {
		v.IndexId = uint64(key)
	}

	groupBitmaps, groupIndex := mapGroupBitmaps(catalog.PriceConditions)
	specBitmaps, specIdToIndex := mapSpecBitmaps(catalog.PriceConditions)
	offeringBitmaps, offeringIdToIndex := offeringBitmaps(catalog.PriceConditions)
	defaultBitmaps := mapDefaultBitmaps(catalog.PriceConditions)
	charBitmaps, charIdToIndex, charValuesBitmaps, charValueToIndex := conditionBitmaps(catalog.PriceConditions)

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
		CharBitmaps:        charBitmaps,
		CharIdToIndex:      charIdToIndex,
		CharValueIdToIndex: charValueToIndex,
		CharValuesBitmaps:  charValuesBitmaps,
		IndexToPriceId:     indexToId}
	s.Index = bmi
	return bmi
}

func offeringBitmaps(prices []*model64.PriceCondition) ([]*sroar.Bitmap, map[string]uint32) {
	var count uint32 = 0
	index := make(map[string]uint32, 128)

	//find all unique values
	for _, v := range prices {
		if _, ok := index[v.OfferingID]; !ok {
			index[v.OfferingID] = count
			count++
		}
	}

	//pre-init bitmaps
	bitmaps := make([]*sroar.Bitmap, len(index))
	for i := 0; i < len(bitmaps); i++ {
		bitmaps[i] = sroar.NewBitmap()
	}
	//add prices to bitmaps
	for _, v := range prices {
		u := index[v.OfferingID]
		bitmap := bitmaps[u]
		bitmap.Set(v.IndexId)
	}
	return bitmaps, index
}

func conditionBitmaps(prices []*model64.PriceCondition) ([]*sroar.Bitmap, map[string]uint32, []*sroar.Bitmap, map[string]uint32) {
	var charCount uint32 = 0
	var valueCount uint32 = 0
	characteristicBitmaps := make([]*sroar.Bitmap, 0, 10)
	characteristicToIndex := make(map[string]uint32, 128)

	valueBitmaps := make([]*sroar.Bitmap, 0, 10)
	valuesToIndex := make(map[string]uint32, 128)
	for _, v := range prices {
		for i, cc := range v.Chars {

			if u, ok := characteristicToIndex[cc]; ok {
				characteristicBitmaps[u].Set(v.IndexId)
			} else {
				characteristicToIndex[cc] = charCount
				bitmap := sroar.NewBitmap()
				bitmap.Set(v.IndexId)
				characteristicBitmaps = append(characteristicBitmaps, bitmap)
				charCount++
			}

			val := v.Values[i]
			if u, ok := valuesToIndex[val]; ok {
				valueBitmaps[u].Set(v.IndexId)
			} else {
				valuesToIndex[val] = valueCount
				bitmap := sroar.NewBitmap()
				bitmap.Set(v.IndexId)
				valueBitmaps = append(valueBitmaps, bitmap)
				valueCount++
			}
		}
	}

	return characteristicBitmaps, characteristicToIndex, valueBitmaps, valuesToIndex
}

func mapGroupBitmaps(prices []*model64.PriceCondition) ([]*sroar.Bitmap, map[string]uint16) {
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
	bitmaps := make([]*sroar.Bitmap, len(index))
	for i := 0; i < len(bitmaps); i++ {
		bitmaps[i] = sroar.NewBitmap()
	}
	//add prices to bitmaps
	for _, v := range prices {
		u := index[v.GroupId]
		bitmap := bitmaps[u]
		bitmap.Set(v.IndexId)
	}
	return bitmaps, index
}

func mapSpecBitmaps(prices []*model64.PriceCondition) ([]*sroar.Bitmap, map[string]uint8) {
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
	bitmaps := make([]*sroar.Bitmap, len(index))
	for i := 0; i < len(bitmaps); i++ {
		bitmaps[i] = sroar.NewBitmap()
	}
	for _, v := range prices {
		u := index[v.Spec]
		bitmap := bitmaps[u]
		bitmap.Set(v.IndexId)
	}
	return bitmaps, index
}

func mapDefaultBitmaps(prices []*model64.PriceCondition) *sroar.Bitmap {
	bitmap := sroar.NewBitmap()
	for _, v := range prices {
		if v.IsDefault {
			bitmap.Set(v.IndexId)
		}
	}
	return bitmap
}
