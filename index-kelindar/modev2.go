package indexkelindar

import (
	"errors"
	"github.com/kelindar/bitmap"
	"github.com/rs/zerolog"
	"sync"
)

type Mapping interface {
	Add(name []byte, value []byte) (uint32, error)
	Get(name []byte, value []byte) (uint32, error)
}

type MappingStorage struct {
	rw            sync.RWMutex
	lastUsedIndex uint32
	storage       map[string]map[string]uint32
}

func (bis *MappingStorage) Add(name []byte, value []byte) (uint32, error) {
	bis.rw.Lock()
	defer bis.rw.Unlock()

	bis.lastUsedIndex++
	_, ok := bis.storage[string(name)][string(value)]
	if !ok {
		return 0, errors.New("mapping already exists")
	}
	return bis.lastUsedIndex, nil
}

func (bis *MappingStorage) Get(name []byte, value []byte) (uint32, error) {
	u, ok := bis.storage[string(name)][string(value)]
	if !ok {
		return 0, errors.New("unable to find bitmap index")
	}
	return u, nil
}

type StringFieldMetadata struct {
	// Name of the field, like Term
	Name string
	// Value unique value for this FieldMetadata, like 12, 24 or 36...
	Value string
	// Type of the field, can be `date`, `string` or `int`
	Type string
	// BitmapIndex is id of bitmap. Used to find bitmap
	BitmapIndex int
}

type QueryRequest struct {
	StringRequests         []StringRequest
	StringMultipleRequests []StringMultipleRequest
	IntRequests            []IntRequest
	IntMultipleRequests    []IntMultipleRequest
}

type StringRequest struct {
	Name string
	// Op is equals \ between \ not in \ in \ not equals
	Op string
	// Value
	Value string
}

type IntRequest struct {
	Name string
	// Op is equals \ between \ not in \ in \ not equals
	Op string
	// Value
	Value int
}

type StringMultipleRequest struct {
	Name string
	// Op is equals \ between \ not in \ in \ not equals
	Op string
	// Value
	Values []string
}

type IntMultipleRequest struct {
	Name string
	// Op is equals \ between \ not in \ in \ not equals
	Op string
	// Value
	Values []int
}

//put
//get
//Term - 0 -> 10

type Uint8Metadata struct {
	// Name of the field, like `Cable Length`
	Name string
	// Value unique value for this FieldMetadata, like 100
	Value uint8
	// Type of the field, can be `date`, `string` or `int`
	Type string
	// BitmapIndex is id of bitmap. Used to find bitmap
	BitmapIndex int
}

type DateMetadata struct {
	// Name of the field, like Available
	Name string
	// Value unique value for this FieldMetadata, like year - 2017, 2018, 2019...
	Value string
	// Type of the field, can be `date`, `string` or `int`
	Type string
	// BitmapIndex is id of bitmap. Used to find bitmap
	BitmapIndex int
}

type FieldInt interface {
	AddValue(fm *FieldMetadata, value string) error
}

// Holder - top struct to carry whatever required
type Holder struct {
	// Index is central bitmap storage
	Index *Index
	// IndexToOriginalId mapping index to original id. TODO use persistence key-value storage for this
	IndexToOriginalId []string
	// FieldMetadata contains fast-accessible info about fields and related bitmap(s)
	FieldsMetadata map[string]*FieldMetadata
	// L is logger
	L zerolog.Logger
	// StatisticOptimizer small analog of Database statistics
	StatisticOptimizer *BitmapOptimizerStatisticV2
}

// FieldMetadata contains information about all bitmaps related to one field
// It can contain >=1 bitmap(s).
//
// This metadata includes original mapping of the value to row (bitmap) index
//
// Example:
// Name: Term
// Values: 12 -> 0, 24 -> 1, 36 -> 5, 48 -> 3
type FieldMetadata struct {
	Name   string
	Values map[string]uint32
}

// Index is central bitmap storage, contains info about rows (bitmaps)
type Index struct {
	// Rows is rowId to Row storage
	Rows map[uint32]*Row
	// rw mutex
	rw sync.RWMutex
	// lastUsedIndex is last used index
	lastUsedIndex uint32
}

func (bis *Index) NextBitmapIndex() (uint32, error) {
	bis.rw.Lock()
	defer bis.rw.Unlock()

	bis.lastUsedIndex++
	return bis.lastUsedIndex, nil
}

// Row is bitmap splitted by segments
type Row struct {
	segments []*RowSegment
}

// RowSegment is bitmap containing information from one shard
type RowSegment struct {
	shard  uint32
	start  uint64
	end    uint64
	bitmap *bitmap.Bitmap
}

func NewHolder(l zerolog.Logger) *Holder {
	return &Holder{L: l}
}
