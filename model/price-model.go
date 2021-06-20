package model

import (
	"time"
)

// PriceCondition contains information about conditions and price
type PriceCondition struct {
	ID                 string
	OfferingID         string
	GroupId            string
	Spec               string
	StartDate          time.Time
	EndDate            time.Time
	Markets            []string
	CustomerCategories []string
	Chars              []string //connection by index with values
	Values             []string //connection by index with chars
	Value              float64
	Currency           string
	IndexId            uint32
	IsDefault          bool
}

// //go:generate ffjson $GOFILE
// //go:generate codecgen -st json -o price-model_codec.go price-model.go search-price-model.go
type Price struct {
	Id       string  `json:"id"`
	Spec     string  `json:"spec"`
	Value    float64 `json:"value"`
	Currency string  `json:"currency"`
}
