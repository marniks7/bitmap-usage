package model

import (
	"bufio"
	"fmt"
	"github.com/google/uuid"
	"os"
	"runtime"
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
	priceCondition := unsafe.Sizeof(PriceConditions{})
	fmt.Println("# PriceConditions")
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

func PrintMemUsage() *runtime.MemStats {
	var m runtime.MemStats
	runtime.ReadMemStats(&m)
	// For info on each, see: https://golang.org/pkg/runtime/#MemStats
	conv := bytesToMB
	convStr := "MB"
	fmt.Printf("Alloc = %v%v", conv(m.Alloc), convStr)
	fmt.Printf("\tHeapAlloc = %v%v", conv(m.HeapAlloc), convStr)
	fmt.Printf("\tTotalAlloc = %v%v", conv(m.TotalAlloc), convStr)
	fmt.Printf("\tStackSys = %v%v", conv(m.StackSys), convStr)
	fmt.Printf("\tSys = %v%v", conv(m.Sys), convStr)
	fmt.Printf("\tNumGC = %v\n", m.NumGC)
	//var mem syscall.Rusage
	//syscall.Getrusage(syscall.RUSAGE_SELF, &mem)
	//fmt.Println(mem.Maxrss)
	return &m
}

func PrintMemUsageArgs(m1, m2 *runtime.MemStats) {
	// For info on each, see: https://golang.org/pkg/runtime/#MemStats
	conv := bytesToMB
	convStr := "MB"
	PrintMemUsageFormat(m1, m2, conv, convStr)
}

func PrintMemUsageFormat(m1 *runtime.MemStats, m2 *runtime.MemStats, conv func(b uint64) uint64, convStr string) {
	fmt.Printf("Alloc = %v%v", conv(m1.Alloc-m2.Alloc), convStr)
	fmt.Printf("\tHeapAlloc = %v%v", conv(m1.HeapAlloc-m2.HeapAlloc), convStr)
	fmt.Printf("\tTotalAlloc = %v%v", conv(m1.TotalAlloc-m2.TotalAlloc), convStr)
	fmt.Printf("\tStackSys = %v%v", conv(m1.StackSys-m2.StackSys), convStr)
	fmt.Printf("\tSys = %v%v", conv(m1.Sys-m2.Sys), convStr)
	fmt.Printf("\tNumGC = %v\n", m1.NumGC-m2.NumGC)
}

func bytesToMB(b uint64) uint64 {
	return b / 1024 / 1024
}

func TestMap(t *testing.T) {
	runtime.GC()
	before := PrintMemUsage()
	l := make(map[string]*Price, 500000)
	runtime.GC()
	after := PrintMemUsage()
	PrintMemUsageArgs(after, before)
	fmt.Println(l)
}

func TestMap2(t *testing.T) {
	before := PrintMemUsage()
	l := make(map[string]*Price, 1)
	after := PrintMemUsage()
	PrintMemUsageFormat(after, before, func(u uint64) uint64 {
		return u
	}, "B")
	fmt.Println(l)
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
