package handlers

import (
	"github.com/gofiber/fiber/v2"
	"net/http"
)

func Ready(rw http.ResponseWriter, _ *http.Request) {
	rw.WriteHeader(200)
}

func ReadyFiber(ctx *fiber.Ctx) error {
	ctx.Response().SetStatusCode(200)
	return nil
}
