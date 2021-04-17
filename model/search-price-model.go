package model

type CharValue struct {
	Char  string `json:"char"`
	Value string `json:"value"`
}
type FindPriceRequest struct {
	OfferingId  string      `json:"offeringId"`
	PriceListId string      `json:"priceListId"`
	PriceSpecId string      `json:"priceSpecId"`
	CharValues  []CharValue `json:"charValues"`
}

type FindPriceRequestBulk struct {
	OfferingId  string      `json:"offeringId"`
	PriceListId string      `json:"priceListId"`
	PriceSpecId string      `json:"priceSpecId"`
	CharValues  []CharValue `json:"charValues"`
	Id          uint16      `json:"id"`
}

type ChanFindPriceRequestBulk struct {
	FPRB   *FindPriceRequestBulk
	Result chan FindPriceResponseBulk
}

type FindPriceResponseBulk struct {
	Price *Price `json:"price"`
	Id    uint16 `json:"id"`
}
