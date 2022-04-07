package app

import (
	"bitmap-usage/benchmark/500k-large-groups/sample"
	"bitmap-usage/benchmark/500k-large-groups/sample64"
	"bitmap-usage/cache"
	"bitmap-usage/cache64"
	"bitmap-usage/handlers"
	handlerskelindar "bitmap-usage/handlers-kelindar"
	handlersmap "bitmap-usage/handlers-map"
	handlersmap64 "bitmap-usage/handlers-map64"
	handlersroaring "bitmap-usage/handlers-roaring"
	handlersroaring64 "bitmap-usage/handlers-roaring64"
	handlerssroar "bitmap-usage/handlers-sroar"
	indexkelindar "bitmap-usage/index-kelindar"
	indexMap "bitmap-usage/index-map"
	indexmap64 "bitmap-usage/index-map64"
	indexroaring "bitmap-usage/index-roaring"
	indexroaring64 "bitmap-usage/index-roaring64"
	indexsroar "bitmap-usage/index-sroar"
	"context"
	"github.com/gofiber/adaptor/v2"
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
	"strconv"
	"strings"
	"time"
)

var (
	addr                = getEnvOrDefault("ADDR", ":8091", "TCP Address")
	loggingLevel        = getEnvOrDefault("LOGGING_LEVEL", "info", "Logging Level")
	roaring32           = getEnvOrDefaultBool("ROARING32", true, "Use roaring 32, by default")
	map32               = getEnvOrDefaultBool("MAP32", true, "Use map 32, by default")
	roaring64           = getEnvOrDefaultBool("ROARING64", false, "Use roaring 64")
	sroar               = getEnvOrDefaultBool("SROAR", false, "Use 64 bit sroar")
	map64               = getEnvOrDefaultBool("MAP64", false, "Use 64 bit maps")
	kelindar32          = getEnvOrDefaultBool("KELINDAR32", false, "Use 32-bit kelindar bitmaps")
	useFiber            = getEnvOrDefaultBool("FIBER", false, "Use Fiber framework")
	fiberPrefork        = getEnvOrDefaultBool("FIBER_PREFORK", false, "Use Prefork for Fiber")
	optimizeBitmapStr   = getEnvOrDefaultBool("BITMAP_OPT_STR", true, "Optimize Bitmap Structure")
	optimizeBitmapStats = getEnvOrDefaultBool("BITMAP_OPT_STATS", false, "Optimize Bitmap based on statistic")
)

func StartApp() {
	// create default logger
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stdout, TimeFormat: time.RFC3339})

	level, err := zerolog.ParseLevel(loggingLevel)
	if err != nil {
		log.Panic().Err(err).Msg("Unable to parse logging level")
		return
	}
	zerolog.SetGlobalLevel(level)
	if sroar || roaring64 {
		map64 = true
		map32 = false
		roaring32 = false
	}
	//fail fast init part
	goGCInt := getGOGC(err)

	cs := cache.NewCatalogService(cache.NewCatalog())
	cs64 := cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
	sampleService := sample.Service{Cs: cs}
	// create router
	r := mux.NewRouter()

	app := fiber.New(fiber.Config{ //make sure it is synced with http.Server below
		ReadTimeout:  10 * time.Minute,
		WriteTimeout: 1 * time.Minute,
		IdleTimeout:  120 * time.Second,
		Prefork:      fiberPrefork,
	})
	if roaring64 {
		log.Info().Msg("Use Roaring64")
		err = sample64.GenerateTestData5Chars5Offerings(cs64)
		if err != nil {
			log.Panic().Err(err).Msg("Unable to GenerateTestData5Chars50Offerings")
			return
		}

		ind := indexroaring64.NewService(log.Logger)
		ind.IndexPrices(cs64.Catalog)

		as := handlersroaring64.NewBitmapAggregateService(log.Logger, cs64, ind)
		cs64.GeneratePricesByConditions()

		findPriceBy := r.Methods(http.MethodPost).Subrouter()
		findPriceBy.HandleFunc("/v1/search/bitmap/prices", as.FindPriceByX)

	} else if sroar {
		log.Info().Msg("Use Sroar64")
		err = sample64.GenerateTestData5Chars5Offerings(cs64)
		if err != nil {
			log.Panic().Err(err).Msg("Unable to GenerateTestData5Chars50Offerings")
			return
		}

		ind := indexsroar.NewService(log.Logger)
		ind.IndexPrices(cs64.Catalog)

		as := handlerssroar.NewBitmapAggregateService(log.Logger, cs64, ind)
		cs64.GeneratePricesByConditions()

		findPriceBy := r.Methods(http.MethodPost).Subrouter()
		findPriceBy.HandleFunc("/v1/search/bitmap/prices", as.FindPriceByX)

	} else if kelindar32 {
		log.Info().Msg("Use Kelindar32")
		err = sampleService.GenerateTestData5Chars50Offerings()

		//index
		indexer := indexkelindar.NewHolder(log.Logger)
		err = indexer.IndexPricesV2(cs.Catalog)
		if err != nil {
			panic(err)
		}

		as := handlerskelindar.NewBitmapAggregateService(log.Logger, cs, indexer)
		cs.GeneratePricesByConditions()

		app.Post("/v1/search/kelindar/prices", as.FindPriceByX_Fiber)
	} else {
		log.Info().Msg("Use Roaring32")
		err = sampleService.GenerateTestData5Chars50Offerings()
		if err != nil {
			log.Panic().Err(err).Msg("Unable to GenerateTestData5Chars50Offerings")
			return
		}

		ind := indexroaring.NewService(log.Logger)
		ind.IndexPrices(cs.Catalog)

		as := handlersroaring.NewBitmapAggregateService(log.Logger, cs, ind)
		cs.GeneratePricesByConditions()
		if optimizeBitmapStr {
			log.Info().Msg("Optimize Bitmap Structure")
			err = ind.RunOptimizeBitmapsInternalStructure()
			if err != nil {
				log.Panic().Err(err).Msg("Unable to RunOptimizeBitmapsInternalStructure")
				return
			}
		}

		if optimizeBitmapStats {
			log.Info().Msg("Optimize Bitmap based on statistic")
			_, err = ind.RunOptimizeBasedOnStats()
			if err != nil {
				log.Panic().Err(err).Msg("Unable to RunOptimizeBasedOnStats")
				return
			}
		}

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

		app.Post("/v1/search/bitmap/prices/ugorji", as.FindPriceByX_Ugorji_FIber)

		findProceByXJsoniter := r.Methods(http.MethodPost).Subrouter()
		findProceByXJsoniter.HandleFunc("/v1/search/bitmap/prices/jsoniter", as.FindPriceByXJsoniter)

		findPriceBy := r.Methods(http.MethodPost).Subrouter()
		findPriceBy.HandleFunc("/v1/search/bitmap/prices", as.FindPriceByX)

		app.Post("/v1/search/bitmap/prices", as.FindPriceByX_Fiber)

		findPriceBulk := r.Methods(http.MethodPost).Subrouter()
		findPriceBulk.HandleFunc("/v1/search/bitmap/bulk/prices", as.FindPriceBulkByX)

		findPriceBulkv2 := r.Methods(http.MethodPost).Subrouter()
		findPriceBulkv2.HandleFunc("/v2/search/bitmap/bulk/prices", as.FindPriceBulkByXV2)

		findPriceBulkv4 := r.Methods(http.MethodPost).Subrouter()
		findPriceBulkv4.HandleFunc("/v4/search/bitmap/bulk/prices", as.FindPriceBulkByXV4)

		findPriceBulkv5 := r.Methods(http.MethodPost).Subrouter()
		findPriceBulkv5.HandleFunc("/v5/search/bitmap/bulk/prices", as.FindPriceBulkByXV5)

		app.Post("/v4/search/bitmap/bulk/prices", as.FindPriceBulkByXV4_Fiber)
		app.Post("/v4/search/bitmap/bulk/prices/ugorji", as.FindPriceBulkByXV4_Ugorji_Fiber)
		app.Post("/v5/search/bitmap/bulk/prices", adaptor.HTTPHandlerFunc(as.FindPriceBulkByXV5))
	}

	runtime.GC()

	if map64 {
		log.Info().Msg("Use Map64")
		indMap := indexmap64.NewService(log.Logger)
		indMap.IndexPrices(cs64.Catalog)
		asMap := handlersmap64.NewMapAggregateService(log.Logger, cs64, indMap)

		mapFindPriceBy := r.Methods(http.MethodPost).Subrouter()
		mapFindPriceBy.HandleFunc("/v1/search/map/prices", asMap.FindPriceByX)
	} else {
		log.Info().Msg("Use Map32")
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

		mapFindPriceBulkv4 := r.Methods(http.MethodPost).Subrouter()
		mapFindPriceBulkv4.HandleFunc("/v4/search/map/bulk/prices", asMap.FindPriceBulkByXV4)
	}

	misc := r.Methods(http.MethodGet).Subrouter()
	app.Get("/health", adaptor.HTTPHandlerFunc(handlers.Health))
	app.Get("/ready", adaptor.HTTPHandlerFunc(handlers.Ready))
	app.Get("/info", adaptor.HTTPHandlerFunc(handlers.Info))
	misc.HandleFunc("/health", handlers.Health)
	misc.HandleFunc("/ready", handlers.Ready)
	misc.HandleFunc("/info", handlers.Info)

	handlers.AppInfoI = handlers.AppInfo{HttpServer: string(httpServerType()), Roaring32: roaring32,
		Map32: map32, Sroar: sroar, Roaring64: roaring64, Map64: map64,
		GOGC: goGCInt, GOMAXPROCS: runtime.GOMAXPROCS(0)}

	//additional
	r.HandleFunc("/debug/pprof/gc", handlers.TriggerGC)
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

	app.All("/debug/pprof/gc", adaptor.HTTPHandlerFunc(handlers.TriggerGC))
	app.All("/debug/pprof/", adaptor.HTTPHandlerFunc(pprof.Index))
	app.All("/debug/pprof/cmdline", adaptor.HTTPHandlerFunc(pprof.Cmdline))
	app.All("/debug/pprof/profile", adaptor.HTTPHandlerFunc(pprof.Profile))
	app.All("/debug/pprof/symbol", adaptor.HTTPHandlerFunc(pprof.Symbol))
	app.All("/debug/pprof/trace", adaptor.HTTPHandlerFunc(pprof.Trace))
	app.All("/debug/pprof/heap", adaptor.HTTPHandler(pprof.Handler("heap")))
	app.All("/debug/pprof/goroutine", adaptor.HTTPHandler(pprof.Handler("goroutine")))
	app.All("/debug/pprof/threadcreate", adaptor.HTTPHandler(pprof.Handler("threadcreate")))
	app.All("/debug/pprof/allocs", adaptor.HTTPHandler(pprof.Handler("allocs")))
	app.All("/debug/pprof/block", adaptor.HTTPHandler(pprof.Handler("block")))

	runtime.GC()
	server := &http.Server{Addr: addr,
		Handler:           r,
		ReadTimeout:       10 * time.Minute,
		ReadHeaderTimeout: 5 * time.Second,
		WriteTimeout:      1 * time.Minute,
		IdleTimeout:       120 * time.Second,
	}

	// receiving the signal from OS for graceful shutdown
	signals := make(chan os.Signal)

	log.Info().Str("impl", string(httpServerType())).Msg("Http Server")
	if useFiber {
		if fiberPrefork {
			log.Info().Msg("Use Fiber Prefork")
		}
	}
	//start server in separate goroutine
	go func() {
		log.Info().Str("addr", addr).Msg("Starting server")
		if useFiber {
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

	if useFiber {
		err = app.Shutdown()
	} else {
		err = server.Shutdown(timeout)
	}

	if err != nil {
		if err != http.ErrServerClosed {
			log.Err(err).Msg("Unable to shutdown server")
		}
	}
}

func getGOGC(err error) int {
	goGcEnv := os.Getenv("GOGC")
	var goGCInt int
	if goGcEnv != "" {
		if strings.ToLower(goGcEnv) == "off" {
			goGCInt = -1
		} else {
			goGCInt, err = strconv.Atoi(goGcEnv)
			if err != nil {
				panic(err)
			}
		}
	} else {
		goGCInt = 100 // default GOGC as of go 1.16
	}
	return goGCInt
}

// httpServerType - part of app ino
func httpServerType() handlers.HttpServerType {
	var httpServer handlers.HttpServerType
	if useFiber {
		httpServer = handlers.FiberServer
	} else {
		httpServer = handlers.DefaultServer
	}
	return httpServer
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

// getEnvOrDefaultBool wrapper to provide ability to parse bool or return default value if not found
// behavior is similar to flags
// panic if provided non-boolean value
//goland:noinspection GoUnusedParameter
func getEnvOrDefaultBool(key string, def bool, description string) bool {
	if getenv, ok := os.LookupEnv(key); ok {
		boolValue, err := strconv.ParseBool(getenv)
		if err != nil {
			panic(err)
		}
		return boolValue
	}
	return def
}
