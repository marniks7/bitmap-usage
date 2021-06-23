package handlersroaring64

import (
	"testing"
)

func TestFindPriceBy(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestFindPrice(t, as.FindPriceByX)
}

func TestFindPriceBy_NotFound(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestPriceNotFound(t, as.FindPriceByX)
}
