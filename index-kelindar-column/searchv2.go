package indexkelindarcolumn

import (
	"bitmap-usage/model"
	"errors"
	"github.com/kelindar/bitmap"
	"github.com/kelindar/column"
	"github.com/rs/zerolog/log"
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
	IndexName  string
	BitmapType BitmapType
	Ind        uint8
}

// FindPriceIndexBy search for price based on parameters and return index
func (h *Holder) FindPriceIndexBy(offeringId, groupId, specId string,
	charValues []model.CharValue) (uint32, error) {

	bitmapOperations := make([]BitmapOperation, 3+len(charValues), 3+len(charValues))
	if h.StatisticOptimizer != nil {
		bitmapOperations[0] = BitmapOperation{BitmapType: Offering, IndexName: FieldNameOffering + offeringId,
			Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameOffering][offeringId],
		}
		for i, cv := range charValues {
			bitmapOperations[1+i] = BitmapOperation{BitmapType: Char,
				IndexName: FieldNameCharStart + cv.Char + "_" + cv.Value,
				Order:     h.StatisticOptimizer.KeyValueStatistic[FieldNameCharStart+strings.ToLower(cv.Char)][cv.Value],
				Ind:       uint8(i)}
		}
		bitmapOperations[1+len(charValues)] = BitmapOperation{BitmapType: Spec, IndexName: FieldNameSpec + specId,
			Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameSpec][specId],
		}
		bitmapOperations[2+len(charValues)] = BitmapOperation{BitmapType: Group, IndexName: FieldNameGroup + groupId,
			Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameGroup][groupId],
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
	} else {
		bitmapOperations[0] = BitmapOperation{BitmapType: Offering, IndexName: FieldNameOffering + offeringId}
		for i, cv := range charValues {
			bitmapOperations[1+i] = BitmapOperation{BitmapType: Char,
				IndexName: FieldNameCharStart + cv.Char + "_" + cv.Value,
				Ind:       uint8(i)}
		}
		bitmapOperations[1+len(charValues)] = BitmapOperation{BitmapType: Spec, IndexName: FieldNameSpec + specId}
		bitmapOperations[2+len(charValues)] = BitmapOperation{BitmapType: Group, IndexName: FieldNameGroup + groupId}
	}

	var priceIndex uint32
	err := h.Collection.Query(func(txn *column.Txn) error {
		boIndexes := make([]string, len(bitmapOperations), len(bitmapOperations))
		for i, bo := range bitmapOperations {
			boIndexes[i] = bo.IndexName
		}

		intersection := txn.With(boIndexes...)
		cardinality := 0
		err := intersection.Range(FieldNameId, func(v column.Cursor) {
			priceIndex = v.Index()
			cardinality++
		})
		if err != nil {
			return err
		}

		if cardinality == 0 {
			return ErrUnableToFindPrice
		}
		if cardinality == 1 {
			return nil
		}
		intersection = intersection.With(FieldNameDefault + "_true")
		//no default row 'true' at all
		cardinality = 0
		err = intersection.Range(FieldNameId, func(v column.Cursor) {
			if cardinality == 0 {
				priceIndex = v.Index()
			}
			cardinality++
		})
		if err != nil {
			return err
		}
		if cardinality >= 1 {
			//return any default price (iterator provides sorted data, so retries will be idempotent)
			//however this can fail in case of rebuild entire cache with different indexes
			return nil
		} else {
			return ErrUnableToFindPriceMoreThenOneNoDefault
		}
	})
	if err != nil {
		return 0, err
	}
	return priceIndex, nil

}

func (s *Holder) findSpecBitmap(specId string) (bitmap.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameSpec].Values[specId]
	if !ok {
		log.Error().Str("specId", specId).Msg("Cannot find specId in index")
		return nil, ErrUnableToFindSpecId
	}
	return *s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) findGroupBitmap(groupId string) (bitmap.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameGroup].Values[groupId]
	if !ok {
		log.Error().Str("groupId", groupId).Msg("Cannot find groupId in index")
		return nil, ErrUnableToFindGroupId
	}
	return *s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) findBitmapByCharValue(cv model.CharValue) (bitmap.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameCharStart+strings.ToLower(cv.Char)]
	if !ok {
		log.Error().Str("charId", cv.Char).Msg("Cannot find charId in index")
		return nil, ErrUnableToFindCharId
	}
	u2, ok := u.Values[cv.Value]
	if !ok {
		log.Error().Str("charValue", cv.Value).Msg("Cannot find charValue in index")
		return nil, ErrUnableToFindCharValue
	}
	return *s.Index.Rows[u2].segments[0].bitmap, nil
}

func (s *Holder) findBitmapByOffering(offeringId string) (bitmap.Bitmap, error) {
	u, ok := s.FieldsMetadata[FieldNameOffering].Values[offeringId]
	if !ok {
		log.Error().Str("offeringId", offeringId).Msg("cannot find offeringId in index")
		return nil, ErrUnableToFindOfferingId
	}
	return *s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) FindPriceIdByIndex(ind uint32) (string, error) {
	return s.IndexToOriginalId[ind], nil
}
