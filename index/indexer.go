package index

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
	"github.com/RoaringBitmap/roaring"
)

func (s *Service) IndexPrices(catalog *cache.Catalog) *PriceBitmaps {
	groupBitmaps, groupIndex := mapGroupBitmaps(catalog.PriceConditions)
	specBitmaps, specIdToIndex := mapSpecBitmaps(catalog.PriceConditions)
	offeringBitmaps, offeringIdToIndex := offeringBitmaps(catalog.PriceConditions)
	defaultBitmaps := mapDefaultBitmaps(catalog.PriceConditions)
	charBitmaps, charIdToIndex, charValuesBitmaps, charValueToIndex := conditionBitmaps(catalog.PriceConditions)

	indexToId := make([]string, len(catalog.PriceConditions))
	for i, v := range catalog.PriceConditions {
		indexToId[i] = v.ID
	}
	bmi := &PriceBitmaps{groupBitmaps: groupBitmaps,
		specBitmaps:        specBitmaps,
		groupIdIndex:       groupIndex,
		specIdToIndex:      specIdToIndex,
		offeringIdToIndex:  offeringIdToIndex,
		offeringBitmaps:    offeringBitmaps,
		defaultBitmaps:     defaultBitmaps,
		charBitmaps:        charBitmaps,
		charIdToIndex:      charIdToIndex,
		charValueIdToIndex: charValueToIndex,
		charValuesBitmaps:  charValuesBitmaps,
		indexToPriceId:     indexToId}
	s.Index = bmi
	return bmi
}

func offeringBitmaps(prices []*model.PriceConditions) ([]*roaring.Bitmap, map[string]uint32) {
	var count32 uint32 = 0
	offeringIdToIndex := make(map[string]uint32, 100)
	offeringBitmaps := make([]*roaring.Bitmap, 0, len(offeringIdToIndex))
	for _, v := range prices {
		if u, ok := offeringIdToIndex[v.OfferingID]; ok {
			offeringBitmaps[u].Add(v.IndexId)
		} else {
			bmp := roaring.NewBitmap()
			bmp.Add(v.IndexId)
			offeringBitmaps = append(offeringBitmaps, bmp)
			offeringIdToIndex[v.OfferingID] = count32
			count32++
		}
	}
	return offeringBitmaps, offeringIdToIndex
}

func conditionBitmaps(prices []*model.PriceConditions) ([]*roaring.Bitmap, map[string]uint32, []*roaring.Bitmap, map[string]uint32) {
	var charCount32 uint32 = 0
	var valueCount32 uint32 = 0
	characteristicBitmaps := make([]*roaring.Bitmap, 0, 10)
	characteristicToIndex := make(map[string]uint32, 100)

	valueBitmaps := make([]*roaring.Bitmap, 0, 10)
	valuesToIndex := make(map[string]uint32, 100)
	for _, v := range prices {
		for i, cc := range v.Chars {

			if u, ok := characteristicToIndex[cc]; ok {
				characteristicBitmaps[u].Add(v.IndexId)
			} else {
				characteristicToIndex[cc] = charCount32
				bitmap := roaring.NewBitmap()
				bitmap.Add(v.IndexId)
				characteristicBitmaps = append(characteristicBitmaps, bitmap)
				charCount32++
			}

			val := v.Values[i]
			if u, ok := valuesToIndex[val]; ok {
				valueBitmaps[u].Add(v.IndexId)
			} else {
				valuesToIndex[val] = valueCount32
				bitmap := roaring.NewBitmap()
				bitmap.Add(v.IndexId)
				valueBitmaps = append(valueBitmaps, bitmap)
				valueCount32++
			}
		}
	}

	return characteristicBitmaps, characteristicToIndex, valueBitmaps, valuesToIndex
}

func mapGroupBitmaps(prices []*model.PriceConditions) ([]*roaring.Bitmap, map[string]uint16) {
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
	bitmaps := make([]*roaring.Bitmap, len(index))
	for i := 0; i < len(bitmaps); i++ {
		bitmaps[i] = roaring.NewBitmap()
	}
	//add prices to bitmaps
	for _, v := range prices {
		u := index[v.GroupId]
		bitmap := bitmaps[u]
		bitmap.Add(v.IndexId)
	}
	return bitmaps, index
}

func mapSpecBitmaps(prices []*model.PriceConditions) ([]*roaring.Bitmap, map[string]uint8) {
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
	bitmaps := make([]*roaring.Bitmap, len(index))
	for i := 0; i < len(bitmaps); i++ {
		bitmaps[i] = roaring.NewBitmap()
	}
	for _, v := range prices {
		u := index[v.Spec]
		bitmap := bitmaps[u]
		bitmap.Add(v.IndexId)
	}
	return bitmaps, index
}

func mapDefaultBitmaps(prices []*model.PriceConditions) *roaring.Bitmap {
	bitmap := roaring.NewBitmap()
	for _, v := range prices {
		if v.IsDefault {
			bitmap.Add(v.IndexId)
		}
	}
	return bitmap
}
