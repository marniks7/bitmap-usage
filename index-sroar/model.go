package indexsroar

import (
	"github.com/dgraph-io/sroar"
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
	GroupBitmaps      []*sroar.Bitmap
	SpecBitmaps       []*sroar.Bitmap
	OfferingBitmaps   []*sroar.Bitmap
	DefaultBitmaps    *sroar.Bitmap
	CharBitmaps       []*sroar.Bitmap
	CharValuesBitmaps []*sroar.Bitmap
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
