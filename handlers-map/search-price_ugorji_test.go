package handlersmap

import (
	"testing"
)

func TestFindPriceBy_Ugorji(t *testing.T) {
	//given catalog
	as := PrepareMap()
	//test
	FuncTestFindPriceGeneric(t, as.FindPriceByXUgorji)
}

func TestFindPriceBy_Ugorji_NotFound(t *testing.T) {
	//given catalog
	as := PrepareMap()

	//test
	FuncTestPriceNotFound(t, as.FindPriceByXUgorji)
}
