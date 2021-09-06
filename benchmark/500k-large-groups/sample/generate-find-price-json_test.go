package sample

import (
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
