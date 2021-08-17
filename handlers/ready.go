package handlers

import (
	"net/http"
)

// Ready - Readiness probe
func Ready(rw http.ResponseWriter, _ *http.Request) {
	rw.WriteHeader(200)
}

//
//func ReadyFiber(ctx *fiber.Ctx) error {
//	ctx.Response().SetStatusCode(200)
//	return nil
//}
