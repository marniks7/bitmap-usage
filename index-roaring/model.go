package indexroaring

import (
	"github.com/RoaringBitmap/roaring"
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
	GroupBitmaps      []*roaring.Bitmap
	SpecBitmaps       []*roaring.Bitmap
	OfferingBitmaps   []*roaring.Bitmap
	DefaultBitmaps    *roaring.Bitmap
	CharValuesBitmaps []*roaring.Bitmap
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

	// StatisticOptimizer small analog of Database statistics
	StatisticOptimizer *BitmapOptimizerStatistic
}

type GroupBitmapsStatistics struct {
	Name             string
	Cnt              int
	SizeHR           string
	Size             uint64
	SerializedSizeHR string
	SerializedSize   uint64
	Stats            []*BitmapStatistics
}

type BitmapStatistics struct {
	Name             string
	Cnt              int
	SizeHR           string
	Size             uint64
	SerializedSizeHR string
	SerializedSize   uint64
	Stats            []roaring.Statistics
}

type BitmapSearchStatistic struct {
	//ordered list of bitmap searches
	Stats []SingleBitmapSearchStats
}

type SingleBitmapSearchStats struct {
	//cardinality after operation
	Cardinality uint64
	//cardinality of original bitmap itself
	OriginalCardinality uint64
	//value applied
	Value string
	//bitmap name
	BitmapName string
	//index of bitmap in bitmaps array
	//0 if single bitmap in cache used
	BitmapIndex *uint32
	//order
	Order int
}
