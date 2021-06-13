package benchmark

import (
	"fmt"
	"os"
	"os/exec"
	"runtime"
)

func ReadAndWritePprofTop(fileName, resultFileName string) {
	//Use "-nodefraction=0" to print everything (includes smallest allocations)
	cmd := exec.Command("go", "tool", "pprof", "-inuse_space", "-lines", "-text", fileName)
	stdout, err := cmd.Output()

	if err != nil {
		exitErr, isExitError := err.(*exec.ExitError)
		if isExitError {
			panic(string(exitErr.Stderr))
		} else {
			panic(err.Error())
		}

		return
	}
	topFile, err := os.Create(resultFileName)
	if err != nil {
		panic(err)
	}
	_, err = topFile.Write(stdout)
	if err != nil {
		panic(err)
	}
}

func ReadAndWritePprofTopWithInuseObjects(fileName, resultFileName string) {
	//Use "-nodefraction=0" to print everything (includes smallest allocations)
	cmd := exec.Command("go", "tool", "pprof", "-inuse_objects", "-lines", "-text", fileName)
	stdout, err := cmd.Output()

	if err != nil {
		exitErr, isExitError := err.(*exec.ExitError)
		if isExitError {
			panic(string(exitErr.Stderr))
		} else {
			panic(err.Error())
		}

		return
	}
	topFile, err := os.Create(resultFileName)
	if err != nil {
		panic(err)
	}
	_, err = topFile.Write(stdout)
	if err != nil {
		panic(err)
	}
}

func ReadMemStatsFuncWithGC(fnc func()) (*runtime.MemStats, *runtime.MemStats) {
	runtime.GC()
	runtime.GC()
	runtime.GC()
	before := ReadMemStats()
	fnc()
	runtime.GC()
	runtime.GC()
	runtime.GC()
	after := ReadMemStats()
	return after, before
}

// ReadMemStats see: https://golang.org/pkg/runtime/#MemStats
func ReadMemStats() *runtime.MemStats {
	var m runtime.MemStats
	runtime.ReadMemStats(&m)
	return &m
}

func PrintMemStats() *runtime.MemStats {
	var m runtime.MemStats
	runtime.ReadMemStats(&m)
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

func PrintMemStatsBetween(after, before *runtime.MemStats) {
	PrintMemStatsFormat(after, before, bytesToMBInt64, "MB")
}

func PrintMemStatsFormat(m1 *runtime.MemStats, m2 *runtime.MemStats, conv func(b int64) int64, convStr string) {
	fmt.Printf("Alloc = %v%v", conv(int64(m1.Alloc-m2.Alloc)), convStr)
	fmt.Printf("\tHeapAlloc = %v%v", conv(int64(m1.HeapAlloc-m2.HeapAlloc)), convStr)
	fmt.Printf("\tTotalAlloc = %v%v", conv(int64(m1.TotalAlloc-m2.TotalAlloc)), convStr)
	fmt.Printf("\tStackSys = %v%v", conv(int64(m1.StackSys-m2.StackSys)), convStr)
	fmt.Printf("\tSys = %v%v", conv(int64(m1.Sys-m2.Sys)), convStr)
	fmt.Printf("\tNumGC = %v\n", m1.NumGC-m2.NumGC)
}

func bytesToMB(b uint64) uint64 {
	return b / 1024 / 1024
}

func bytesToMBInt64(b int64) int64 {
	return b / 1024 / 1024
}
