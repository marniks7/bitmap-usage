package indexmap

import (
	"bitmap-usage/model"
)

type MapIndexService struct {
	Index               map[string][]*model.PriceCondition
	OfferingToCharIndex map[string]map[string]uint16
}

func NewService() *MapIndexService {
	return &MapIndexService{}
}
