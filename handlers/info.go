package handlers

import (
	"encoding/json"
	"github.com/rs/zerolog/log"
	"io"
	"net/http"
)

type HttpServerType string

const (
	DefaultServer HttpServerType = "Default"
	FiberServer   HttpServerType = "Fiber"
)

type AppInfo struct {
	HttpServer string //Default, Fiber
	Roaring32  bool
	Map32      bool
	Sroar      bool
	Roaring64  bool
	Map64      bool
	GOGC       int
	GOMAXPROCS int
}

var AppInfoI AppInfo

func Info(rw http.ResponseWriter, r *http.Request) {
	rw.WriteHeader(200)

	err := printInfo(rw)
	if err != nil {
		http.Error(rw, "Internal Server Error", http.StatusInternalServerError)
		return
	}
}

func printInfo(rw io.Writer) error {
	encoder := json.NewEncoder(rw)
	encoder.SetIndent("", "  ")
	err := encoder.Encode(AppInfoI)
	if err != nil {
		log.Err(err).Msg("Unable to encode")
		return err

	}
	return err
}

//func InfoFiber(ctx *fiber.Ctx) error {
//	ctx.Response().SetStatusCode(200)
//
//	err := printInfo(ctx.Response().BodyWriter())
//	if err != nil {
//		ctx.Response().SetStatusCode(http.StatusInternalServerError)
//	}
//	return nil
//}
