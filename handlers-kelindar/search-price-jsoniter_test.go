package handlerskelindar

import (
	"testing"
)

func TestFindPriceByJsoniter(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestFindPrice(t, as.FindPriceByXJsoniter)
}

func TestFindPriceBy_NotFound_Jsoniter(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestPriceNotFound(t, as.FindPriceByXJsoniter)
}
