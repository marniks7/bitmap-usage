package main

import (
	"bitmap-usage/cache"
	cache64 "bitmap-usage/cache64"
	"bitmap-usage/handlers"
	handlersmap "bitmap-usage/handlers-map"
	handlersmap64 "bitmap-usage/handlers-map64"
	"bitmap-usage/handlers-roaring"
	handlersroaring64 "bitmap-usage/handlers-roaring64"
	handlerssroar "bitmap-usage/handlers-sroar"
	indexMap "bitmap-usage/index-map"
	indexmap64 "bitmap-usage/index-map64"
	"bitmap-usage/index-roaring"
	indexroaring64 "bitmap-usage/index-roaring64"
	indexsroar "bitmap-usage/index-sroar"
	"bitmap-usage/sample"
	sample64 "bitmap-usage/sample64"
	"context"
	"github.com/gofiber/fiber/v2"
	"github.com/gorilla/mux"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
	"github.com/ugorji/go/codec"
	"net/http"
	"net/http/pprof"
	"os"
	"os/signal"
	"runtime"
	"time"
)

var (
	addr         = getEnvOrDefault("ADDR", ":8091", "TCP Address")
	loggingLevel = getEnvOrDefault("LOGGING_LEVEL", "info", "Logging Level")
	roaring64    = getEnvOrDefault("ROARING64", "false", "Use roaring 64")
	sroar        = getEnvOrDefault("SROAR", "false", "Use 64 bit sroar")
	map64        = getEnvOrDefault("MAP64", "false", "Use 64 bit maps")
	turnOnFiber  = getEnvOrDefault("FIBER", "false", "Use Fiber framework")
)

func main() {
	Setup()
}

func Setup() {
	// create default logger
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr, TimeFormat: time.RFC3339})

	level, err := zerolog.ParseLevel(loggingLevel)
	if err != nil {
		log.Panic().Err(err).Msg("Unable to parse logging level")
		return
	}
	zerolog.SetGlobalLevel(level)

	var cs *cache.CatalogService
	var cs64 *cache64.CatalogService
	// create router
	r := mux.NewRouter()
	// create another router for fiber
	app := fiber.New()
	if "true" == roaring64 {
		log.Info().Msg("Use Roaring64")
		cs64 = cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
		err = sample64.GenerateTestData5Chars5Offerings(cs64)
		if err != nil {
			log.Panic().Err(err).Msg("Unable to GenerateTestData5Chars5Offerings")
			return
		}

		ind := indexroaring64.NewService(log.Logger)
		ind.IndexPrices(cs64.Catalog)

		as := handlersroaring64.NewBitmapAggregateService(log.Logger, cs64, ind)
		cs64.GeneratePricesByConditions()

		findPriceBy := r.Methods(http.MethodPost).Subrouter()
		findPriceBy.HandleFunc("/v1/search/bitmap/prices", as.FindPriceByX)

	} else if "true" == sroar {
		log.Info().Msg("Use Sroar")
		cs64 = cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
		err = sample64.GenerateTestData5Chars5Offerings(cs64)
		if err != nil {
			log.Panic().Err(err).Msg("Unable to GenerateTestData5Chars5Offerings")
			return
		}

		ind := indexsroar.NewService(log.Logger)
		ind.IndexPrices(cs64.Catalog)

		as := handlerssroar.NewBitmapAggregateService(log.Logger, cs64, ind)
		cs64.GeneratePricesByConditions()

		findPriceBy := r.Methods(http.MethodPost).Subrouter()
		findPriceBy.HandleFunc("/v1/search/bitmap/prices", as.FindPriceByX)

	} else {
		cs = cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
		err = sample.GenerateTestData5Chars5Offerings(cs)
		if err != nil {
			log.Panic().Err(err).Msg("Unable to GenerateTestData5Chars5Offerings")
			return
		}

		ind := indexroaring.NewService(log.Logger)
		ind.IndexPrices(cs.Catalog)

		as := handlersroaring.NewBitmapAggregateService(log.Logger, cs, ind)
		cs.GeneratePricesByConditions()

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

		as.Codec = new(codec.JsonHandle)
		as.Codec.ReaderBufferSize = 8192
		as.Codec.WriterBufferSize = 8192
		findPriceByUgorji := r.Methods(http.MethodPost).Subrouter()
		findPriceByUgorji.HandleFunc("/v1/search/bitmap/prices/ugorji", as.FindPriceByX_Ugorji)

		findProceByXJsoniter := r.Methods(http.MethodPost).Subrouter()
		findProceByXJsoniter.HandleFunc("/v1/search/bitmap/prices/jsoniter", as.FindPriceByXJsoniter)

		findProceByXFFJson := r.Methods(http.MethodPost).Subrouter()
		findProceByXFFJson.HandleFunc("/v1/search/bitmap/prices/ffjson", as.FindPriceByX_FFJson)

		findPriceBy := r.Methods(http.MethodPost).Subrouter()
		findPriceBy.HandleFunc("/v1/search/bitmap/prices", as.FindPriceByX)

		app.Post("/v1/search/bitmap/prices", as.FindPriceByX_Fiber)

		findPriceBulk := r.Methods(http.MethodPost).Subrouter()
		findPriceBulk.HandleFunc("/v1/search/bitmap/bulk/prices", as.FindPriceBulkByX)

		findPriceBulkv2 := r.Methods(http.MethodPost).Subrouter()
		findPriceBulkv2.HandleFunc("/v2/search/bitmap/bulk/prices", as.FindPriceBulkByXV2)

		findPriceBulkv3 := r.Methods(http.MethodPost).Subrouter()
		findPriceBulkv3.HandleFunc("/v3/search/bitmap/bulk/prices", as.FindPriceBulkByXV3)

		findPriceBulkv4 := r.Methods(http.MethodPost).Subrouter()
		findPriceBulkv4.HandleFunc("/v4/search/bitmap/bulk/prices", as.FindPriceBulkByXV4)

	}

	runtime.GC()

	if "true" == sroar || "true" == roaring64 {
		map64 = "true"
	}
	if "true" == map64 {
		log.Info().Msg("Use Map64")
		indMap := indexmap64.NewService(log.Logger)
		indMap.IndexPrices(cs64.Catalog)
		asMap := handlersmap64.NewMapAggregateService(log.Logger, cs64, indMap)

		mapFindPriceBy := r.Methods(http.MethodPost).Subrouter()
		mapFindPriceBy.HandleFunc("/v1/search/map/prices", asMap.FindPriceByX)
	} else {
		indMap := indexMap.NewService(log.Logger)
		indMap.IndexPrices(cs.Catalog)
		asMap := handlersmap.NewMapAggregateService(log.Logger, cs, indMap)

		app.Post("/v1/search/map/prices", asMap.FindPriceByX_Fiber)

		mapFindPriceBy := r.Methods(http.MethodPost).Subrouter()
		mapFindPriceBy.HandleFunc("/v1/search/map/prices", asMap.FindPriceByX)

		mapFindPriceByUgorji := r.Methods(http.MethodPost).Subrouter()
		mapFindPriceByUgorji.HandleFunc("/v1/search/map/prices/ugorji", asMap.FindPriceByXUgorji)

		mapFindPriceBulk := r.Methods(http.MethodPost).Subrouter()
		mapFindPriceBulk.HandleFunc("/v1/search/map/bulk/prices", asMap.FindPriceBulkByX)

		mapFindPriceBulkv2 := r.Methods(http.MethodPost).Subrouter()
		mapFindPriceBulkv2.HandleFunc("/v2/search/map/bulk/prices", asMap.FindPriceBulkByXV2)

		mapFindPriceBulkv3 := r.Methods(http.MethodPost).Subrouter()
		mapFindPriceBulkv3.HandleFunc("/v3/search/map/bulk/prices", asMap.FindPriceBulkByXV3)

		mapFindPriceBulkv4 := r.Methods(http.MethodPost).Subrouter()
		mapFindPriceBulkv4.HandleFunc("/v4/search/map/bulk/prices", asMap.FindPriceBulkByXV4)

	}

	health := r.Methods(http.MethodGet).Subrouter()
	health.HandleFunc("/health", handlers.Health)
	health.HandleFunc("/ready", handlers.Ready)
	//additional
	r.HandleFunc("/debug/pprof/gc", TriggerGC)
	// Register pprof handlers
	r.HandleFunc("/debug/pprof/", pprof.Index)
	r.HandleFunc("/debug/pprof/cmdline", pprof.Cmdline)
	r.HandleFunc("/debug/pprof/profile", pprof.Profile)
	r.HandleFunc("/debug/pprof/symbol", pprof.Symbol)
	r.HandleFunc("/debug/pprof/trace", pprof.Trace)
	r.Handle("/debug/pprof/heap", pprof.Handler("heap"))
	r.Handle("/debug/pprof/goroutine", pprof.Handler("goroutine"))
	r.Handle("/debug/pprof/threadcreate", pprof.Handler("threadcreate"))
	r.Handle("/debug/pprof/allocs", pprof.Handler("allocs"))
	r.Handle("/debug/pprof/block", pprof.Handler("block"))

	runtime.GC()
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
		if turnOnFiber == "true" {
			err = app.Listen(addr)
		} else {
			err = server.ListenAndServe()
		}

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
	//goland:noinspection GoVetLostCancel
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
//goland:noinspection GoUnusedParameter
func getEnvOrDefault(key string, def, description string) string {
	if getenv, ok := os.LookupEnv(key); ok {
		return getenv
	}
	return def
}

func TriggerGC(_ http.ResponseWriter, _ *http.Request) {
	runtime.GC()
}
