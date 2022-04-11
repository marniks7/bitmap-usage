package sample

import (
	"strconv"
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
		Filename string
		Api      string
	}{
		{Filename: "wrk-search-price-bitmap-multiple-request",
			Api: "/v1/search/bitmap/prices"},
		{Filename: "wrk-search-price-map-multiple-request",
			Api: "/v1/search/map/prices"},
		{Filename: "wrk-search-price-kelindar-multiple-request",
			Api: "/v1/search/kelindar/prices"},
	}
	sizes := []int{100, 1000, 2000}

	for _, l := range list {
		for _, size := range sizes {
			GenerateWrkRequestMultiple(size, l.Api, l.Filename+"-"+strconv.Itoa(size)+".lua")
		}
	}
}
