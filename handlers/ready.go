package handlers

import "net/http"

func Ready(rw http.ResponseWriter, _ *http.Request) {
	rw.WriteHeader(200)
}
