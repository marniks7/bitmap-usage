package indexsroar

import (
	model64 "bitmap-usage/model64"
	"errors"
	"github.com/dgraph-io/sroar"
	"github.com/rs/zerolog/log"
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
	charValues []model64.CharValue) (uint64, error) {

	bitmapOperations := make([]BitmapOperation, 3+len(charValues), 3+len(charValues))
	bitmapOperations[0] = BitmapOperation{BitmapType: Offering, Order: 0}
	for i := 0; i < len(charValues); i++ {
		bitmapOperations[1+i] = BitmapOperation{BitmapType: Char,
			Order: 0,
			Ind:   uint8(i)}
	}
	bitmapOperations[1+len(charValues)] = BitmapOperation{BitmapType: Spec, Order: 0}
	bitmapOperations[2+len(charValues)] = BitmapOperation{BitmapType: Group, Order: 0}

	var result *sroar.Bitmap = nil
	for i, bo := range bitmapOperations {
		var bitmap *sroar.Bitmap
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
			result = sroar.And(result, bitmap)
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

func (s *BitmapIndexService) FindPriceIdByIndex(ind uint64) (string, error) {
	return s.Index.IndexToPriceId[ind], nil
}

func (s *BitmapIndexService) findSpecBitmap(specId string) (*sroar.Bitmap, error) {
	u, ok := s.Index.SpecIdToIndex[specId]
	if !ok {
		log.Error().Str("specId", specId).Msg("Cannot find specId in index")
		return nil, ErrUnableToFindSpecId
	}
	return s.Index.SpecBitmaps[u], nil
}

func (s *BitmapIndexService) findGroupBitmap(groupId string) (*sroar.Bitmap, error) {
	u, ok := s.Index.GroupIdIndex[groupId]
	if !ok {
		log.Error().Str("groupId", groupId).Msg("Cannot find groupId in index")
		return nil, ErrUnableToFindGroupId
	}
	return s.Index.GroupBitmaps[u], nil
}

func (s *BitmapIndexService) findBitmapByCharValue(cv model64.CharValue) (*sroar.Bitmap, error) {
	u, ok := s.Index.CharsToValuesIndex[cv.Char]
	if !ok {
		log.Error().Str("charId", cv.Char).Msg("Cannot find charId in index")
		return nil, ErrUnableToFindCharId
	}
	u2, ok := u[cv.Value]
	if !ok {
		log.Error().Str("charValue", cv.Value).Msg("Cannot find charValue in index")
		return nil, ErrUnableToFindCharValue
	}
	return s.Index.CharValuesBitmaps[u2], nil
}

func (s *BitmapIndexService) findBitmapByOffering(offeringId string) (*sroar.Bitmap, error) {
	u, ok := s.Index.OfferingIdToIndex[offeringId]
	if !ok {
		log.Error().Str("offeringId", offeringId).Msg("cannot find offeringId in index")
		return nil, ErrUnableToFindOfferingId
	}
	return s.Index.OfferingBitmaps[u], nil
}
