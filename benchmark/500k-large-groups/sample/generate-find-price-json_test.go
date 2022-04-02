package sample

import (
	"strconv"
	"testing"
)

func TestGenerateJson(t *testing.T) {
	GenerateJsonRequest(1)
	GenerateJsonRequest(5)
	GenerateJsonRequest(1000)
	GenerateJsonRequest(10000)
}

func TestGenerateWrk(t *testing.T) {
	GenerateWrkRequest(1)
	GenerateWrkRequest(5)
	GenerateWrkRequest(1000)
	GenerateWrkRequest(10000)
}

func TestGenerateMultipleWRKBitmap(t *testing.T) {
	size := 100
	apiPart := "bitmap"
	filename := "search-price-" + apiPart + "-multiple-request-" + strconv.Itoa(size) + ".lua"
	GenerateWrkRequestMultiple(size, "/v1/search/"+apiPart+"/prices", filename)
}

func TestGenerateMultipleWRKMap(t *testing.T) {
	size := 100
	apiPart := "map"
	filename := "search-price-" + apiPart + "-multiple-request-" + strconv.Itoa(size) + ".lua"
	GenerateWrkRequestMultiple(size, "/v1/search/"+apiPart+"/prices", filename)
}
