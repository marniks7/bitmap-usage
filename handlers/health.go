package handlers

import "net/http"

func Health(rw http.ResponseWriter, _ *http.Request) {
	rw.WriteHeader(200)
}
