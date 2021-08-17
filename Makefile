# -----------------------------------------------------------------------------
# Main App Configuration
# -----------------------------------------------------------------------------
APP_PROTOCOL = http
APP_HOST = 127.0.0.1
APP_PORT = 8091
# -----------------------------------------------------------------------------
# App different supported options
# -----------------------------------------------------------------------------
FIBER = false
SROAR = false
ROARING64 = false
MAP64 = false
APP_CMD =# whatever command to add to run
APP_DOCKER_CMD =# whatever command to add to Docker run
# -----------------------------------------------------------------------------
# App performance configuration
# -----------------------------------------------------------------------------
GOGC = 1000
GOMAXPROCS = 2# used for Go runtime and for Docker as well
# -----------------------------------------------------------------------------
# API urls
# -----------------------------------------------------------------------------
APP_API_PART = bitmap# could be 'bitmap' or 'map'. Used in URL
APP_API = v1/search/${APP_API_PART}/prices
APP_BULK_API = /v4/search/${APP_API_PART}/bulk/prices
# -----------------------------------------------------------------------------
# WRK Configuration (used for WRK2 as well)
# -----------------------------------------------------------------------------
WRK_DURATION = 30s
WRK_THREADS = 1
WRK_CONNECTIONS = 1
WRK_REQUEST = sample/wrk-search-price-request.lua# used in main runner
WRK_FILENAME_PART = ${APP_API_PART}# first part of filename with results
WRK2_RATE = 2000
# -----------------------------------------------------------------------------
# AB Configuration
# -----------------------------------------------------------------------------
# Number of multiple requests to make at a time
AB_CONCURRENCY = 1
AB_REQUESTS_NUMBER = 1000# Number of requests to perform
AB_REQUEST = sample/search-price-request.json# used in main runner
AB_BULK_REQUEST = sample/search-price-bulk-request-10000.json
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# Main: build, run, test
# -----------------------------------------------------------------------------
export#this export is used to pass all variables to sub-make (along with '-e' command to pass target-specific)
MAKE = make --no-print-directory
.PHONY: clean trigger-gc
.DEFAULT_GOAL := build
# Set source dir and scan source dir for all go files
build:
	go generate ./...
	go build .
run:
	GOMAXPROCS=${GOMAXPROCS} GOGC=${GOGC} FIBER=${FIBER} SROAR=${SROAR} ROARING64=${ROARING64} MAP64=${MAP64} ${APP_CMD} ADDR=:${APP_PORT} ./bitmap-usage
run-64: ROARING64=true
run-64: MAP64=true
run-64:
	$(MAKE) -e run
run-sroar: SROAR=true
run-sroar: MAP64=true
run-sroar:
	$(MAKE) -e run
# Fiber is best option
run-fiber: FIBER=true
run-fiber:
	$(MAKE) -e run
run-profile-gc: APP_CMD=GODEBUG=gctrace=1
run-profile-gc:
	$(MAKE) -e run
run-no-gc: GOGC=off
run-no-gc:
	$(MAKE) -e run
test:
	go test -covermode=count -coverprofile=coverprofile.out ./... -short
test-cover:
	go tool cover -html=coverprofile.out
# -----------------------------------------------------------------------------
# Docker
# -----------------------------------------------------------------------------
docker:
	docker build . -t bitmap-usage
docker-run:
	docker run -p ${APP_PORT}:8080 --cpus=${GOMAXPROCS} --env GOMAXPROCS=${GOMAXPROCS} \
		--env GOGC=${GOGC} --env FIBER=${FIBER} --env SROAR=${SROAR} \
		--env ROARING64=${ROARING64} --env MAP64=${MAP64} ${APP_DOCKER_CMD} bitmap-usage
docker-run-profile-gc: APP_DOCKER_CMD=--env GODEBUG=gctrace=1
docker-run-profile-gc:
	$(MAKE) -e docker-run
# -----------------------------------------------------------------------------
# Go Benchmarks
# -----------------------------------------------------------------------------
bench: bench-32 bench-64 bench-sroar bench-memory bench-memory-sroar
bench-32:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k/... -bench . -run ^$$ -cpu 1 -benchmem -failfast \
		| tee benchmark/Prices-487k-PricesPerOffering-9.7k/benchmark-results.txt
bench-64:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k-64/... -bench . -run ^$$ -cpu 1 -benchmem -failfast \
		| tee benchmark/Prices-487k-PricesPerOffering-9.7k-64/benchmark-results.txt
bench-sroar:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k-sroar/... -bench . -run ^$$ -cpu 1 -benchmem -failfast \
 		| tee benchmark/Prices-487k-PricesPerOffering-9.7k-sroar/benchmark-results.txt
bench-memory:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k/... . -failfast -test.memprofilerate=1
bench-memory-sroar:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k-sroar/... . -failfast -test.memprofilerate=1
# -----------------------------------------------------------------------------
# WRK tool for performance measurement https://github.com/wg/wrk (the only one for microsecond results)
# -----------------------------------------------------------------------------
wrk-run:
	./wrk -t${WRK_THREADS} -c${WRK_CONNECTIONS} -d${WRK_DURATION} --latency -s ${WRK_REQUEST} \
		${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/${APP_API} -- \
		  benchmark/wrk/json/${WRK_FILENAME_PART}-t${WRK_THREADS}-c${WRK_CONNECTIONS}.json \
		  | tee benchmark/wrk/${APP_API_PART}-t${WRK_THREADS}-c${WRK_CONNECTIONS}.txt
wrk-map-t1-c1: WRK_THREADS = 1
wrk-map-t1-c1: WRK_CONNECTIONS = 1
wrk-map-t1-c1: APP_API_PART = map
wrk-map-t1-c1:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-map-t2-c20: WRK_THREADS = 2
wrk-map-t2-c20: WRK_CONNECTIONS = 20
wrk-map-t2-c20: APP_API_PART = map
wrk-map-t2-c20:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-bitmap-bulk-1000-t1-c1: WRK_THREADS=1
wrk-bitmap-bulk-1000-t1-c1: WRK_CONNECTIONS=1
wrk-bitmap-bulk-1000-t1-c1: WRK_REQUEST=sample/wrk-search-price-bulk-request-1000.lua
wrk-bitmap-bulk-1000-t1-c1: APP_API_PART=bitmap
wrk-bitmap-bulk-1000-t1-c1: APP_API=${APP_BULK_API}
wrk-bitmap-bulk-1000-t1-c1: WRK_FILENAME_PART=${APP_API_PART}-bulk-1000
wrk-bitmap-bulk-1000-t1-c1:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-bitmap-t1-c1: WRK_THREADS=1
wrk-bitmap-t1-c1: WRK_CONNECTIONS=1
wrk-bitmap-t1-c1: APP_API_PART=bitmap
wrk-bitmap-t1-c1:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-bitmap-t2-c20: WRK_THREADS=2
wrk-bitmap-t2-c20: WRK_CONNECTIONS=20
wrk-bitmap-t2-c20: APP_API_PART=bitmap
wrk-bitmap-t2-c20:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk: wrk-map-t1-c1 wrk-map-t2-c20 wrk-bitmap-t1-c1 wrk-bitmap-t2-c20
# -----------------------------------------------------------------------------
# WRK2 tool for performance measurement https://github.com/giltene/wrk2
# -----------------------------------------------------------------------------
wrk2-run:
	./wrk2 -t${WRK_THREADS} -c${WRK_CONNECTIONS} -d${WRK_DURATION} --latency -R${WRK2_RATE} \
		${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/${APP_API} \
    	-s ${WRK_REQUEST} -- benchmark/wrk2/json/${WRK_FILENAME_PART}-t${WRK_THREADS}-c${WRK_CONNECTIONS}-R${WRK2_RATE}.json \
    	| tee benchmark/wrk2/${APP_API_PART}-t${WRK_THREADS}-c${WRK_CONNECTIONS}-R${WRK2_RATE}.txt
wrk2-map-t1-c1: WRK_THREADS = 1
wrk2-map-t1-c1: WRK_CONNECTIONS = 1
wrk2-map-t1-c1: APP_API_PART = map
wrk2-map-t1-c1:
	$(MAKE) -e wrk2-run
	$(MAKE) trigger-gc
wrk2-map-t2-c20: WRK_THREADS=2
wrk2-map-t2-c20: WRK_CONNECTIONS=20
wrk2-map-t2-c20: APP_API_PART=map
wrk2-map-t2-c20:
	$(MAKE) -e wrk2-run
	$(MAKE) trigger-gc
wrk2-bitmap-bulk-1000-t1-c1: WRK_THREADS=1
wrk2-bitmap-bulk-1000-t1-c1: WRK_CONNECTIONS=1
wrk2-bitmap-bulk-1000-t1-c1: WRK_REQUEST=sample/wrk-search-price-bulk-request-1000.lua
wrk2-bitmap-bulk-1000-t1-c1: APP_API_PART=bitmap
wrk2-bitmap-bulk-1000-t1-c1: APP_API=${APP_BULK_API}
wrk2-bitmap-bulk-1000-t1-c1: WRK_FILENAME_PART=${APP_API_PART}-bulk-1000
wrk2-bitmap-bulk-1000-t1-c1:
	$(MAKE) -e wrk2-run
	$(MAKE) trigger-gc
wrk2-bitmap-t1-c1: WRK_THREADS=1
wrk2-bitmap-t1-c1: WRK_CONNECTIONS=1
wrk2-bitmap-t1-c1: APP_API_PART=bitmap
wrk2-bitmap-t1-c1:
	$(MAKE) -e wrk2-run
	$(MAKE) trigger-gc
wrk2-bitmap-t2-c20: WRK_THREADS=2
wrk2-bitmap-t2-c20: WRK_CONNECTIONS=20
wrk2-bitmap-t2-c20: APP_API_PART=bitmap
wrk2-bitmap-t2-c20:
	$(MAKE) -e wrk2-run
	$(MAKE) trigger-gc
wrk2: wrk2-map-t1-c1 wrk2-map-t2-c20 wrk2-bitmap-t1-c1 wrk2-bitmap-t2-c20
# -----------------------------------------------------------------------------
# Hey Tool for performance measurement (tested once) https://github.com/rakyll/hey
# -----------------------------------------------------------------------------
hey:
	hey -cpus 2 -c 200 -n 1000000 -m POST -D sample/search-price-request.json -T "application/json" \
 		${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/bitmap/prices
# -----------------------------------------------------------------------------
# AB Tool for performance measurement (used few times)
# -----------------------------------------------------------------------------
ab-run:
	ab -k -c ${AB_CONCURRENCY} -n ${AB_REQUESTS_NUMBER} -T application/json -p sample/search-price-request.json \
    		${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/${APP_API}
ab-bitmap-1: APP_API_PART=bitmap
ab-bitmap-1: AB_CONCURRENCY=1
ab-bitmap-1: AB_REQUESTS_NUMBER=1000
ab-bitmap-1:
	$(MAKE) -e ab-run
	$(MAKE) trigger-gc
ab-map-1: APP_API_PART=map
ab-map-1: AB_CONCURRENCY=1
ab-map-1: AB_REQUESTS_NUMBER=1000
ab-map-1:
	$(MAKE) -e ab-run
	$(MAKE) trigger-gc
ab-bitmap-20: APP_API_PART=bitmap
ab-bitmap-20: AB_CONCURRENCY=20
ab-bitmap-20: AB_REQUESTS_NUMBER=100000
ab-bitmap-20:
	$(MAKE) -e ab-run
	$(MAKE) trigger-gc
ab-map-20: APP_API_PART=map
ab-map-20: AB_CONCURRENCY=20
ab-map-20: AB_REQUESTS_NUMBER=100000
ab-map-20:
	$(MAKE) -e ab-run
	$(MAKE) trigger-gc
ab-bulk-bitmap-1: APP_API_PART=bitmap
ab-bulk-bitmap-1: APP_API=${APP_BULK_API}
ab-bulk-bitmap-1: AB_CONCURRENCY=1
ab-bulk-bitmap-1: AB_REQUESTS_NUMBER=100
ab-bulk-bitmap-1: AB_REQUEST=${AB_BULK_REQUEST}
ab-bulk-bitmap-1:
	$(MAKE) -e ab-run
	$(MAKE) trigger-gc
ab-bulk-map-1: APP_API_PART=map
ab-bulk-map-1: APP_API=${APP_BULK_API}
ab-bulk-map-1: AB_CONCURRENCY=1
ab-bulk-map-1: AB_REQUESTS_NUMBER=100
ab-bulk-map-1: AB_REQUEST=${AB_BULK_REQUEST}
ab-bulk-map-1:
	$(MAKE) -e ab-run
	$(MAKE) trigger-gc
ab:	ab-bitmap-1 ab-bitmap-20 ab-map-1 ab-map-20
# -----------------------------------------------------------------------------
# Utils
# -----------------------------------------------------------------------------
trigger-gc:
	curl ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/debug/pprof/gc && sleep 1
curl-info:
	curl ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/info
clean:
	rm bitmap-usage
# -----------------------------------------------------------------------------
# Performance Analyze
# -----------------------------------------------------------------------------
pprof-allocs: # Memory allocations profiler. Run test, wait till the end, run this command
	go tool pprof ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/debug/pprof/allocs
pprof-profile: # CPU profiler. Run it and run test
	go tool pprof ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/debug/pprof/profile
