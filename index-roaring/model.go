package index_roaring

import (
	"github.com/RoaringBitmap/roaring"
	"github.com/rs/zerolog"
)

type BitMapIndexService struct {
	L     zerolog.Logger
	Index *PriceBitmaps
}

func NewService(l zerolog.Logger) *BitMapIndexService {
	return &BitMapIndexService{L: l}
}

type PriceBitmaps struct {
	//bitmaps
	groupBitmaps      []*roaring.Bitmap
	specBitmaps       []*roaring.Bitmap
	offeringBitmaps   []*roaring.Bitmap
	defaultBitmaps    *roaring.Bitmap
	charBitmaps       []*roaring.Bitmap
	charValuesBitmaps []*roaring.Bitmap
	//from bitmaps to original id
	indexToPriceId []string
	//indexes for other values
	groupIdIndex       map[string]uint16
	specIdToIndex      map[string]uint8
	offeringIdToIndex  map[string]uint32
	charIdToIndex      map[string]uint32
	charValueIdToIndex map[string]uint32
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
