package sample

import (
	"testing"
)

func TestGenerateJson(t *testing.T) {
	GenerateJson(1)
	GenerateJson(5)
	GenerateJson(1000)
	GenerateJson(10000)
	GenerateJson(100000)
}

//func TestGenerateUUIDPool(t *testing.T) {
//	for i:=0; i < 30; i++ {
//		fmt.Println("\"" + uuid.NewString() + "\",")
//	}
//}
