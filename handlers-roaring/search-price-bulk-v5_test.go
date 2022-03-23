package handlersroaring

import (
	"testing"
)

func TestFindPriceBulkBy(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestBulkFindPrice(t, as.FindPriceBulkByXV5)
}

func TestFindPriceBulkFewBy(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestBulkFindPriceFew(t, as.FindPriceBulkByXV5)
}

func TestFindPriceBulkBy_NotFound(t *testing.T) {
	//given catalog
	as := PrepareBitmap()

	//test
	FuncTestBulkPriceNotFound(t, as.FindPriceBulkByXV5)
}
