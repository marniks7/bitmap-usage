package indexroaring64

import (
	"github.com/RoaringBitmap/roaring/roaring64"
)

type BitmapIndexService struct {
	Index *PriceBitmaps
}

func NewService() *BitmapIndexService {
	return &BitmapIndexService{}
}

type PriceBitmaps struct {
	//bitmaps
	GroupBitmaps      []*roaring64.Bitmap
	SpecBitmaps       []*roaring64.Bitmap
	OfferingBitmaps   []*roaring64.Bitmap
	DefaultBitmaps    *roaring64.Bitmap
	CharValuesBitmaps []*roaring64.Bitmap
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
