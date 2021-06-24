package model

import (
	"bitmap-usage/benchmark"
	"bitmap-usage/misc"
	"bufio"
	"fmt"
	"github.com/google/uuid"
	"github.com/stretchr/testify/assert"
	"os"
	"runtime"
	"strconv"
	"testing"
	"unsafe"
)

var p = fmt.Fprintln
var f = fmt.Fprintf

//goland:noinspection GoUnhandledErrorResult
func TestPriceSize(t *testing.T) {
	file, err := os.Create("price-memory-" + strconv.Itoa(strconv.IntSize) + ".md")
	assert.NoError(t, err)

	defer file.Close()

	w := bufio.NewWriter(file)
	price := Price{}
	priceSize := unsafe.Sizeof(price)
	p(w, "# Price")
	p(w, "* Architecture (IntSize) - ", strconv.IntSize)
	f(w, "* Price - %v bytes\n\n", priceSize)
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
	priceCondition := unsafe.Sizeof(PriceCondition{})
	fmt.Println("# PriceCondition")
	fmt.Printf("Single PriceCondition %v bytes\n\n", priceCondition)
	fmt.Printf("|Amount|MB|\n")
	fmt.Printf("---|----|\n")
	for i := 10000; i <= 10000000; i *= 10 {
		fmt.Printf("|%v|%v|\n", i, int(priceCondition)*i/1024/1024)
	}
}

func TestNewFunction2(t *testing.T) {
	fmt.Println(len(uuid.NewString()))
	fmt.Println(unsafe.Sizeof(make(map[string]*Price, 0)))
}

func TestMap(t *testing.T) {
	runtime.GC()
	before := benchmark.PrintMemStats()
	l := make(map[string]*Price, 500000)
	runtime.GC()
	after := benchmark.PrintMemStats()
	benchmark.PrintMemStatsBetween(after, before)
	fmt.Println(l)
}

func TestMap2(t *testing.T) {
	before := benchmark.PrintMemStats()
	l := make(map[string]*Price, 1)
	after := benchmark.PrintMemStats()
	benchmark.PrintMemStatsFormat(after, before, misc.ConvertToHumanReadableSize)
	assert.Len(t, l, 0)
}

func Test3(t *testing.T) {
	var m1, m2 runtime.MemStats
	runtime.ReadMemStats(&m1)
	t1 := make(map[int]int, 14)
	runtime.ReadMemStats(&m2)
	memUsage(&m1, &m2)
	fmt.Println(t1)
}

func memUsage(m1, m2 *runtime.MemStats) {
	fmt.Println("Alloc:", m2.Alloc-m1.Alloc,
		"TotalAlloc:", m2.TotalAlloc-m1.TotalAlloc,
		"HeapAlloc:", m2.HeapAlloc-m1.HeapAlloc)
}
