package model

type ChanFindPriceRequestBulk struct {
	FPRB   *FindPriceRequestBulk
	Result chan FindPriceResponseBulk
	Err    chan error
}
