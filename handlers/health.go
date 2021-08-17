package handlers

import "net/http"

// Health - Liveness probe
func Health(rw http.ResponseWriter, _ *http.Request) {
	rw.WriteHeader(200)
}

/*func HealthFiber(ctx *fiber.Ctx) error {
	ctx.Response().SetStatusCode(200)
	return nil
}*/
