package indexmap64

import (
	model64 "bitmap-usage/model64"
	"github.com/rs/zerolog"
)

type MapIndexService struct {
	L                   zerolog.Logger
	Index               map[string][]*model64.PriceCondition
	OfferingToCharIndex map[string]map[string]uint16
}

func NewService(l zerolog.Logger) *MapIndexService {
	return &MapIndexService{L: l}
}
