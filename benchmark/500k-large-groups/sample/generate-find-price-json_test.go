package sample

import (
	"testing"
)

func TestGenerateJson(t *testing.T) {
	GenerateJsonRequest(1)
	GenerateJsonRequest(5)
	GenerateJsonRequest(1000)
	GenerateJsonRequest(3000)
	GenerateJsonRequest(10000)
}

func TestGenerateWrk(t *testing.T) {
	GenerateWrkRequest(1)
	GenerateWrkRequest(5)
	GenerateWrkRequest(1000)
	GenerateWrkRequest(3000)
	GenerateWrkRequest(10000)
}

func TestGenerateMultipleWRKBitmap(t *testing.T) {
	list := []struct {
		Size     int
		Filename string
		Api      string
	}{
		{Size: 100,
			Filename: "wrk-search-price-bitmap-multiple-request-100.lua",
			Api:      "/v1/search/bitmap/prices"},
		{Size: 1000,
			Filename: "wrk-search-price-bitmap-multiple-request-1000.lua",
			Api:      "/v1/search/bitmap/prices"},
		{Size: 100,
			Filename: "wrk-search-price-map-multiple-request-100.lua",
			Api:      "/v1/search/map/prices"},
		{Size: 1000,
			Filename: "wrk-search-price-map-multiple-request-1000.lua",
			Api:      "/v1/search/map/prices"},
		{Size: 100,
			Filename: "wrk-search-price-kelindar-multiple-request-100.lua",
			Api:      "/v1/search/kelindar/prices"},
		{Size: 1000,
			Filename: "wrk-search-price-kelindar-multiple-request-1000.lua",
			Api:      "/v1/search/kelindar/prices"},
	}

	for _, l := range list {
		GenerateWrkRequestMultiple(l.Size, l.Api, l.Filename)
	}
}
