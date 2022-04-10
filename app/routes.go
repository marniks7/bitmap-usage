package app

import (
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
	"github.com/gofiber/adaptor/v2"
	"github.com/gofiber/fiber/v2"
	"github.com/gorilla/mux"
	"github.com/rs/zerolog/log"
	"github.com/ugorji/go/codec"
	"net/http"
	"net/http/pprof"
)

func map64Routes(cs64 *cache64.CatalogService, r *mux.Router, app *fiber.App) error {
	log.Info().Msg("Use Map64")
	indMap := indexmap64.NewService()
	indMap.IndexPrices(cs64.Catalog)
	asMap := handlersmap64.NewMapAggregateService(log.Logger, cs64, indMap)

	mapFindPriceBy := r.Methods(http.MethodPost).Subrouter()
	mapFindPriceBy.HandleFunc("/v1/search/map/prices", asMap.FindPriceByX)

	app.Post("/v1/search/map/prices", adaptor.HTTPHandlerFunc(asMap.FindPriceByX))
	return nil
}

func map32Routes(cs *cache.CatalogService, r *mux.Router, app *fiber.App) error {
	log.Info().Msg("Use Map32")
	indMap := indexMap.NewService()
	indMap.IndexPrices(cs.Catalog)
	asMap := handlersmap.NewMapAggregateService(cs, indMap)

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

	app.Post("/v1/search/map/prices", asMap.FindPriceByX_Fiber)
	app.Post("/v4/search/map/bulk/prices", adaptor.HTTPHandlerFunc(asMap.FindPriceBulkByXV4))
	return nil
}

func roaring32Routes(cs *cache.CatalogService, r *mux.Router, app *fiber.App) error {
	log.Info().Msg("Use Roaring32")
	ind := indexroaring.NewService()
	ind.IndexPrices(cs.Catalog)

	as := handlersroaring.NewBitmapAggregateService(cs, ind)
	cs.GeneratePricesByConditionsAndClear()
	if optimizeBitmapStr {
		log.Info().Msg("Optimize Bitmap Structure")
		err := ind.RunOptimizeBitmapsInternalStructure()
		if err != nil {
			log.Panic().Err(err).Msg("Unable to RunOptimizeBitmapsInternalStructure")
			return err
		}
	}

	if optimizeBitmapStats {
		log.Info().Msg("Optimize Bitmap based on statistic")
		_, err := ind.RunOptimizeBasedOnStats()
		if err != nil {
			log.Panic().Err(err).Msg("Unable to RunOptimizeBasedOnStats")
			return err
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

	findProceByXJsoniter := r.Methods(http.MethodPost).Subrouter()
	findProceByXJsoniter.HandleFunc("/v1/search/bitmap/prices/jsoniter", as.FindPriceByXJsoniter)

	findPriceBy := r.Methods(http.MethodPost).Subrouter()
	findPriceBy.HandleFunc("/v1/search/bitmap/prices", as.FindPriceByX)

	findPriceBulk := r.Methods(http.MethodPost).Subrouter()
	findPriceBulk.HandleFunc("/v1/search/bitmap/bulk/prices", as.FindPriceBulkByX)

	findPriceBulkv2 := r.Methods(http.MethodPost).Subrouter()
	findPriceBulkv2.HandleFunc("/v2/search/bitmap/bulk/prices", as.FindPriceBulkByXV2)

	findPriceBulkv4 := r.Methods(http.MethodPost).Subrouter()
	findPriceBulkv4.HandleFunc("/v4/search/bitmap/bulk/prices", as.FindPriceBulkByXV4)

	findPriceBulkv5 := r.Methods(http.MethodPost).Subrouter()
	findPriceBulkv5.HandleFunc("/v5/search/bitmap/bulk/prices", as.FindPriceBulkByXV5)

	app.Post("/v1/search/bitmap/prices", as.FindPriceByX_Fiber)
	app.Post("/v1/search/bitmap/prices/ugorji", as.FindPriceByX_Ugorji_FIber)
	app.Post("/v2/search/bitmap/bulk/prices", adaptor.HTTPHandlerFunc(as.FindPriceBulkByXV2))
	app.Post("/v4/search/bitmap/bulk/prices", adaptor.HTTPHandlerFunc(as.FindPriceBulkByXV4))
	app.Post("/v4/search/bitmap/bulk/prices/ugorji", as.FindPriceBulkByXV4_Ugorji_Fiber)
	app.Post("/v5/search/bitmap/bulk/prices", adaptor.HTTPHandlerFunc(as.FindPriceBulkByXV5))
	return nil
}

func kelindar32Routes(cs *cache.CatalogService, r *mux.Router, app *fiber.App) error {
	log.Info().Msg("Use Kelindar32")
	//index
	indexer := indexkelindar.NewHolder()
	err := indexer.IndexPricesV2(cs.Catalog)
	if err != nil {
		panic(err)
	}

	as := handlerskelindar.NewBitmapAggregateService(cs, indexer)
	cs.GeneratePricesByConditions()

	findPriceBy := r.Methods(http.MethodPost).Subrouter()
	findPriceBy.HandleFunc("/v1/search/kelindar/prices", as.FindPriceByX)

	app.Post("/v1/search/kelindar/prices", adaptor.HTTPHandlerFunc(as.FindPriceByX))
	return err
}

func sroar64Routes(cs64 *cache64.CatalogService, r *mux.Router, app *fiber.App) error {
	log.Info().Msg("Use Sroar64")

	ind := indexsroar.NewService()
	ind.IndexPrices(cs64.Catalog)

	as := handlerssroar.NewBitmapAggregateService(cs64, ind)
	cs64.GeneratePricesByConditionsAndClear()

	findPriceBy := r.Methods(http.MethodPost).Subrouter()
	findPriceBy.HandleFunc("/v1/search/bitmap/prices", as.FindPriceByX)

	app.Post("/v1/search/bitmap/prices", adaptor.HTTPHandlerFunc(as.FindPriceByX))
	return nil
}

func roaring64Routes(cs64 *cache64.CatalogService, r *mux.Router, app *fiber.App) error {
	log.Info().Msg("Use Roaring64")

	ind := indexroaring64.NewService()
	ind.IndexPrices(cs64.Catalog)

	as := handlersroaring64.NewBitmapAggregateService(cs64, ind)
	cs64.GeneratePricesByConditionsAndClear()

	findPriceBy := r.Methods(http.MethodPost).Subrouter()
	findPriceBy.HandleFunc("/v1/search/bitmap/prices", as.FindPriceByX)

	app.Post("/v1/search/bitmap/prices", adaptor.HTTPHandlerFunc(as.FindPriceByX))
	return nil
}

func commonRoutes(app *fiber.App, r *mux.Router) {
	app.Get("/health", adaptor.HTTPHandlerFunc(handlers.Health))
	app.Get("/ready", adaptor.HTTPHandlerFunc(handlers.Ready))
	app.Get("/info", adaptor.HTTPHandlerFunc(handlers.Info))
	misc := r.Methods(http.MethodGet).Subrouter()
	misc.HandleFunc("/health", handlers.Health)
	misc.HandleFunc("/ready", handlers.Ready)
	misc.HandleFunc("/info", handlers.Info)
}

func pprofRoutes(r *mux.Router, app *fiber.App) {
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
}
