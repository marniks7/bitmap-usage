package indexkelindarcolumn

import (
	"bitmap-usage/model"
	"errors"
	"github.com/kelindar/bitmap"
	"github.com/kelindar/column"
	"strings"
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
func (h *Holder) FindPriceIndexBy(offeringId, groupId, specId string,
	charValues []model.CharValue) (uint32, error) {

	//bitmapOperations := make([]BitmapOperation, 3+len(charValues), 3+len(charValues))
	//if h.StatisticOptimizer != nil {
	//	bitmapOperations[0] = BitmapOperation{BitmapType: Offering, Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameOffering][offeringId]}
	//	for i, cv := range charValues {
	//		bitmapOperations[1+i] = BitmapOperation{BitmapType: Char,
	//			Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameCharStart+strings.ToLower(cv.Char)][cv.Value],
	//			Ind:   uint8(i)}
	//	}
	//	bitmapOperations[1+len(charValues)] = BitmapOperation{BitmapType: Spec, Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameSpec][specId]}
	//	bitmapOperations[2+len(charValues)] = BitmapOperation{BitmapType: Group, Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameGroup][groupId]}
	//
	//	//simple sort for small dataset and without allocations
	//	for j := 1; j < len(bitmapOperations); j++ {
	//		key := bitmapOperations[j]
	//		i := j - 1
	//		for i >= 0 && bitmapOperations[i].Order > key.Order {
	//			bitmapOperations[i+1] = bitmapOperations[i]
	//			i--
	//		}
	//		bitmapOperations[i+1] = key
	//	}
	//} else {
	//	bitmapOperations[0] = BitmapOperation{BitmapType: Offering}
	//	for i := 0; i < len(charValues); i++ {
	//		bitmapOperations[1+i] = BitmapOperation{BitmapType: Char, Ind: uint8(i)}
	//	}
	//	bitmapOperations[1+len(charValues)] = BitmapOperation{BitmapType: Spec}
	//	bitmapOperations[2+len(charValues)] = BitmapOperation{BitmapType: Group}
	//}

	var priceIndex uint32
	err := h.Collection.Query(func(txn *column.Txn) error {
		union := txn.With(FieldNameOffering + offeringId)
		for i := 0; i < len(charValues); i++ {
			union = union.With(FieldNameCharStart + charValues[i].Char + "_" + charValues[i].Value)
		}
		union.With(FieldNameGroup + groupId).With(FieldNameSpec + specId)
		cardinality := union.Count()
		if cardinality == 0 {
			return ErrUnableToFindPrice
		}
		if cardinality == 1 {
			err := union.Range(FieldNameId, func(v column.Cursor) {
				priceIndex = v.Index()
			})
			return err
		}
		union = union.With(FieldNameDefault + "_true")
		//no default row 'true' at all
		cardinality = union.Count()
		if cardinality >= 1 {
			//return any default price (iterator provides sorted data, so retries will be idempotent)
			//however this can fail in case of rebuild entire cache with different indexes
			var t bool
			err := union.Range(FieldNameId, func(v column.Cursor) {
				if !t {
					priceIndex = v.Index()
					t = true
				}
			})
			return err
		} else {
			return ErrUnableToFindPriceMoreThenOneNoDefault
		}
	})
	if err != nil {
		return 0, err
	}
	return uint32(priceIndex), nil

}

func (s *Holder) findSpecBitmap(specId string) (bitmap.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameSpec].Values[specId]
	if !ok {
		s.L.Error().Str("specId", specId).Msg("Cannot find specId in index")
		return nil, ErrUnableToFindSpecId
	}
	return *s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) findGroupBitmap(groupId string) (bitmap.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameGroup].Values[groupId]
	if !ok {
		s.L.Error().Str("groupId", groupId).Msg("Cannot find groupId in index")
		return nil, ErrUnableToFindGroupId
	}
	return *s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) findBitmapByCharValue(cv model.CharValue) (bitmap.Bitmap, error) {
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
	return *s.Index.Rows[u2].segments[0].bitmap, nil
}

func (s *Holder) findBitmapByOffering(offeringId string) (bitmap.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameOffering].Values[offeringId]
	if !ok {
		s.L.Error().Str("offeringId", offeringId).Msg("cannot find offeringId in index")
		return nil, ErrUnableToFindOfferingId
	}
	return *s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) FindPriceIdByIndex(ind uint32) (string, error) {
	return s.IndexToOriginalId[ind], nil
}
