package indexRoaring

import (
	"bitmap-usage/model"
	"errors"
	"github.com/RoaringBitmap/roaring"
)

var ErrUnableToFindCharId = errors.New("unable to find charId in index")
var ErrUnableToFindCharValue = errors.New("unable to find charValue in index")
var ErrUnableToFindOfferingId = errors.New("unable find offeringId in index")
var ErrUnableToFindGroupId = errors.New("unable find groupId in index")
var ErrUnableToFindSpecId = errors.New("unable find specId in index")
var ErrUnableToFindPrice = errors.New("unable find price")
var ErrUnableToFindPriceMoreThenOneNoDefault = errors.New("unable find price, no default and >1 found")

// FindPriceIndexBy search for price based on parameters and return index
func (s *BitmapIndexService) FindPriceIndexBy(offeringId, groupId, specId string,
	charValues []model.CharValue) (uint32, error) {

	var ob *roaring.Bitmap
	bmi := s.Index
	if u, ok := bmi.offeringIdToIndex[offeringId]; ok {
		ob = bmi.offeringBitmaps[u]
	} else {
		s.L.Error().Str("offeringId", offeringId).Msg("cannot find offeringId in index")
		return 0, ErrUnableToFindOfferingId
	}

	var result *roaring.Bitmap
	if len(charValues) > 0 {
		cv := charValues[0]
		if u, ok := bmi.charIdToIndex[cv.Char]; ok {
			bitmap := bmi.charBitmaps[u]
			result = roaring.And(ob, bitmap)
		} else {
			s.L.Error().Str("charId", cv.Char).Msg("Cannot find charId in index")
			return 0, ErrUnableToFindCharId
		}
		if u, ok := bmi.charValueIdToIndex[cv.Value]; ok {
			bitmap := bmi.charValuesBitmaps[u]
			result.And(bitmap)
		} else {
			s.L.Error().Str("charValue", cv.Value).Msg("Cannot find charValue in index")
			return 0, ErrUnableToFindCharValue
		}
		for i := 1; i < len(charValues); i++ {
			cv = charValues[i]
			if u, ok := bmi.charIdToIndex[cv.Char]; ok {
				bitmap := bmi.charBitmaps[u]
				result.And(bitmap)
			} else {
				s.L.Error().Str("charId", cv.Char).Msg("Cannot find charId in index")
				return 0, ErrUnableToFindCharId
			}
			if u, ok := bmi.charValueIdToIndex[cv.Value]; ok {
				bitmap := bmi.charValuesBitmaps[u]
				result.And(bitmap)
			} else {
				s.L.Error().Str("charValue", cv.Value).Msg("Cannot find charValue in index")
				return 0, ErrUnableToFindCharValue
			}
		}
	}

	var groupBitmap *roaring.Bitmap
	if u, ok := bmi.groupIdIndex[groupId]; ok {
		groupBitmap = bmi.groupBitmaps[u]
	} else {
		s.L.Error().Str("groupId", groupId).Msg("Cannot find groupId in index")
		return 0, ErrUnableToFindGroupId
	}

	if result == nil {
		result = roaring.And(ob, groupBitmap)
		//cs.L.Info("Result size 1", result.GetCardinality())
	} else {
		result.And(groupBitmap)
		//cs.L.Info("Result size 2", result.GetCardinality())
	}
	//cs.L.Info("Result size 3", result.GetCardinality())
	var specBitmap *roaring.Bitmap
	if u, ok := bmi.specIdToIndex[specId]; ok {
		specBitmap = bmi.specBitmaps[u]
	} else {
		s.L.Error().Str("specId", specId).Msg("Cannot find specId in index")
		return 0, ErrUnableToFindSpecId
	}

	result.And(specBitmap)

	if result.IsEmpty() {
		return 0, nil
	}
	cardinality := result.GetCardinality()
	moreThenOnePriceFound := false
	if cardinality == 1 {
		iterator := result.Iterator()
		if iterator.HasNext() {
			candidate := iterator.Next()
			return candidate, nil
		}
	} else if cardinality > 1 {
		moreThenOnePriceFound = true
	} else {
		return 0, ErrUnableToFindPrice
	}
	result.And(bmi.defaultBitmaps)

	cardinality = result.GetCardinality()
	if cardinality >= 1 {
		//return any default price (iterator provides sorted data, so retries will be idempotent)
		//however this can fail in case of rebuild entire cache with different indexes
		iterator := result.Iterator()
		if iterator.HasNext() {
			candidate := iterator.Next()
			return candidate, nil
		}
	} else if cardinality == 0 {
		if moreThenOnePriceFound {
			return 0, ErrUnableToFindPriceMoreThenOneNoDefault
		}
		return 0, ErrUnableToFindPrice
	}
	return 0, ErrUnableToFindPrice
}

func (s *BitmapIndexService) FindPriceIdByIndex(ind uint32) (string, error) {
	return s.Index.indexToPriceId[ind], nil
}
