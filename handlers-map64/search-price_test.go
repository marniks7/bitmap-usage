package handlersmap64

import (
	"testing"
)

func TestFindPriceBy(t *testing.T) {
	//given catalog
	as := PrepareMap()
	//test
	FuncTestFindPriceGeneric(t, as.FindPriceByX)
}

func TestFindPriceBy_NotFound(t *testing.T) {
	//given catalog
	as := PrepareMap()

	//test
	FuncTestPriceNotFound(t, as.FindPriceByX)
}
