package main

import (
	"bitmap-usage/cache"
	"bitmap-usage/handlers"
	"bitmap-usage/index"
	"bitmap-usage/sample"
	"context"
	"github.com/gorilla/mux"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
	"net/http"
	"net/http/pprof"
	_ "net/http/pprof"
	"os"
	"os/signal"
	"runtime"
	"time"
)

var (
	addr         = getEnvOrDefault("ADDR", ":8091", "TCP Address")
	loggingLevel = getEnvOrDefault("LOGGING_LEVEL", "info", "Logging Level")
)

func main() {
	Setup()
}

func Setup() {
	//ballast is 10MB
	//_ = make([]byte, 10 << 20)
	// create default logger
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr, TimeFormat: time.RFC3339})

	level, err := zerolog.ParseLevel(loggingLevel)
	if err != nil {
		log.Panic().Err(err).Msg("Unable to parse logging level")
		return
	}
	zerolog.SetGlobalLevel(level)

	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err = sample.GenerateTestData(cs)
	if err != nil {
		log.Panic().Err(err).Msg("Unable to GenerateTestData")
		return
	}

	ind := index.NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	as := handlers.NewAggregateService(log.Logger, cs, ind)
	cs.FinishInitialization()
	runtime.GC()

	//long-live workers
	go as.LongLiveWorker()
	go as.LongLiveWorker()
	go as.LongLiveWorker()
	go as.LongLiveWorker()
	go as.LongLiveWorker()
	//go cs.LongLiveWorker(cs.Ch, nil)
	//go cs.LongLiveWorker(cs.Ch, nil)
	//go cs.LongLiveWorker(cs.Ch, nil)
	//go cs.LongLiveWorker(cs.Ch, nil)
	//go cs.LongLiveWorker(cs.Ch, nil)
	//go cs.LongLiveWorker(cs.Ch, nil)
	//go cs.LongLiveWorker(cs.Ch, nil)
	//go cs.LongLiveWorker(cs.Ch, nil)

	// create router
	r := mux.NewRouter()
	findPriceBy := r.Methods(http.MethodPost).Subrouter()
	findPriceBy.HandleFunc("/v1/search/prices", as.FindPriceByX)

	findPriceBulk := r.Methods(http.MethodPost).Subrouter()
	findPriceBulk.HandleFunc("/v1/search/bulk/prices", as.FindPriceBulkByX)

	findPriceBulkv2 := r.Methods(http.MethodPost).Subrouter()
	findPriceBulkv2.HandleFunc("/v2/search/bulk/prices", as.FindPriceBulkByXV2)

	findPriceBulkv3 := r.Methods(http.MethodPost).Subrouter()
	findPriceBulkv3.HandleFunc("/v3/search/bulk/prices", as.FindPriceBulkByXV3)

	// Register pprof handlers
	r.HandleFunc("/debug/pprof/", pprof.Index)
	r.HandleFunc("/debug/pprof/cmdline", pprof.Cmdline)
	r.HandleFunc("/debug/pprof/profile", pprof.Profile)
	r.HandleFunc("/debug/pprof/symbol", pprof.Symbol)
	r.HandleFunc("/debug/pprof/trace", pprof.Trace)
	r.Handle("/debug/pprof/heap", pprof.Handler("heap"))
	r.Handle("/debug/pprof/goroutine", pprof.Handler("goroutine"))
	r.Handle("/debug/pprof/threadcreate", pprof.Handler("threadcreate"))
	r.Handle("/debug/pprof/block", pprof.Handler("block"))

	server := &http.Server{Addr: addr,
		Handler:           r,
		ReadTimeout:       10 * time.Minute,
		ReadHeaderTimeout: 5 * time.Second,
		WriteTimeout:      10 * time.Minute,
		IdleTimeout:       120 * time.Second,
	}

	// receiving the signal from OS for graceful shutdown
	signals := make(chan os.Signal)
	//start server in separate goroutine
	go func() {
		log.Info().Str("addr", addr).Msg("Starting server")
		err = server.ListenAndServe()
		if err != nil {
			if err == http.ErrServerClosed {
				log.Info().Msg("Server is shutdown")
			} else {
				log.Err(err).Msg("Unable to start server")
			}
			signals <- os.Kill
		}
	}()

	signal.Notify(signals, os.Interrupt)
	signal.Notify(signals, os.Kill)
	//blocks until receiving the signal
	sig := <-signals

	log.Info().Interface("sig", sig).Msg("Received terminate, graceful shutdown")
	// graceful shutdown timeout for transaction\calls finish (if any)
	timeout, _ := context.WithTimeout(context.Background(), 10*time.Second)

	err = server.Shutdown(timeout)

	if err != nil {
		if err != http.ErrServerClosed {
			log.Err(err).Msg("Unable to shutdown server")
		}
	}
}

// getEnvOrDefault wrapper to provide ability to return default value if not found
// behavior is similar to flags
func getEnvOrDefault(key string, def, description string) string {
	if getenv, ok := os.LookupEnv(key); ok {
		return getenv
	}
	return def
}
