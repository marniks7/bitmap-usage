package indexbitsblooms

import (
	"bitmap-usage/model"
	"errors"
	"github.com/bits-and-blooms/bitset"
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
	BitmapType BitmapType
	Ind        uint8
}

// FindPriceIndexBy search for price based on parameters and return index
func (h *Holder) FindPriceIndexBy(offeringId, groupId, specId string,
	charValues []model.CharValue) (uint32, error) {

	bitmapOperations := make([]BitmapOperation, 3+len(charValues), 3+len(charValues))
	if h.StatisticOptimizer != nil {
		bitmapOperations[0] = BitmapOperation{BitmapType: Offering, Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameOffering][offeringId]}
		for i, cv := range charValues {
			bitmapOperations[1+i] = BitmapOperation{BitmapType: Char,
				Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameCharStart+strings.ToLower(cv.Char)][cv.Value],
				Ind:   uint8(i)}
		}
		bitmapOperations[1+len(charValues)] = BitmapOperation{BitmapType: Spec, Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameSpec][specId]}
		bitmapOperations[2+len(charValues)] = BitmapOperation{BitmapType: Group, Order: h.StatisticOptimizer.KeyValueStatistic[FieldNameGroup][groupId]}

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
		bitmapOperations[0] = BitmapOperation{BitmapType: Offering}
		for i := 0; i < len(charValues); i++ {
			bitmapOperations[1+i] = BitmapOperation{BitmapType: Char, Ind: uint8(i)}
		}
		bitmapOperations[1+len(charValues)] = BitmapOperation{BitmapType: Spec}
		bitmapOperations[2+len(charValues)] = BitmapOperation{BitmapType: Group}
	}

	//TODO test concurrency
	tx := h.bitmapPool.Get().(*Tx)
	//h.empty.Copy(tx.index) //clear index
	defer h.release(tx)
	for i, bo := range bitmapOperations {
		var bm *bitset.BitSet
		var err error
		if bo.BitmapType == Offering {
			bm, err = h.findBitmapByOffering(offeringId)
		} else if bo.BitmapType == Spec {
			bm, err = h.findSpecBitmap(specId)
		} else if bo.BitmapType == Group {
			bm, err = h.findGroupBitmap(groupId)
		} else if bo.BitmapType == Char {
			bm, err = h.findBitmapByCharValue(charValues[bo.Ind])
		} else {
			panic("Unknown bitmaptype")
		}
		if err != nil {
			return 0, err
		}
		if i == 0 {
			//first - bitmapPool
			bm.Copy(tx.index)
		} else {
			//second - execute 'And'
			tx.index.InPlaceIntersection(bm)
		}
	}
	cardinality := tx.index.Count()
	if cardinality == 0 {
		return 0, ErrUnableToFindPrice
	}
	if cardinality == 1 {
		next, _ := tx.index.NextSet(0)
		return uint32(next), nil
	}

	defaultInd := h.FieldsMetadata[FieldNameDefault].Values["true"]
	defRow := h.Index.Rows[defaultInd]
	//no default row 'true' at all
	if defRow != nil {
		tx.index.InPlaceIntersection(defRow.segments[0].bitmap)
		cardinality = tx.index.Count()
	} else {
		cardinality = 0
	}
	if cardinality >= 1 {
		//return any default price (iterator provides sorted data, so retries will be idempotent)
		//however this can fail in case of rebuild entire cache with different indexes
		//TODO check
		var i uint = 0
		for i = 0; i < tx.index.Len(); i++ {
			if tx.index.Test(i) {
				return uint32(i), nil
			}
		}
		//next, _ := tx.index.Min()
		return 0, ErrUnableToFindPrice
		//return next, nil
	} else {
		return 0, ErrUnableToFindPriceMoreThenOneNoDefault
	}
}

func (h *Holder) release(tx *Tx) {
	h.bitmapPool.Put(tx)
}

func (s *Holder) findSpecBitmap(specId string) (*bitset.BitSet, error) {
	u, ok := s.FieldsMetadata[FieldNameSpec].Values[specId]
	if !ok {
		log.Error().Str("specId", specId).Msg("Cannot find specId in index")
		return nil, ErrUnableToFindSpecId
	}
	return s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) findGroupBitmap(groupId string) (*bitset.BitSet, error) {
	u, ok := s.FieldsMetadata[FieldNameGroup].Values[groupId]
	if !ok {
		log.Error().Str("groupId", groupId).Msg("Cannot find groupId in index")
		return nil, ErrUnableToFindGroupId
	}
	return s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) findBitmapByCharValue(cv model.CharValue) (*bitset.BitSet, error) {
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
	return s.Index.Rows[u2].segments[0].bitmap, nil
}

func (s *Holder) findBitmapByOffering(offeringId string) (*bitset.BitSet, error) {
	u, ok := s.FieldsMetadata[FieldNameOffering].Values[offeringId]
	if !ok {
		log.Error().Str("offeringId", offeringId).Msg("cannot find offeringId in index")
		return nil, ErrUnableToFindOfferingId
	}
	return s.Index.Rows[u].segments[0].bitmap, nil
}

func (s *Holder) FindPriceIdByIndex(ind uint32) (string, error) {
	return s.IndexToOriginalId[ind], nil
}
