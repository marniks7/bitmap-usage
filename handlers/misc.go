package handlers

import (
	"net/http"
	"runtime"
)

// TriggerGC execute GC, can be used for benchmarks without app re-run
func TriggerGC(_ http.ResponseWriter, _ *http.Request) {
	runtime.GC()
}
