//go:build go1.6
// +build go1.6

// Code generated by codecgen - DO NOT EDIT.

package model64

import (
	"errors"
	codec1978 "github.com/ugorji/go/codec"
	"runtime"
	"strconv"
)

const (
	// ----- content types ----
	codecSelferCcUTF8437 = 1
	codecSelferCcRAW437  = 255
	// ----- value types used ----
	codecSelferValueTypeArray437     = 10
	codecSelferValueTypeMap437       = 9
	codecSelferValueTypeString437    = 6
	codecSelferValueTypeInt437       = 2
	codecSelferValueTypeUint437      = 3
	codecSelferValueTypeFloat437     = 4
	codecSelferValueTypeNil437       = 1
	codecSelferBitsize437            = uint8(32 << (^uint(0) >> 63))
	codecSelferDecContainerLenNil437 = -2147483648
)

var (
	errCodecSelferOnlyMapOrArrayEncodeToStruct437 = errors.New(`only encoded map or array can be decoded into a struct`)
)

type codecSelfer437 struct{}

func codecSelfer437False() bool { return false }
func codecSelfer437True() bool  { return true }

func init() {
	if codec1978.GenVersion != 25 {
		_, file, _, _ := runtime.Caller(0)
		ver := strconv.FormatInt(int64(codec1978.GenVersion), 10)
		panic(errors.New("codecgen version mismatch: current: 25, need " + ver + ". Re-generate file: " + file))
	}
}

func (Price) codecSelferViaCodecgen() {}
func (x *Price) CodecEncodeSelf(e *codec1978.Encoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Encoder(e)
	_, _, _ = h, z, r
	if z.EncBasicHandle().CheckCircularRef {
		z.EncEncode(x)
		return
	}
	if x == nil {
		r.EncodeNil()
	} else {
		yy2arr2 := z.EncBasicHandle().StructToArray
		_ = yy2arr2
		const yyr2 bool = false // struct tag has 'toArray'
		if yyr2 || yy2arr2 {
			z.EncWriteArrayStart(4)
			z.EncWriteArrayElem()
			r.EncodeString(string(x.Id))
			z.EncWriteArrayElem()
			r.EncodeString(string(x.Spec))
			z.EncWriteArrayElem()
			r.EncodeFloat64(float64(x.Value))
			z.EncWriteArrayElem()
			r.EncodeString(string(x.Currency))
			z.EncWriteArrayEnd()
		} else {
			z.EncWriteMapStart(4)
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"id\"")
			} else {
				r.EncodeString(`id`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.Id))
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"spec\"")
			} else {
				r.EncodeString(`spec`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.Spec))
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"value\"")
			} else {
				r.EncodeString(`value`)
			}
			z.EncWriteMapElemValue()
			r.EncodeFloat64(float64(x.Value))
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"currency\"")
			} else {
				r.EncodeString(`currency`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.Currency))
			z.EncWriteMapEnd()
		}
	}
}

func (x *Price) CodecDecodeSelf(d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	yyct2 := r.ContainerType()
	if yyct2 == codecSelferValueTypeNil437 {
		*(x) = Price{}
	} else if yyct2 == codecSelferValueTypeMap437 {
		yyl2 := z.DecReadMapStart()
		if yyl2 == 0 {
		} else {
			x.codecDecodeSelfFromMap(yyl2, d)
		}
		z.DecReadMapEnd()
	} else if yyct2 == codecSelferValueTypeArray437 {
		yyl2 := z.DecReadArrayStart()
		if yyl2 != 0 {
			x.codecDecodeSelfFromArray(yyl2, d)
		}
		z.DecReadArrayEnd()
	} else {
		panic(errCodecSelferOnlyMapOrArrayEncodeToStruct437)
	}
}

func (x *Price) codecDecodeSelfFromMap(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyhl3 bool = l >= 0
	for yyj3 := 0; ; yyj3++ {
		if yyhl3 {
			if yyj3 >= l {
				break
			}
		} else {
			if z.DecCheckBreak() {
				break
			}
		}
		z.DecReadMapElemKey()
		yys3 := r.DecodeStringAsBytes()
		z.DecReadMapElemValue()
		switch string(yys3) {
		case "id":
			x.Id = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		case "spec":
			x.Spec = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		case "value":
			x.Value = (float64)(r.DecodeFloat64())
		case "currency":
			x.Currency = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		default:
			z.DecStructFieldNotFound(-1, string(yys3))
		} // end switch yys3
	} // end for yyj3
}

func (x *Price) codecDecodeSelfFromArray(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyj8 int
	var yyb8 bool
	var yyhl8 bool = l >= 0
	yyj8++
	if yyhl8 {
		yyb8 = yyj8 > l
	} else {
		yyb8 = z.DecCheckBreak()
	}
	if yyb8 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.Id = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	yyj8++
	if yyhl8 {
		yyb8 = yyj8 > l
	} else {
		yyb8 = z.DecCheckBreak()
	}
	if yyb8 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.Spec = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	yyj8++
	if yyhl8 {
		yyb8 = yyj8 > l
	} else {
		yyb8 = z.DecCheckBreak()
	}
	if yyb8 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.Value = (float64)(r.DecodeFloat64())
	yyj8++
	if yyhl8 {
		yyb8 = yyj8 > l
	} else {
		yyb8 = z.DecCheckBreak()
	}
	if yyb8 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.Currency = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	for {
		yyj8++
		if yyhl8 {
			yyb8 = yyj8 > l
		} else {
			yyb8 = z.DecCheckBreak()
		}
		if yyb8 {
			break
		}
		z.DecReadArrayElem()
		z.DecStructFieldNotFound(yyj8-1, "")
	}
}

func (x *Price) IsCodecEmpty() bool {
	return !(x.Id != "" || x.Spec != "" || x.Value != 0 || x.Currency != "" || false)
}

func (CharValue) codecSelferViaCodecgen() {}
func (x *CharValue) CodecEncodeSelf(e *codec1978.Encoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Encoder(e)
	_, _, _ = h, z, r
	if z.EncBasicHandle().CheckCircularRef {
		z.EncEncode(x)
		return
	}
	if x == nil {
		r.EncodeNil()
	} else {
		yy2arr2 := z.EncBasicHandle().StructToArray
		_ = yy2arr2
		const yyr2 bool = false // struct tag has 'toArray'
		if yyr2 || yy2arr2 {
			z.EncWriteArrayStart(2)
			z.EncWriteArrayElem()
			r.EncodeString(string(x.Char))
			z.EncWriteArrayElem()
			r.EncodeString(string(x.Value))
			z.EncWriteArrayEnd()
		} else {
			z.EncWriteMapStart(2)
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"char\"")
			} else {
				r.EncodeString(`char`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.Char))
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"value\"")
			} else {
				r.EncodeString(`value`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.Value))
			z.EncWriteMapEnd()
		}
	}
}

func (x *CharValue) CodecDecodeSelf(d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	yyct2 := r.ContainerType()
	if yyct2 == codecSelferValueTypeNil437 {
		*(x) = CharValue{}
	} else if yyct2 == codecSelferValueTypeMap437 {
		yyl2 := z.DecReadMapStart()
		if yyl2 == 0 {
		} else {
			x.codecDecodeSelfFromMap(yyl2, d)
		}
		z.DecReadMapEnd()
	} else if yyct2 == codecSelferValueTypeArray437 {
		yyl2 := z.DecReadArrayStart()
		if yyl2 != 0 {
			x.codecDecodeSelfFromArray(yyl2, d)
		}
		z.DecReadArrayEnd()
	} else {
		panic(errCodecSelferOnlyMapOrArrayEncodeToStruct437)
	}
}

func (x *CharValue) codecDecodeSelfFromMap(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyhl3 bool = l >= 0
	for yyj3 := 0; ; yyj3++ {
		if yyhl3 {
			if yyj3 >= l {
				break
			}
		} else {
			if z.DecCheckBreak() {
				break
			}
		}
		z.DecReadMapElemKey()
		yys3 := r.DecodeStringAsBytes()
		z.DecReadMapElemValue()
		switch string(yys3) {
		case "char":
			x.Char = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		case "value":
			x.Value = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		default:
			z.DecStructFieldNotFound(-1, string(yys3))
		} // end switch yys3
	} // end for yyj3
}

func (x *CharValue) codecDecodeSelfFromArray(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyj6 int
	var yyb6 bool
	var yyhl6 bool = l >= 0
	yyj6++
	if yyhl6 {
		yyb6 = yyj6 > l
	} else {
		yyb6 = z.DecCheckBreak()
	}
	if yyb6 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.Char = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	yyj6++
	if yyhl6 {
		yyb6 = yyj6 > l
	} else {
		yyb6 = z.DecCheckBreak()
	}
	if yyb6 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.Value = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	for {
		yyj6++
		if yyhl6 {
			yyb6 = yyj6 > l
		} else {
			yyb6 = z.DecCheckBreak()
		}
		if yyb6 {
			break
		}
		z.DecReadArrayElem()
		z.DecStructFieldNotFound(yyj6-1, "")
	}
}

func (x *CharValue) IsCodecEmpty() bool {
	return !(x.Char != "" || x.Value != "" || false)
}

func (FindPriceRequest) codecSelferViaCodecgen() {}
func (x *FindPriceRequest) CodecEncodeSelf(e *codec1978.Encoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Encoder(e)
	_, _, _ = h, z, r
	if z.EncBasicHandle().CheckCircularRef {
		z.EncEncode(x)
		return
	}
	if x == nil {
		r.EncodeNil()
	} else {
		yy2arr2 := z.EncBasicHandle().StructToArray
		_ = yy2arr2
		const yyr2 bool = false // struct tag has 'toArray'
		if yyr2 || yy2arr2 {
			z.EncWriteArrayStart(4)
			z.EncWriteArrayElem()
			r.EncodeString(string(x.OfferingId))
			z.EncWriteArrayElem()
			r.EncodeString(string(x.GroupId))
			z.EncWriteArrayElem()
			r.EncodeString(string(x.PriceSpecId))
			z.EncWriteArrayElem()
			if x.CharValues == nil {
				r.EncodeNil()
			} else {
				h.encSliceCharValue(([]CharValue)(x.CharValues), e)
			} // end block: if x.CharValues slice == nil
			z.EncWriteArrayEnd()
		} else {
			z.EncWriteMapStart(4)
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"offeringId\"")
			} else {
				r.EncodeString(`offeringId`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.OfferingId))
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"groupId\"")
			} else {
				r.EncodeString(`groupId`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.GroupId))
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"priceSpecId\"")
			} else {
				r.EncodeString(`priceSpecId`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.PriceSpecId))
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"charValues\"")
			} else {
				r.EncodeString(`charValues`)
			}
			z.EncWriteMapElemValue()
			if x.CharValues == nil {
				r.EncodeNil()
			} else {
				h.encSliceCharValue(([]CharValue)(x.CharValues), e)
			} // end block: if x.CharValues slice == nil
			z.EncWriteMapEnd()
		}
	}
}

func (x *FindPriceRequest) CodecDecodeSelf(d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	yyct2 := r.ContainerType()
	if yyct2 == codecSelferValueTypeNil437 {
		*(x) = FindPriceRequest{}
	} else if yyct2 == codecSelferValueTypeMap437 {
		yyl2 := z.DecReadMapStart()
		if yyl2 == 0 {
		} else {
			x.codecDecodeSelfFromMap(yyl2, d)
		}
		z.DecReadMapEnd()
	} else if yyct2 == codecSelferValueTypeArray437 {
		yyl2 := z.DecReadArrayStart()
		if yyl2 != 0 {
			x.codecDecodeSelfFromArray(yyl2, d)
		}
		z.DecReadArrayEnd()
	} else {
		panic(errCodecSelferOnlyMapOrArrayEncodeToStruct437)
	}
}

func (x *FindPriceRequest) codecDecodeSelfFromMap(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyhl3 bool = l >= 0
	for yyj3 := 0; ; yyj3++ {
		if yyhl3 {
			if yyj3 >= l {
				break
			}
		} else {
			if z.DecCheckBreak() {
				break
			}
		}
		z.DecReadMapElemKey()
		yys3 := r.DecodeStringAsBytes()
		z.DecReadMapElemValue()
		switch string(yys3) {
		case "offeringId":
			x.OfferingId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		case "groupId":
			x.GroupId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		case "priceSpecId":
			x.PriceSpecId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		case "charValues":
			h.decSliceCharValue((*[]CharValue)(&x.CharValues), d)
		default:
			z.DecStructFieldNotFound(-1, string(yys3))
		} // end switch yys3
	} // end for yyj3
}

func (x *FindPriceRequest) codecDecodeSelfFromArray(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyj9 int
	var yyb9 bool
	var yyhl9 bool = l >= 0
	yyj9++
	if yyhl9 {
		yyb9 = yyj9 > l
	} else {
		yyb9 = z.DecCheckBreak()
	}
	if yyb9 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.OfferingId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	yyj9++
	if yyhl9 {
		yyb9 = yyj9 > l
	} else {
		yyb9 = z.DecCheckBreak()
	}
	if yyb9 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.GroupId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	yyj9++
	if yyhl9 {
		yyb9 = yyj9 > l
	} else {
		yyb9 = z.DecCheckBreak()
	}
	if yyb9 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.PriceSpecId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	yyj9++
	if yyhl9 {
		yyb9 = yyj9 > l
	} else {
		yyb9 = z.DecCheckBreak()
	}
	if yyb9 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	h.decSliceCharValue((*[]CharValue)(&x.CharValues), d)
	for {
		yyj9++
		if yyhl9 {
			yyb9 = yyj9 > l
		} else {
			yyb9 = z.DecCheckBreak()
		}
		if yyb9 {
			break
		}
		z.DecReadArrayElem()
		z.DecStructFieldNotFound(yyj9-1, "")
	}
}

func (x *FindPriceRequest) IsCodecEmpty() bool {
	return !(x.OfferingId != "" || x.GroupId != "" || x.PriceSpecId != "" || len(x.CharValues) != 0 || false)
}

func (FindPriceRequestBulk) codecSelferViaCodecgen() {}
func (x *FindPriceRequestBulk) CodecEncodeSelf(e *codec1978.Encoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Encoder(e)
	_, _, _ = h, z, r
	if z.EncBasicHandle().CheckCircularRef {
		z.EncEncode(x)
		return
	}
	if x == nil {
		r.EncodeNil()
	} else {
		yy2arr2 := z.EncBasicHandle().StructToArray
		_ = yy2arr2
		const yyr2 bool = false // struct tag has 'toArray'
		if yyr2 || yy2arr2 {
			z.EncWriteArrayStart(5)
			z.EncWriteArrayElem()
			r.EncodeString(string(x.OfferingId))
			z.EncWriteArrayElem()
			r.EncodeString(string(x.GroupId))
			z.EncWriteArrayElem()
			r.EncodeString(string(x.PriceSpecId))
			z.EncWriteArrayElem()
			if x.CharValues == nil {
				r.EncodeNil()
			} else {
				h.encSliceCharValue(([]CharValue)(x.CharValues), e)
			} // end block: if x.CharValues slice == nil
			z.EncWriteArrayElem()
			r.EncodeUint(uint64(x.Id))
			z.EncWriteArrayEnd()
		} else {
			z.EncWriteMapStart(5)
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"offeringId\"")
			} else {
				r.EncodeString(`offeringId`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.OfferingId))
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"groupId\"")
			} else {
				r.EncodeString(`groupId`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.GroupId))
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"priceSpecId\"")
			} else {
				r.EncodeString(`priceSpecId`)
			}
			z.EncWriteMapElemValue()
			r.EncodeString(string(x.PriceSpecId))
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"charValues\"")
			} else {
				r.EncodeString(`charValues`)
			}
			z.EncWriteMapElemValue()
			if x.CharValues == nil {
				r.EncodeNil()
			} else {
				h.encSliceCharValue(([]CharValue)(x.CharValues), e)
			} // end block: if x.CharValues slice == nil
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"id\"")
			} else {
				r.EncodeString(`id`)
			}
			z.EncWriteMapElemValue()
			r.EncodeUint(uint64(x.Id))
			z.EncWriteMapEnd()
		}
	}
}

func (x *FindPriceRequestBulk) CodecDecodeSelf(d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	yyct2 := r.ContainerType()
	if yyct2 == codecSelferValueTypeNil437 {
		*(x) = FindPriceRequestBulk{}
	} else if yyct2 == codecSelferValueTypeMap437 {
		yyl2 := z.DecReadMapStart()
		if yyl2 == 0 {
		} else {
			x.codecDecodeSelfFromMap(yyl2, d)
		}
		z.DecReadMapEnd()
	} else if yyct2 == codecSelferValueTypeArray437 {
		yyl2 := z.DecReadArrayStart()
		if yyl2 != 0 {
			x.codecDecodeSelfFromArray(yyl2, d)
		}
		z.DecReadArrayEnd()
	} else {
		panic(errCodecSelferOnlyMapOrArrayEncodeToStruct437)
	}
}

func (x *FindPriceRequestBulk) codecDecodeSelfFromMap(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyhl3 bool = l >= 0
	for yyj3 := 0; ; yyj3++ {
		if yyhl3 {
			if yyj3 >= l {
				break
			}
		} else {
			if z.DecCheckBreak() {
				break
			}
		}
		z.DecReadMapElemKey()
		yys3 := r.DecodeStringAsBytes()
		z.DecReadMapElemValue()
		switch string(yys3) {
		case "offeringId":
			x.OfferingId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		case "groupId":
			x.GroupId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		case "priceSpecId":
			x.PriceSpecId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
		case "charValues":
			h.decSliceCharValue((*[]CharValue)(&x.CharValues), d)
		case "id":
			x.Id = (uint16)(z.C.UintV(r.DecodeUint64(), 16))
		default:
			z.DecStructFieldNotFound(-1, string(yys3))
		} // end switch yys3
	} // end for yyj3
}

func (x *FindPriceRequestBulk) codecDecodeSelfFromArray(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyj10 int
	var yyb10 bool
	var yyhl10 bool = l >= 0
	yyj10++
	if yyhl10 {
		yyb10 = yyj10 > l
	} else {
		yyb10 = z.DecCheckBreak()
	}
	if yyb10 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.OfferingId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	yyj10++
	if yyhl10 {
		yyb10 = yyj10 > l
	} else {
		yyb10 = z.DecCheckBreak()
	}
	if yyb10 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.GroupId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	yyj10++
	if yyhl10 {
		yyb10 = yyj10 > l
	} else {
		yyb10 = z.DecCheckBreak()
	}
	if yyb10 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.PriceSpecId = (string)(z.DecStringZC(r.DecodeStringAsBytes()))
	yyj10++
	if yyhl10 {
		yyb10 = yyj10 > l
	} else {
		yyb10 = z.DecCheckBreak()
	}
	if yyb10 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	h.decSliceCharValue((*[]CharValue)(&x.CharValues), d)
	yyj10++
	if yyhl10 {
		yyb10 = yyj10 > l
	} else {
		yyb10 = z.DecCheckBreak()
	}
	if yyb10 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.Id = (uint16)(z.C.UintV(r.DecodeUint64(), 16))
	for {
		yyj10++
		if yyhl10 {
			yyb10 = yyj10 > l
		} else {
			yyb10 = z.DecCheckBreak()
		}
		if yyb10 {
			break
		}
		z.DecReadArrayElem()
		z.DecStructFieldNotFound(yyj10-1, "")
	}
}

func (x *FindPriceRequestBulk) IsCodecEmpty() bool {
	return !(x.OfferingId != "" || x.GroupId != "" || x.PriceSpecId != "" || len(x.CharValues) != 0 || x.Id != 0 || false)
}

func (FindPriceResponseBulk) codecSelferViaCodecgen() {}
func (x *FindPriceResponseBulk) CodecEncodeSelf(e *codec1978.Encoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Encoder(e)
	_, _, _ = h, z, r
	if z.EncBasicHandle().CheckCircularRef {
		z.EncEncode(x)
		return
	}
	if x == nil {
		r.EncodeNil()
	} else {
		yy2arr2 := z.EncBasicHandle().StructToArray
		_ = yy2arr2
		const yyr2 bool = false // struct tag has 'toArray'
		var yyn3 bool = x.Price == nil
		if yyr2 || yy2arr2 {
			z.EncWriteArrayStart(2)
			if yyn3 {
				z.EncWriteArrayElem()
				r.EncodeNil()
			} else {
				z.EncWriteArrayElem()
				if yyxt5 := z.Extension(x.Price); yyxt5 != nil {
					z.EncExtension(x.Price, yyxt5)
				} else {
					x.Price.CodecEncodeSelf(e)
				}
			}
			z.EncWriteArrayElem()
			r.EncodeUint(uint64(x.Id))
			z.EncWriteArrayEnd()
		} else {
			z.EncWriteMapStart(2)
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"price\"")
			} else {
				r.EncodeString(`price`)
			}
			z.EncWriteMapElemValue()
			if yyn3 {
				r.EncodeNil()
			} else {
				if yyxt7 := z.Extension(x.Price); yyxt7 != nil {
					z.EncExtension(x.Price, yyxt7)
				} else {
					x.Price.CodecEncodeSelf(e)
				}
			}
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"id\"")
			} else {
				r.EncodeString(`id`)
			}
			z.EncWriteMapElemValue()
			r.EncodeUint(uint64(x.Id))
			z.EncWriteMapEnd()
		}
	}
}

func (x *FindPriceResponseBulk) CodecDecodeSelf(d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	yyct2 := r.ContainerType()
	if yyct2 == codecSelferValueTypeNil437 {
		*(x) = FindPriceResponseBulk{}
	} else if yyct2 == codecSelferValueTypeMap437 {
		yyl2 := z.DecReadMapStart()
		if yyl2 == 0 {
		} else {
			x.codecDecodeSelfFromMap(yyl2, d)
		}
		z.DecReadMapEnd()
	} else if yyct2 == codecSelferValueTypeArray437 {
		yyl2 := z.DecReadArrayStart()
		if yyl2 != 0 {
			x.codecDecodeSelfFromArray(yyl2, d)
		}
		z.DecReadArrayEnd()
	} else {
		panic(errCodecSelferOnlyMapOrArrayEncodeToStruct437)
	}
}

func (x *FindPriceResponseBulk) codecDecodeSelfFromMap(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyhl3 bool = l >= 0
	for yyj3 := 0; ; yyj3++ {
		if yyhl3 {
			if yyj3 >= l {
				break
			}
		} else {
			if z.DecCheckBreak() {
				break
			}
		}
		z.DecReadMapElemKey()
		yys3 := r.DecodeStringAsBytes()
		z.DecReadMapElemValue()
		switch string(yys3) {
		case "price":
			if r.TryNil() {
				if x.Price != nil { // remove the if-true
					x.Price = nil
				}
			} else {
				if x.Price == nil {
					x.Price = new(Price)
				}
				if yyxt5 := z.Extension(x.Price); yyxt5 != nil {
					z.DecExtension(x.Price, yyxt5)
				} else {
					x.Price.CodecDecodeSelf(d)
				}
			}
		case "id":
			x.Id = (uint16)(z.C.UintV(r.DecodeUint64(), 16))
		default:
			z.DecStructFieldNotFound(-1, string(yys3))
		} // end switch yys3
	} // end for yyj3
}

func (x *FindPriceResponseBulk) codecDecodeSelfFromArray(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyj7 int
	var yyb7 bool
	var yyhl7 bool = l >= 0
	yyj7++
	if yyhl7 {
		yyb7 = yyj7 > l
	} else {
		yyb7 = z.DecCheckBreak()
	}
	if yyb7 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	if r.TryNil() {
		if x.Price != nil { // remove the if-true
			x.Price = nil
		}
	} else {
		if x.Price == nil {
			x.Price = new(Price)
		}
		if yyxt9 := z.Extension(x.Price); yyxt9 != nil {
			z.DecExtension(x.Price, yyxt9)
		} else {
			x.Price.CodecDecodeSelf(d)
		}
	}
	yyj7++
	if yyhl7 {
		yyb7 = yyj7 > l
	} else {
		yyb7 = z.DecCheckBreak()
	}
	if yyb7 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.Id = (uint16)(z.C.UintV(r.DecodeUint64(), 16))
	for {
		yyj7++
		if yyhl7 {
			yyb7 = yyj7 > l
		} else {
			yyb7 = z.DecCheckBreak()
		}
		if yyb7 {
			break
		}
		z.DecReadArrayElem()
		z.DecStructFieldNotFound(yyj7-1, "")
	}
}

func (x *FindPriceResponseBulk) IsCodecEmpty() bool {
	return !(x.Id != 0 || false)
}

func (FindPriceResponseBulkError) codecSelferViaCodecgen() {}
func (x *FindPriceResponseBulkError) CodecEncodeSelf(e *codec1978.Encoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Encoder(e)
	_, _, _ = h, z, r
	if z.EncBasicHandle().CheckCircularRef {
		z.EncEncode(x)
		return
	}
	if x == nil {
		r.EncodeNil()
	} else {
		yy2arr2 := z.EncBasicHandle().StructToArray
		_ = yy2arr2
		const yyr2 bool = false // struct tag has 'toArray'
		if yyr2 || yy2arr2 {
			z.EncWriteArrayStart(2)
			z.EncWriteArrayElem()
			z.EncFallback(x.Error)
			z.EncWriteArrayElem()
			r.EncodeUint(uint64(x.Id))
			z.EncWriteArrayEnd()
		} else {
			z.EncWriteMapStart(2)
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"Error\"")
			} else {
				r.EncodeString(`Error`)
			}
			z.EncWriteMapElemValue()
			z.EncFallback(x.Error)
			z.EncWriteMapElemKey()
			if z.IsJSONHandle() {
				z.WriteStr("\"id\"")
			} else {
				r.EncodeString(`id`)
			}
			z.EncWriteMapElemValue()
			r.EncodeUint(uint64(x.Id))
			z.EncWriteMapEnd()
		}
	}
}

func (x *FindPriceResponseBulkError) CodecDecodeSelf(d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	yyct2 := r.ContainerType()
	if yyct2 == codecSelferValueTypeNil437 {
		*(x) = FindPriceResponseBulkError{}
	} else if yyct2 == codecSelferValueTypeMap437 {
		yyl2 := z.DecReadMapStart()
		if yyl2 == 0 {
		} else {
			x.codecDecodeSelfFromMap(yyl2, d)
		}
		z.DecReadMapEnd()
	} else if yyct2 == codecSelferValueTypeArray437 {
		yyl2 := z.DecReadArrayStart()
		if yyl2 != 0 {
			x.codecDecodeSelfFromArray(yyl2, d)
		}
		z.DecReadArrayEnd()
	} else {
		panic(errCodecSelferOnlyMapOrArrayEncodeToStruct437)
	}
}

func (x *FindPriceResponseBulkError) codecDecodeSelfFromMap(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyhl3 bool = l >= 0
	for yyj3 := 0; ; yyj3++ {
		if yyhl3 {
			if yyj3 >= l {
				break
			}
		} else {
			if z.DecCheckBreak() {
				break
			}
		}
		z.DecReadMapElemKey()
		yys3 := r.DecodeStringAsBytes()
		z.DecReadMapElemValue()
		switch string(yys3) {
		case "Error":
			z.DecFallback(&x.Error, true)
		case "id":
			x.Id = (uint16)(z.C.UintV(r.DecodeUint64(), 16))
		default:
			z.DecStructFieldNotFound(-1, string(yys3))
		} // end switch yys3
	} // end for yyj3
}

func (x *FindPriceResponseBulkError) codecDecodeSelfFromArray(l int, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r
	var yyj7 int
	var yyb7 bool
	var yyhl7 bool = l >= 0
	yyj7++
	if yyhl7 {
		yyb7 = yyj7 > l
	} else {
		yyb7 = z.DecCheckBreak()
	}
	if yyb7 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	z.DecFallback(&x.Error, true)
	yyj7++
	if yyhl7 {
		yyb7 = yyj7 > l
	} else {
		yyb7 = z.DecCheckBreak()
	}
	if yyb7 {
		z.DecReadArrayEnd()
		return
	}
	z.DecReadArrayElem()
	x.Id = (uint16)(z.C.UintV(r.DecodeUint64(), 16))
	for {
		yyj7++
		if yyhl7 {
			yyb7 = yyj7 > l
		} else {
			yyb7 = z.DecCheckBreak()
		}
		if yyb7 {
			break
		}
		z.DecReadArrayElem()
		z.DecStructFieldNotFound(yyj7-1, "")
	}
}

func (x *FindPriceResponseBulkError) IsCodecEmpty() bool {
	return !(x.Error != nil || x.Id != 0 || false)
}

func (x codecSelfer437) encSliceCharValue(v []CharValue, e *codec1978.Encoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Encoder(e)
	_, _, _ = h, z, r
	if v == nil {
		r.EncodeNil()
		return
	}
	z.EncWriteArrayStart(len(v))
	for yyv1 := range v {
		z.EncWriteArrayElem()
		yy2 := &v[yyv1]
		if yyxt3 := z.Extension(yy2); yyxt3 != nil {
			z.EncExtension(yy2, yyxt3)
		} else {
			yy2.CodecEncodeSelf(e)
		}
	}
	z.EncWriteArrayEnd()
}

func (x codecSelfer437) decSliceCharValue(v *[]CharValue, d *codec1978.Decoder) {
	var h codecSelfer437
	z, r := codec1978.GenHelper().Decoder(d)
	_, _, _ = h, z, r

	yyv1 := *v
	yyh1, yyl1 := z.DecSliceHelperStart()
	var yyc1 bool
	_ = yyc1
	if yyh1.IsNil {
		if yyv1 != nil {
			yyv1 = nil
			yyc1 = true
		}
	} else if yyl1 == 0 {
		if yyv1 == nil {
			yyv1 = []CharValue{}
			yyc1 = true
		} else if len(yyv1) != 0 {
			yyv1 = yyv1[:0]
			yyc1 = true
		}
	} else {
		yyhl1 := yyl1 > 0
		var yyrl1 int
		_ = yyrl1
		if yyhl1 {
			if yyl1 > cap(yyv1) {
				yyrl1 = z.DecInferLen(yyl1, z.DecBasicHandle().MaxInitLen, 32)
				if yyrl1 <= cap(yyv1) {
					yyv1 = yyv1[:yyrl1]
				} else {
					yyv1 = make([]CharValue, yyrl1)
				}
				yyc1 = true
			} else if yyl1 != len(yyv1) {
				yyv1 = yyv1[:yyl1]
				yyc1 = true
			}
		}
		var yyj1 int
		for yyj1 = 0; (yyhl1 && yyj1 < yyl1) || !(yyhl1 || z.DecCheckBreak()); yyj1++ { // bounds-check-elimination
			if yyj1 == 0 && yyv1 == nil {
				if yyhl1 {
					yyrl1 = z.DecInferLen(yyl1, z.DecBasicHandle().MaxInitLen, 32)
				} else {
					yyrl1 = 8
				}
				yyv1 = make([]CharValue, yyrl1)
				yyc1 = true
			}
			yyh1.ElemContainerState(yyj1)
			var yydb1 bool
			if yyj1 >= len(yyv1) {
				yyv1 = append(yyv1, CharValue{})
				yyc1 = true
			}
			if yydb1 {
				z.DecSwallow()
			} else {
				if yyxt3 := z.Extension(yyv1[yyj1]); yyxt3 != nil {
					z.DecExtension(&yyv1[yyj1], yyxt3)
				} else {
					yyv1[yyj1].CodecDecodeSelf(d)
				}
			}
		}
		if yyj1 < len(yyv1) {
			yyv1 = yyv1[:yyj1]
			yyc1 = true
		} else if yyj1 == 0 && yyv1 == nil {
			yyv1 = []CharValue{}
			yyc1 = true
		}
	}
	yyh1.End()
	if yyc1 {
		*v = yyv1
	}
}
