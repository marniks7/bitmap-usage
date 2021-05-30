package indexMap

import (
	"bitmap-usage/model"
	"github.com/rs/zerolog"
)

type MapIndexService struct {
	L                   zerolog.Logger
	Index               map[string][]*model.PriceCondition
	OfferingToCharIndex map[string]map[string]uint16
}

func NewService(l zerolog.Logger) *MapIndexService {
	return &MapIndexService{L: l}
}
