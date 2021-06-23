package indexroaring64

import (
	"github.com/RoaringBitmap/roaring/roaring64"
	"github.com/rs/zerolog"
)

type BitmapIndexService struct {
	L     zerolog.Logger
	Index *PriceBitmaps
}

func NewService(l zerolog.Logger) *BitmapIndexService {
	return &BitmapIndexService{L: l}
}

type PriceBitmaps struct {
	//bitmaps
	GroupBitmaps      []*roaring64.Bitmap
	SpecBitmaps       []*roaring64.Bitmap
	OfferingBitmaps   []*roaring64.Bitmap
	DefaultBitmaps    *roaring64.Bitmap
	CharBitmaps       []*roaring64.Bitmap
	CharValuesBitmaps []*roaring64.Bitmap
	//from bitmaps to original id
	IndexToPriceId []string
	//indexes for other values
	GroupIdIndex       map[string]uint16
	SpecIdToIndex      map[string]uint8
	OfferingIdToIndex  map[string]uint32
	CharIdToIndex      map[string]uint32
	CharValueIdToIndex map[string]uint32
}
type GlobalIndex struct {
	//indexes
	groupIdIndex       map[string]uint16
	specIdToIndex      map[string]uint8
	offeringIdToIndex  map[string]uint32
	charIdToIndex      map[string]uint32
	charValueIdToIndex map[string]uint32

	//from bitmaps to original id
	indexToPriceId []string
}
