package indexroaring

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

type BitmapType uint8

const (
	Offering BitmapType = iota + 1 // Offering = 1
	Spec                           // Spec = 2
	Group                          // Group = 3
	Char                           // Char = 4
)

type BitmapOperation struct {
	Order      uint64
	BitmapType BitmapType
	Ind        uint8
}

// FindPriceIndexBy search for price based on parameters and return index
func (s *BitmapIndexService) FindPriceIndexBy(offeringId, groupId, specId string,
	charValues []model.CharValue) (uint32, error) {

	if s.Index.StatisticOptimizer != nil {
		return s.findPriceByStatisticOptimized(offeringId, groupId, specId, charValues)
	}
	ob, err := s.findBitmapByOffering(offeringId)
	if err != nil {
		return 0, err
	}

	var result *roaring.Bitmap
	for i := 0; i < len(charValues); i++ {
		cv := charValues[i]

		bitmap, err := s.findBitmapByCharValue(cv)
		if err != nil {
			return 0, err
		}
		if i == 0 {
			result = roaring.And(ob, bitmap)
		} else {
			result.And(bitmap)
		}
	}

	groupBitmap, err := s.findGroupBitmap(groupId)
	if err != nil {
		return 0, err
	}
	if result == nil {
		result = roaring.And(ob, groupBitmap)
	} else {
		result.And(groupBitmap)
	}

	specBitmap, err := s.findSpecBitmap(specId)
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

	//there are >1 price, search for default prices among them
	result.And(s.Index.DefaultBitmaps)

	cardinality = result.GetCardinality()
	if cardinality >= 1 {
		//return any default price (iterator provides sorted data, so retries will be idempotent)
		//however this can fail in case of rebuild entire cache with different indexes
		next := result.Minimum()
		return next, nil
	} else {
		return 0, ErrUnableToFindPriceMoreThenOneNoDefault
	}
}

func (s *BitmapIndexService) findPriceByStatisticOptimized(offeringId string, groupId string, specId string, charValues []model.CharValue) (uint32, error) {
	bitmapOperations := make([]BitmapOperation, 3+len(charValues), 3+len(charValues))
	bitmapOperations[0] = BitmapOperation{BitmapType: Offering, Order: s.Index.StatisticOptimizer.OfferingStatistic[offeringId]}
	bitmapOperations[1] = BitmapOperation{BitmapType: Spec, Order: s.Index.StatisticOptimizer.SpecStatistic[specId]}
	bitmapOperations[2] = BitmapOperation{BitmapType: Group, Order: s.Index.StatisticOptimizer.GroupStatistic[groupId]}

	for i, cv := range charValues {
		bitmapOperations[3+i] = BitmapOperation{BitmapType: Char,
			Order: s.Index.StatisticOptimizer.CharValueStatistic[cv.Char][cv.Value],
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

	result.And(s.Index.DefaultBitmaps)

	cardinality = result.GetCardinality()
	if cardinality >= 1 {
		//return any default price (iterator provides sorted data, so retries will be idempotent)
		//however this can fail in case of rebuild entire cache with different indexes
		next := result.Minimum()
		return next, nil
	} else {
		return 0, ErrUnableToFindPriceMoreThenOneNoDefault
	}
}

func (s *BitmapIndexService) findSpecBitmap(specId string) (*roaring.Bitmap, error) {
	u, ok := s.Index.SpecIdToIndex[specId]
	if !ok {
		s.L.Error().Str("specId", specId).Msg("Cannot find specId in index")
		return nil, ErrUnableToFindSpecId
	}
	return s.Index.SpecBitmaps[u], nil
}

func (s *BitmapIndexService) findGroupBitmap(groupId string) (*roaring.Bitmap, error) {
	u, ok := s.Index.GroupIdIndex[groupId]
	if !ok {
		s.L.Error().Str("groupId", groupId).Msg("Cannot find groupId in index")
		return nil, ErrUnableToFindGroupId
	}
	return s.Index.GroupBitmaps[u], nil
}

func (s *BitmapIndexService) findBitmapByCharValue(cv model.CharValue) (*roaring.Bitmap, error) {
	u, ok := s.Index.CharsToValuesIndex[cv.Char]
	if !ok {
		s.L.Error().Str("charId", cv.Char).Msg("Cannot find charId in index")
		return nil, ErrUnableToFindCharId
	}
	u2, ok := u[cv.Value]
	if !ok {
		s.L.Error().Str("charValue", cv.Value).Msg("Cannot find charValue in index")
		return nil, ErrUnableToFindCharValue
	}
	return s.Index.CharValuesBitmaps[u2], nil
}

func (s *BitmapIndexService) findBitmapByOffering(offeringId string) (*roaring.Bitmap, error) {
	u, ok := s.Index.OfferingIdToIndex[offeringId]
	if !ok {
		s.L.Error().Str("offeringId", offeringId).Msg("cannot find offeringId in index")
		return nil, ErrUnableToFindOfferingId
	}
	return s.Index.OfferingBitmaps[u], nil
}

// FindPriceIndexByWithTraceInfo search for price based on parameters and return index, includes
// tracing info
func (s *BitmapIndexService) FindPriceIndexByWithTraceInfo(offeringId, groupId, specId string,
	charValues []model.CharValue) (uint32, error, *BitmapSearchStatistic) {

	bss := &BitmapSearchStatistic{Stats: make([]SingleBitmapSearchStats, 0, 3+len(charValues))}
	if s.Index.StatisticOptimizer != nil {
		panic("Not Implemented option with statis optimizer and trace info")
	}
	//do not modify it
	originalBitmap, err := s.findBitmapByOffering(offeringId)
	if err != nil {
		return 0, err, bss
	}
	order := 1
	bss.Stats = append(bss.Stats, buildSingleSearchStatByStringId(originalBitmap, order, s.Index.OfferingIdToIndex[offeringId],
		nil, "Offering", offeringId))

	var result *roaring.Bitmap
	for i := 0; i < len(charValues); i++ {
		cv := charValues[i]

		bitmap, err := s.findBitmapByCharValue(cv)
		if err != nil {
			return 0, err, bss
		}
		if i == 0 {
			result = roaring.And(originalBitmap, bitmap)
		} else {
			result.And(bitmap)
		}

		order++
		bss.Stats = append(bss.Stats, buildSingleSearchStatByCharValue(bitmap, order, s.Index.CharsToValuesIndex[cv.Char][cv.Value],
			result, "CharValue", cv))
	}

	groupBitmap, err := s.findGroupBitmap(groupId)
	if err != nil {
		return 0, err, bss
	}
	if result == nil {
		result = roaring.And(originalBitmap, groupBitmap)
	} else {
		result.And(groupBitmap)
	}
	order++
	bss.Stats = append(bss.Stats, buildSingleSearchStatByStringId(groupBitmap, order, uint32(s.Index.GroupIdIndex[groupId]),
		result, "Group", groupId))

	specBitmap, err := s.findSpecBitmap(specId)
	if err != nil {
		return 0, err, bss
	}

	result.And(specBitmap)

	order++
	bss.Stats = append(bss.Stats, buildSingleSearchStatByStringId(specBitmap, order, uint32(s.Index.SpecIdToIndex[specId]),
		result, "Spec", specId))

	if result.IsEmpty() {
		return 0, nil, bss
	}
	cardinality := result.GetCardinality()
	moreThenOnePriceFound := false
	if cardinality == 1 {
		next := result.Minimum()
		return next, nil, bss
	} else if cardinality > 1 {
		moreThenOnePriceFound = true
	} else {
		return 0, ErrUnableToFindPrice, bss
	}

	result.And(s.Index.DefaultBitmaps)

	order++
	bss.Stats = append(bss.Stats, buildSingleSearchStatByStringId(specBitmap, order, 0,
		result, "Default", ""))

	cardinality = result.GetCardinality()
	if cardinality >= 1 {
		//return any default price (iterator provides sorted data, so retries will be idempotent)
		//however this can fail in case of rebuild entire cache with different indexes
		next := result.Minimum()
		return next, nil, bss
	} else if cardinality == 0 {
		if moreThenOnePriceFound {
			return 0, ErrUnableToFindPriceMoreThenOneNoDefault, bss
		}
		return 0, ErrUnableToFindPrice, bss
	}
	return 0, ErrUnableToFindPrice, bss
}

func buildSingleSearchStatByCharValue(bitmap *roaring.Bitmap, order int, u2 uint32,
	result *roaring.Bitmap,
	name string,
	cv model.CharValue) SingleBitmapSearchStats {
	var cardinality uint64
	if result != nil {
		cardinality = result.GetCardinality()
	} else {
		cardinality = bitmap.GetCardinality()
	}
	return SingleBitmapSearchStats{Cardinality: cardinality, Order: order,
		BitmapName: name, Value: cv.Char + " " + cv.Value, BitmapIndex: &u2,
		OriginalCardinality: bitmap.GetCardinality()}
}

func buildSingleSearchStatByStringId(bitmap *roaring.Bitmap, order int, bitmapIndex uint32, result *roaring.Bitmap,
	name string, id string) SingleBitmapSearchStats {
	var cardinality uint64
	if result != nil {
		cardinality = result.GetCardinality()
	} else {
		cardinality = bitmap.GetCardinality()
	}
	return SingleBitmapSearchStats{Cardinality: cardinality, Order: order,
		BitmapName: name, Value: id,
		BitmapIndex:         &bitmapIndex,
		OriginalCardinality: bitmap.GetCardinality()}
}

func (s *BitmapIndexService) FindPriceIdByIndex(ind uint32) (string, error) {
	return s.Index.IndexToPriceId[ind], nil
}
