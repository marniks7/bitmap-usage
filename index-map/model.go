package indexMap

import (
	"bitmap-usage/model"
	"github.com/rs/zerolog"
)

type MapIndexService struct {
	L   zerolog.Logger
	Ind map[string][]*model.PriceCondition
}

func NewService(l zerolog.Logger) *MapIndexService {
	return &MapIndexService{L: l}
}
