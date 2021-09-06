package indexroaring

import (
	"bitmap-usage/model"
	"github.com/RoaringBitmap/roaring"
	"strings"
)

// FindPriceIndexBy search for price based on parameters and return index
func (h *Holder) FindPriceIndexBy(offeringId, groupId, specId string,
	charValues []model.CharValue) (uint32, error) {

	if h.StatisticOptimizer != nil {
		return h.findPriceByStatisticOptimized(offeringId, groupId, specId, charValues)
	}
	ob, err := h.findBitmapByOffering(offeringId)
	if err != nil {
		return 0, err
	}

	var result *roaring.Bitmap
	for i := 0; i < len(charValues); i++ {
		cv := charValues[i]

		bitmap, err := h.findBitmapByCharValue(cv)
		if err != nil {
			return 0, err
		}
		if i == 0 {
			result = roaring.And(ob, bitmap)
		} else {
			result.And(bitmap)
		}
	}

	groupBitmap, err := h.findGroupBitmap(groupId)
	if err != nil {
		return 0, err
	}
	if result == nil {
		result = roaring.And(ob, groupBitmap)
	} else {
		result.And(groupBitmap)
	}

	specBitmap, err := h.findSpecBitmap(specId)
	if err != nil {
		return 0, err
	}

	result.And(specBitmap)

	if result.IsEmpty() {
		return 0, ErrUnableToFindPrice
	}
	cardinality := result.GetCardinality()
	if cardinality == 1 {
		next := result.Minimum()
		return next, nil
	}

	defaultInd := h.FieldsMetadata[FieldNameDefault].Values["true"]
	defRow := h.Index.Rows[defaultInd]
	//no default row 'true' at all
	if defRow != nil {
		result.And(defRow.segments[0].bitmap)
		cardinality = result.GetCardinality()
	} else {
		cardinality = 0
	}
	if cardinality >= 1 {
		//return any default price (iterator provides sorted data, so retries will be idempotent)
		//however this can fail in case of rebuild entire cache with different indexes
		next := result.Minimum()
		return next, nil
	} else {
		return 0, ErrUnableToFindPriceMoreThenOneNoDefault
	}
}

func (s *Holder) findPriceByStatisticOptimized(offeringId string, groupId string, specId string, charValues []model.CharValue) (uint32, error) {
	bitmapOperations := make([]BitmapOperation, 3+len(charValues), 3+len(charValues))
	bitmapOperations[0] = BitmapOperation{BitmapType: Offering, Order: s.StatisticOptimizer.KeyValueStatistic[FieldNameOffering][offeringId]}
	bitmapOperations[1] = BitmapOperation{BitmapType: Spec, Order: s.StatisticOptimizer.KeyValueStatistic[FieldNameSpec][specId]}
	bitmapOperations[2] = BitmapOperation{BitmapType: Group, Order: s.StatisticOptimizer.KeyValueStatistic[FieldNameGroup][groupId]}

	for i, cv := range charValues {
		bitmapOperations[3+i] = BitmapOperation{BitmapType: Char,
			Order: s.StatisticOptimizer.KeyValueStatistic[FieldNameCharStart+strings.ToLower(cv.Char)][cv.Value],
			Ind:   uint8(i)}
	}

	//simple sort for small dataset and without allocations
	for j := 1; j < len(bitmapOperations); j++ {
		key := bitmapOperations[j]
		i := j - 1
		for i >= 0 && bitmapOperations[i].Order > key.Order {
			bitmapOperations[i+1] = bitmapOperations[i]
			i--
		}
		bitmapOperations[i+1] = key
	}

	var result *roaring.Bitmap = nil
	for i, bo := range bitmapOperations {
		var bitmap *roaring.Bitmap
		var err error
		if bo.BitmapType == Offering {
			bitmap, err = s.findBitmapByOffering(offeringId)
		} else if bo.BitmapType == Spec {
			bitmap, err = s.findSpecBitmap(specId)
		} else if bo.BitmapType == Group {
			bitmap, err = s.findGroupBitmap(groupId)
		} else if bo.BitmapType == Char {
			bitmap, err = s.findBitmapByCharValue(charValues[bo.Ind])
		} else {
			panic("Unknown bitmaptype")
		}
		if err != nil {
			return 0, err
		}
		if i == 0 {
			//first - just save current bitmap
			result = bitmap
		} else if i == 1 {
			//second - execute 'And' (creates new bitmap)
			result = roaring.And(result, bitmap)
		} else {
			//third+ - execute 'And' on existing bitmap
			result.And(bitmap)
		}
	}
	if result.IsEmpty() {
		return 0, ErrUnableToFindPrice
	}
	cardinality := result.GetCardinality()
	if cardinality == 1 {
		next := result.Minimum()
		return next, nil
	}

	defaultInd := s.FieldsMetadata[FieldNameDefault].Values["true"]
	defRow := s.Index.Rows[defaultInd]
	//no default row 'true' at all
	if defRow != nil {
		result.And(defRow.segments[0].bitmap)
		cardinality = result.GetCardinality()
	} else {
		cardinality = 0
	}

	if cardinality >= 1 {
		//return any default price (iterator provides sorted data, so retries will be idempotent)
		//however this can fail in case of rebuild entire cache with different indexes
		next := result.Minimum()
		return next, nil
	} else {
		return 0, ErrUnableToFindPriceMoreThenOneNoDefault
	}
}

func (s *Holder) findSpecBitmap(specId string) (*roaring.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameSpec].Values[specId]
	if !ok {
		s.L.Error().Str("specId", specId).Msg("Cannot find specId in index")
		return nil, ErrUnableToFindSpecId
	}
	return s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) findGroupBitmap(groupId string) (*roaring.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameGroup].Values[groupId]
	if !ok {
		s.L.Error().Str("groupId", groupId).Msg("Cannot find groupId in index")
		return nil, ErrUnableToFindGroupId
	}
	return s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) findBitmapByCharValue(cv model.CharValue) (*roaring.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameCharStart+strings.ToLower(cv.Char)]
	if !ok {
		s.L.Error().Str("charId", cv.Char).Msg("Cannot find charId in index")
		return nil, ErrUnableToFindCharId
	}
	u2, ok := u.Values[cv.Value]
	if !ok {
		s.L.Error().Str("charValue", cv.Value).Msg("Cannot find charValue in index")
		return nil, ErrUnableToFindCharValue
	}
	return s.Index.Rows[u2].segments[0].bitmap, nil
}

func (s *Holder) findBitmapByOffering(offeringId string) (*roaring.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameOffering].Values[offeringId]
	if !ok {
		s.L.Error().Str("offeringId", offeringId).Msg("cannot find offeringId in index")
		return nil, ErrUnableToFindOfferingId
	}
	return s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) FindPriceIdByIndex(ind uint32) (string, error) {
	return s.IndexToOriginalId[ind], nil
}
