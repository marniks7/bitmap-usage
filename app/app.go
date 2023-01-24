package app

import (
	"bitmap-usage/benchmark/sample64"
	"bitmap-usage/benchmark/samplev2"
	"bitmap-usage/cache"
	"bitmap-usage/cache64"
	"bitmap-usage/handlers"
	"context"
	"github.com/gofiber/fiber/v2"
	"github.com/gorilla/mux"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
	"net/http"
	"os"
	"os/signal"
	"runtime"
	"strconv"
	"strings"
	"sync"
	"syscall"
	"time"
)

var (
	addr                = getEnvOrDefault("ADDR", ":8091", "TCP Address")
	loggingLevel        = getEnvOrDefault("LOGGING_LEVEL", "info", "Logging Level")
	roaring32           = getEnvOrDefaultBool("ROARING32", false, "Use roaring 32, by default")
	roaring64           = getEnvOrDefaultBool("ROARING64", false, "Use roaring 64")
	map32               = getEnvOrDefaultBool("MAP32", false, "Use map 32, by default")
	map64               = getEnvOrDefaultBool("MAP64", false, "Use 64 bit maps")
	sroar64             = getEnvOrDefaultBool("SROAR", false, "Use 64 bit sroar")
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
	//fail fast init part
	goGCInt := getGOGC(err)

	cs := cache.NewCatalogService(cache.NewCatalog())
	cs64 := cache64.NewCatalogService(cache64.NewCatalog())
	sampleService := samplev2.Service{Cs: cs}
	sampleService64 := sample64.Service{Cs: cs64}
	// create router
	r := mux.NewRouter()

	app := fiber.New(fiber.Config{ //make sure it is synced with http.Server below
		ReadTimeout:  120 * time.Second,
		WriteTimeout: 1 * time.Minute,
		IdleTimeout:  120 * time.Second,
		Prefork:      fiberPrefork,
	})

	if roaring32 || map32 || kelindar32 {
		err := sampleService.GenerateTestData5Chars50Offerings()
		if err != nil {
			panic(err)
		}
	} else if roaring64 || map64 || sroar64 {
		err := sampleService64.GenerateTestData5Chars50Offerings()
		if err != nil {
			panic(err)
		}
	} else {
		panic("No bitmap or map specified")
	}

	if roaring64 {
		err := roaring64Routes(cs64, r, app)
		if err != nil {
			panic(err)
		}
	} else if sroar64 {
		err := sroar64Routes(cs64, r, app)
		if err != nil {
			panic(err)
		}
	} else if kelindar32 {
		err := kelindar32Routes(cs, r, app)
		if err != nil {
			panic(err)
		}
	} else if roaring32 {
		err := roaring32Routes(cs, r, app)
		if err != nil {
			panic(err)
		}
	} else if map64 {
		err := map64Routes(cs64, r, app)
		if err != nil {
			panic(err)
		}
	} else if map32 {
		err := map32Routes(cs, r, app)
		if err != nil {
			panic(err)
		}
	} else {
		panic("No bitmap or map specified")
	}

	runtime.GC()

	commonRoutes(app, r)

	handlers.AppInfoI = handlers.AppInfo{HttpServer: string(httpServerType()), Roaring32: roaring32,
		Map32: map32, Sroar: sroar64, Roaring64: roaring64, Map64: map64,
		GOGC: goGCInt, GOMAXPROCS: runtime.GOMAXPROCS(0)}

	log.Info().Str("Version", runtime.Version()).
		Int("GOMAXPROCS", runtime.GOMAXPROCS(0)).
		Int("GOGC", goGCInt).
		Str("GOMEMLIMIT", os.Getenv("GOMEMLIMIT")).
		Msg("Go Runtime")
	pprofRoutes(r, app)

	runtime.GC()
	server := &http.Server{Addr: addr,
		Handler:           r,
		ReadTimeout:       10 * time.Minute,
		ReadHeaderTimeout: 5 * time.Second,
		WriteTimeout:      1 * time.Minute,
		IdleTimeout:       120 * time.Second,
	}

	log.Info().Str("impl", string(httpServerType())).Msg("Http Server")
	if useFiber {
		if fiberPrefork {
			log.Info().Msg("Use Fiber Prefork")
		}
	}

	gsCtx, stop := signal.NotifyContext(context.Background(), syscall.SIGTERM, os.Interrupt)
	defer stop()

	var gsWg sync.WaitGroup
	if useFiber {
		setupFiberHttpServerShutdown(app, gsCtx, &gsWg)
	} else {
		setupHttpServerShutdown(server, gsCtx, &gsWg)
	}
	if useFiber {
		err = app.Listen(addr)
		if err != nil {
			if err == http.ErrServerClosed {
				log.Info().Msg("ServerHandlers is shutdown already")
			} else {
				log.Err(err).Msg("Problem occurred during server startup")
			}
			//in case if error occurred during the start of web server - make sure the application shutdown gracefully
			//another option is to call panic, but there maybe jobs already in-progress
			stop()
		}
	} else {
		err = server.ListenAndServe()
		if err != nil {
			if err == http.ErrServerClosed {
				log.Info().Msg("ServerHandlers is shutdown already")
			} else {
				log.Err(err).Msg("Problem occurred during server startup")
			}
			//in case if error occurred during the start of web server - make sure the application shutdown gracefully
			//another option is to call panic, but there maybe jobs already in-progress
			stop()
		}
	}
	//part of graceful shutdown - wait for all goroutines to execute there graceful shutdown
	gsWg.Wait()
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
//
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
//
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

// setupFiberHttpServerShutdown - graceful shutdown implementation
func setupHttpServerShutdown(httpServer *http.Server, gsCtx context.Context, gsWg *sync.WaitGroup) {
	gsWg.Add(1)
	go func(gsCtx context.Context, gsWg *sync.WaitGroup) {
		defer gsWg.Done()
		<-gsCtx.Done()
		log.Info().Msg("Received terminate, graceful shutdown...")
		// graceful shutdown
		err := httpServer.Shutdown(gsCtx)
		if err != nil {
			if err == http.ErrServerClosed {
				log.Info().Msg("ServerHandlers is shutdown already")
			} else {
				log.Err(err).Msg("Problem occurred during server shutdown")
			}
		}

	}(gsCtx, gsWg)
}

// setupHttpServerShutdown - graceful shutdown implementation
func setupFiberHttpServerShutdown(app *fiber.App, gsCtx context.Context, gsWg *sync.WaitGroup) {
	gsWg.Add(1)
	go func(gsCtx context.Context, gsWg *sync.WaitGroup) {
		defer gsWg.Done()
		<-gsCtx.Done()
		log.Info().Msg("Received terminate, graceful shutdown...")
		// graceful shutdown
		err := app.Shutdown()
		if err != nil {
			if err == http.ErrServerClosed {
				log.Info().Msg("ServerHandlers is shutdown already")
			} else {
				log.Err(err).Msg("Problem occurred during server shutdown")
			}
		}
		log.Info().Msg("Fiber http server shutdown is finished")

	}(gsCtx, gsWg)
}
