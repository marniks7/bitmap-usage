package model

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"testing"
	"unsafe"
)

var p = fmt.Fprintln
var f = fmt.Fprintf

func TestPriceSize(t *testing.T) {
	file, err := os.Create("price-memory-" + strconv.Itoa(strconv.IntSize) + ".md")
	if err != nil {
		t.Fatal(err)
		return
	}
	defer file.Close()

	w := bufio.NewWriter(file)
	price := Price{}
	priceSize := unsafe.Sizeof(price)
	p(w, "# Price")
	p(w, "* Architecture (IntSize) - ", strconv.IntSize)
	f(w, "* Single Price - %v bytes\n\n", priceSize)
	f(w, "|FieldName|Size|Offset|\n")
	f(w, "---|----|----|\n")
	f(w, "%v|%v|%v|\n", "Id", unsafe.Sizeof(price.Id), unsafe.Offsetof(price.Id))
	f(w, "%v|%v|%v|\n", "Spec", unsafe.Sizeof(price.Spec), unsafe.Offsetof(price.Spec))
	f(w, "%v|%v|%v|\n", "Value", unsafe.Sizeof(price.Value), unsafe.Offsetof(price.Value))
	f(w, "%v|%v|%v|\n", "Currency", unsafe.Sizeof(price.Currency), unsafe.Offsetof(price.Currency))
	p(w)
	f(w, "|Amount|MB|\n")
	f(w, "---|----|\n")

	for i := 10000; i <= 10000000; i *= 10 {
		f(w, "|%v|%v|\n", i, int(priceSize)*i/1024/1024)
	}
	w.Flush()
}

func TestPriceConditionsSize(t *testing.T) {
	priceCondition := unsafe.Sizeof(PriceConditions{})
	fmt.Println("# PriceConditions")
	fmt.Printf("Single PriceCondition %v bytes\n\n", priceCondition)
	fmt.Printf("|Amount|MB|\n")
	fmt.Printf("---|----|\n")
	for i := 10000; i <= 10000000; i *= 10 {
		fmt.Printf("|%v|%v|\n", i, int(priceCondition)*i/1024/1024)
	}
}
