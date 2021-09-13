package handlerskelindar

import (
	"github.com/ugorji/go/codec"
	"testing"
)

func TestFindPriceByUgorji(t *testing.T) {
	//given catalog
	as := PrepareBitmap()
	as.Codec = new(codec.JsonHandle)
	as.Codec.ReaderBufferSize = 8192
	as.Codec.WriterBufferSize = 8192

	//test
	FuncTestFindPrice(t, as.FindPriceByX_Ugorji)
}

func TestFindPriceByUgorji_NotFound(t *testing.T) {
	//given catalog
	as := PrepareBitmap()
	as.Codec = new(codec.JsonHandle)
	as.Codec.ReaderBufferSize = 8192
	as.Codec.WriterBufferSize = 8192

	//test
	FuncTestPriceNotFound(t, as.FindPriceByX_Ugorji)
}
