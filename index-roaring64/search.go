package indexroaring64

import (
	model64 "bitmap-usage/model64"
	"errors"
	"github.com/RoaringBitmap/roaring/roaring64"
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
	charValues []model64.CharValue) (uint64, error) {

	var ob *roaring64.Bitmap
	bmi := s.Index
	if u, ok := bmi.OfferingIdToIndex[offeringId]; ok {
		ob = bmi.OfferingBitmaps[u]
	} else {
		s.L.Error().Str("offeringId", offeringId).Msg("cannot find offeringId in index")
		return 0, ErrUnableToFindOfferingId
	}

	var result *roaring64.Bitmap
	if len(charValues) > 0 {
		cv := charValues[0]
		if u, ok := bmi.CharIdToIndex[cv.Char]; ok {
			bitmap := bmi.CharBitmaps[u]
			result = roaring64.And(ob, bitmap)
		} else {
			s.L.Error().Str("charId", cv.Char).Msg("Cannot find charId in index")
			return 0, ErrUnableToFindCharId
		}
		if u, ok := bmi.CharValueIdToIndex[cv.Value]; ok {
			bitmap := bmi.CharValuesBitmaps[u]
			result.And(bitmap)
		} else {
			s.L.Error().Str("charValue", cv.Value).Msg("Cannot find charValue in index")
			return 0, ErrUnableToFindCharValue
		}
		for i := 1; i < len(charValues); i++ {
			cv = charValues[i]
			if u, ok := bmi.CharIdToIndex[cv.Char]; ok {
				bitmap := bmi.CharBitmaps[u]
				result.And(bitmap)
			} else {
				s.L.Error().Str("charId", cv.Char).Msg("Cannot find charId in index")
				return 0, ErrUnableToFindCharId
			}
			if u, ok := bmi.CharValueIdToIndex[cv.Value]; ok {
				bitmap := bmi.CharValuesBitmaps[u]
				result.And(bitmap)
			} else {
				s.L.Error().Str("charValue", cv.Value).Msg("Cannot find charValue in index")
				return 0, ErrUnableToFindCharValue
			}
		}
	}

	var groupBitmap *roaring64.Bitmap
	if u, ok := bmi.GroupIdIndex[groupId]; ok {
		groupBitmap = bmi.GroupBitmaps[u]
	} else {
		s.L.Error().Str("groupId", groupId).Msg("Cannot find groupId in index")
		return 0, ErrUnableToFindGroupId
	}

	if result == nil {
		result = roaring64.And(ob, groupBitmap)
		//cs.L.Info("Result size 1", result.GetCardinality())
	} else {
		result.And(groupBitmap)
		//cs.L.Info("Result size 2", result.GetCardinality())
	}
	//cs.L.Info("Result size 3", result.GetCardinality())
	var specBitmap *roaring64.Bitmap
	if u, ok := bmi.SpecIdToIndex[specId]; ok {
		specBitmap = bmi.SpecBitmaps[u]
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
	result.And(bmi.DefaultBitmaps)

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

func (s *BitmapIndexService) FindPriceIdByIndex(ind uint64) (string, error) {
	return s.Index.IndexToPriceId[ind], nil
}
