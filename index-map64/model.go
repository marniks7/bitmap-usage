package indexmap64

import (
	model64 "bitmap-usage/model64"
)

type MapIndexService struct {
	Index               map[string][]*model64.PriceCondition
	OfferingToCharIndex map[string]map[string]uint16
}

func NewService() *MapIndexService {
	return &MapIndexService{}
}
