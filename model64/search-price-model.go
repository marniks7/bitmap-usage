package model64

// CharValue - search parameters for characteristics
// Note: used as swallow copy
type CharValue struct {
	Char  string `json:"char"`
	Value string `json:"value"`
}
type FindPriceRequest struct {
	OfferingId  string      `json:"offeringId"`
	GroupId     string      `json:"groupId"`
	PriceSpecId string      `json:"priceSpecId"`
	CharValues  []CharValue `json:"charValues"`
}

type FindPriceRequestBulk struct {
	OfferingId  string      `json:"offeringId"`
	GroupId     string      `json:"groupId"`
	PriceSpecId string      `json:"priceSpecId"`
	CharValues  []CharValue `json:"charValues"`
	Id          uint16      `json:"id"`
}

type ChanFindPriceRequestBulk struct {
	FPRB   *FindPriceRequestBulk
	Result chan FindPriceResponseBulk
	Err    chan error
}

type FindPriceResponseBulk struct {
	Price *Price `json:"price"`
	Id    uint16 `json:"id"`
}

type FindPriceResponseBulkError struct {
	Error error
	Id    uint16 `json:"id"`
}
