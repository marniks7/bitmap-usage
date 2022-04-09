package indexsroar

import (
	"github.com/dgraph-io/sroar"
)

type BitmapIndexService struct {
	Index *PriceBitmaps
}

func NewService() *BitmapIndexService {
	return &BitmapIndexService{}
}

type PriceBitmaps struct {
	//bitmaps
	GroupBitmaps      []*sroar.Bitmap
	SpecBitmaps       []*sroar.Bitmap
	OfferingBitmaps   []*sroar.Bitmap
	DefaultBitmaps    *sroar.Bitmap
	CharValuesBitmaps []*sroar.Bitmap
	//from bitmaps to original id
	IndexToPriceId []string
	//indexes for other values
	GroupIdIndex      map[string]uint16
	SpecIdToIndex     map[string]uint8
	OfferingIdToIndex map[string]uint32
	//char -> value -> global unique index
	//Term -> 12 -> 100
	//Term -> 24 -> 101
	//Bandwidth -> 100Mbps -> 102
	CharsToValuesIndex map[string]map[string]uint32
}
