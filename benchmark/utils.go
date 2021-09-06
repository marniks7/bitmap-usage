package benchmark

import (
	"bitmap-usage/misc"
	"fmt"
	"github.com/RoaringBitmap/roaring"
	"github.com/RoaringBitmap/roaring/roaring64"
	"os"
	"os/exec"
	"runtime"
)

func execute(cmd *exec.Cmd, resultFileName string) {
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

func PprofCpuAsSvg(fileName, resultFileName string) {
	cmd := exec.Command("go", "tool", "pprof", "-svg", fileName)
	execute(cmd, resultFileName)
}

func PprofCpuLinesAsSvg(fileName, resultFileName string) {
	cmd := exec.Command("go", "tool", "pprof", "-lines", "-svg", fileName)
	execute(cmd, resultFileName)
}

func PprofCpuAsText(fileName, resultFileName string) {
	cmd := exec.Command("go", "tool", "pprof", "-lines", "-text", fileName)
	execute(cmd, resultFileName)
}

func PprofInUseSpaceAsText(fileName, resultFileName string) {
	//Use "-nodefraction=0" to print everything (includes smallest allocations)
	cmd := exec.Command("go", "tool", "pprof", "-inuse_space", "-lines", "-text", fileName)
	execute(cmd, resultFileName)
}

func PprofInUseSpaceAsSvg(fileName, resultFileName string) {
	//Use "-nodefraction=0" to print everything (includes smallest allocations)
	cmd := exec.Command("go", "tool", "pprof", "-inuse_space", "-lines", "-svg", fileName)
	execute(cmd, resultFileName)
}

func PprofInuseObjectsAsText(fileName, resultFileName string) {
	//Use "-nodefraction=0" to print everything (includes smallest allocations)
	cmd := exec.Command("go", "tool", "pprof", "-inuse_objects", "-lines", "-text", fileName)
	execute(cmd, resultFileName)
}

func PprofTopAllocSpaceAsText(fileName, resultFileName string) {
	//Use "-nodefraction=0" to print everything (includes smallest allocations)
	cmd := exec.Command("go", "tool", "pprof", "-alloc_space", "-lines", "-text", fileName)
	execute(cmd, resultFileName)
}

func PprofTopAllocObjectsAsText(fileName, resultFileName string) {
	//Use "-nodefraction=0" to print everything (includes smallest allocations)
	cmd := exec.Command("go", "tool", "pprof", "-alloc_objects", "-lines", "-text", fileName)
	execute(cmd, resultFileName)
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
	fmt.Printf("Alloc = %v", misc.ConvertToHumanReadableSizeUint64(m.Alloc))
	fmt.Printf("\tHeapAlloc = %v", misc.ConvertToHumanReadableSizeUint64(m.HeapAlloc))
	fmt.Printf("\tTotalAlloc = %v", misc.ConvertToHumanReadableSizeUint64(m.TotalAlloc))
	fmt.Printf("\tStackSys = %v", misc.ConvertToHumanReadableSizeUint64(m.StackSys))
	fmt.Printf("\tSys = %v", misc.ConvertToHumanReadableSizeUint64(m.Sys))
	fmt.Printf("\tNumGC = %v\n", m.NumGC)
	//var mem syscall.Rusage
	//syscall.Getrusage(syscall.RUSAGE_SELF, &mem)
	//fmt.Println(mem.Maxrss)
	return &m
}

func PrintMemStatsBetween(after, before *runtime.MemStats) {
	PrintMemStatsFormat(after, before, misc.ConvertToHumanReadableSize)
}

func PrintMemStatsFormat(m1 *runtime.MemStats, m2 *runtime.MemStats, conv func(b int64) string) {
	fmt.Printf("Alloc = %v", conv(int64(m1.Alloc-m2.Alloc)))
	fmt.Printf("\tHeapAlloc = %v", conv(int64(m1.HeapAlloc-m2.HeapAlloc)))
	fmt.Printf("\tTotalAlloc = %v", conv(int64(m1.TotalAlloc-m2.TotalAlloc)))
	fmt.Printf("\tStackSys = %v", conv(int64(m1.StackSys-m2.StackSys)))
	fmt.Printf("\tSys = %v", conv(int64(m1.Sys-m2.Sys)))
	fmt.Printf("\tNumGC = %v\n", m1.NumGC-m2.NumGC)
}

func PrintBitmapStats64(f *os.File, ind []*roaring64.Bitmap, name string) ([]roaring.Statistics, uint64, uint64) {
	fmt.Fprint(f, name+" ==========================================================\n")
	var sInB uint64
	var sInBS uint64
	var stats []roaring.Statistics
	for i, bm := range ind {
		fmt.Fprintf(f, "========== %v ==========\n", i)
		fmt.Fprintf(f, "%+v\n", bm.Stats())
		stats = append(stats, bm.Stats())
		fmt.Fprintf(f, "SizeInBytes: %v\n", bm.GetSizeInBytes())
		sInB += bm.GetSizeInBytes()
		fmt.Fprintf(f, "SerializedSizeInBytes: %v\n", bm.GetSerializedSizeInBytes())
		sInBS += bm.GetSerializedSizeInBytes()
	}
	return stats, sInB, sInBS
}
