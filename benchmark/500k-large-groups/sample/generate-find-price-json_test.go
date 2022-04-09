package sample

import (
	"testing"
)

func TestGenerateJson(t *testing.T) {
	GenerateJsonRequest(1, false)
	GenerateJsonRequest(5, false)
	GenerateJsonRequest(1000, false)
	GenerateJsonRequest(3000, false)
	GenerateJsonRequest(10000, false)

	GenerateJsonRequest(1, true)
	GenerateJsonRequest(5, true)
	GenerateJsonRequest(1000, true)
	GenerateJsonRequest(3000, true)
	GenerateJsonRequest(10000, true)
}

func TestGenerateWrk(t *testing.T) {
	GenerateWrkRequest(1, false)
	GenerateWrkRequest(5, false)
	GenerateWrkRequest(1000, false)
	GenerateWrkRequest(3000, false)
	GenerateWrkRequest(10000, false)

	GenerateWrkRequest(1, true)
	GenerateWrkRequest(5, true)
	GenerateWrkRequest(1000, true)
	GenerateWrkRequest(3000, true)
	GenerateWrkRequest(10000, true)
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
