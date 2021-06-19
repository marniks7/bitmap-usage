package handlersroaring

import (
	"testing"
)

func TestFindPriceByFFJson(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestFindPrice(t, as.FindPriceByX_FFJson)
}

func TestFindPriceBy_NotFound_FFJson(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestPriceNotFound(t, as.FindPriceByX_FFJson)
}
