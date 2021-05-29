package model

import "time"

// Price contains information about prices.
// TODO this should NOT contain information regarding the search conditions
type PriceConditions struct {
	ID                 string
	OfferingID         string
	GroupId            string
	Spec               string
	StartDate          time.Time
	EndDate            time.Time
	Markets            []string
	CustomerCategories []string
	Chars              []string //connection by index with chars
	Values             []string //connection by index with chars
	Value              float64
	Currency           string
	IndexId            uint32
	IsDefault          bool
}

type Price struct {
	Id       string  `json:"id"`
	Spec     string  `json:"spec"`
	Value    float64 `json:"value"`
	Currency string  `json:"currency"`
}
