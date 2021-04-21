package model

import "github.com/francoispqt/gojay"

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

func (u *FindPriceResponseBulk) MarshalJSONObject(enc *gojay.Encoder) {
	enc.Uint16Key("id", u.Id)
	enc.AddInterfaceKey("price", u.Price)
}

//func (u FindPriceResponseBulk) MarshalJSONObject(enc *gojay.Encoder) {
//	enc.Uint16Key("id", u.Id)
//	enc.AddInterfaceKey("price", u.Price)
//}

func (u *FindPriceResponseBulk) IsNil() bool {
	return u == nil
}

//func (u FindPriceResponseBulk) IsNil() bool {
//	return u.Id == 0
//}

func (u *Price) MarshalJSONObject(enc *gojay.Encoder) {
	enc.StringKey("id", u.Id)
	enc.StringKey("spec", u.Spec)
	enc.StringKey("spec", u.Currency)
	enc.Float64Key("value", u.Value)
}
func (u *Price) IsNil() bool {
	return u == nil
}
