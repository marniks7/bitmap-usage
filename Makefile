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
# IN_DOCKER used to tell that app is executed in docker (for saving results in separate folder)
# Provide on executing manually as `true`.
# Example: `make wrk -e IN_DOCKER=true`
IN_DOCKER =
# -----------------------------------------------------------------------------
# App performance configuration
# -----------------------------------------------------------------------------
GOGC = 1000
GOMAXPROCS = 2# used for go${GOVERSION} runtime and for Docker as well
GOVERSION =
# -----------------------------------------------------------------------------
# Bench Test Options
# -----------------------------------------------------------------------------
COUNT = 1
# -----------------------------------------------------------------------------
# API urls
# -----------------------------------------------------------------------------
APP_API_PART =# could be 'bitmap' or 'map'. Used in URL
APP_API = v1/search/${APP_API_PART}/prices
APP_BULK_API = v5/search/${APP_API_PART}/bulk/prices
# -----------------------------------------------------------------------------
# WRK Configuration (used for WRK2 as well)
# -----------------------------------------------------------------------------
WRK_DURATION = 30s
WRK_THREADS = 1
WRK_CONNECTIONS = 1
WRK_REQUEST = benchmark/500k-large-groups/sample/wrk-search-price-request.lua# used in main runner
WRK_FILENAME_PART = ${APP_API_PART}# first part of filename with results
WRK_FILENAME_WHERE_PART =# 'docker-' or empty by default
WRK2_RATE = 2000
WRK_BITMAP_FOLDER = 500k-large-groups/bitmap/wrk
WRK_KELINDAR_FOLDER = 500k-large-groups/kelindar/wrk
WRK_MAP_FOLDER = 500k-large-groups/map/wrk
WRK2_BITMAP_FOLDER = 500k-large-groups/bitmap/wrk2
WRK2_MAP_FOLDER = 500k-large-groups/map/wrk2
WRK_BITMAP_IN_DOCKER_FOLDER = 500k-large-groups/bitmap/wrk
WRK_MAP_IN_DOCKER_FOLDER = 500k-large-groups/map/wrk
WRK2_BITMAP_IN_DOCKER_FOLDER = 500k-large-groups/bitmap/wrk2
WRK2_MAP_IN_DOCKER_FOLDER = 500k-large-groups/map/wrk2
# -----------------------------------------------------------------------------
# AB Configuration
# -----------------------------------------------------------------------------
# Number of multiple requests to make at a time
AB_CONCURRENCY = 1
AB_REQUESTS_NUMBER = 1000# Number of requests to perform
AB_REQUEST = benchmark/500k-large-groups/sample/search-price-request.json# used in main runner
AB_BULK_REQUEST = benchmark/500k-large-groups/sample/search-price-bulk-request-10000.json
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
install-dependencies:
	go${GOVERSION} install github.com/ugorji/go/codec/codecgen
	go${GOVERSION} install golang.org/x/perf/cmd/benchstat@latest
build: install-dependencies
	go${GOVERSION} generate ./...
	go${GOVERSION} build .
update-dependencies:
	go${GOVERSION} get -u ./...
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
run-roaring32-fiber: FIBER=true ROARING32=true
run-roaring32-fiber:
	$(MAKE) -e run
run-map32-fiber: FIBER=true MAP32=true
run-map32-fiber:
	$(MAKE) -e run
run-profile-gc: APP_CMD=GODEBUG=gctrace=1
run-profile-gc:
	$(MAKE) -e run
run-no-gc: GOGC=off
run-no-gc:
	$(MAKE) -e run
test:
	go${GOVERSION} test $$(go${GOVERSION} list ./... | grep -v /benchmark | grep -v /runner) -covermode=atomic -coverprofile=coverprofile.out -short
test-cover:
	go${GOVERSION} tool cover -html=coverprofile.out
# -----------------------------------------------------------------------------
# Docker
# -----------------------------------------------------------------------------
docker:
	docker build . -t bitmap-usage
docker-run:
	docker run -p ${APP_PORT}:8080 --cpus=${GOMAXPROCS} --env GOMAXPROCS=${GOMAXPROCS} \
		--env GOGC=${GOGC} --env FIBER=${FIBER} --env SROAR=${SROAR} \
		--env ROARING64=${ROARING64} --env MAP64=${MAP64} ${APP_DOCKER_CMD} bitmap-usage
docker-run-fiber: FIBER=true
docker-run-fiber:
	$(MAKE) -e docker-run
docker-run-profile-gc: APP_DOCKER_CMD=--env GODEBUG=gctrace=1
docker-run-profile-gc:
	$(MAKE) -e docker-run
# -----------------------------------------------------------------------------
# go${GOVERSION} Benchmarks
# -----------------------------------------------------------------------------
bench: bench-map bench-bitmap bench-map-64 bench-bitmap-64 bench-sroar bench-kelindar bench-kelindar-column bench-bits-and-blooms
bench-map:
	go${GOVERSION} test ./benchmark/500k-large-groups/map/... -bench=. -run ^$$ -cpu 1 -benchmem -count=$${COUNT} \
		| tee benchmark/500k-large-groups/map/benchmark-results.txt
bench-bitmap:
	go${GOVERSION} test ./benchmark/500k-large-groups/bitmap/... -bench=. -run ^$$ -cpu 1 -benchmem -count=$${COUNT} \
        | tee benchmark/500k-large-groups/bitmap/benchmark-results.txt
bench-map-64:
	go${GOVERSION} test ./benchmark/500k-large-groups/map64/... -bench . -run ^$$ -cpu 1 -benchmem -count=$${COUNT} -failfast \
		| tee benchmark/500k-large-groups/map64/benchmark-results.txt
bench-bitmap-64:
	go${GOVERSION} test ./benchmark/500k-large-groups/bitmap64/... -bench . -run ^$$ -cpu 1 -benchmem -count=$${COUNT} -failfast \
		| tee benchmark/500k-large-groups/bitmap64/benchmark-results.txt
bench-sroar:
	go${GOVERSION} test ./benchmark/500k-large-groups/bitmap-sroar/... -bench . -run ^$$ -cpu 1 -benchmem -count=$${COUNT} -failfast \
 		| tee benchmark/500k-large-groups/bitmap-sroar/benchmark-results.txt
bench-kelindar:
	go${GOVERSION} test ./benchmark/500k-large-groups/kelindar/... -bench . -run ^$$ -cpu 1 -benchmem -count=$${COUNT} -failfast \
 		| tee benchmark/500k-large-groups/kelindar/benchmark-results.txt
bench-kelindar-column:
	go${GOVERSION} test ./benchmark/500k-large-groups/kelindar-column/... -bench . -run ^$$ -cpu 1 -benchmem -count=$${COUNT} -failfast \
 		| tee benchmark/500k-large-groups/kelindar-column/benchmark-results.txt
bench-bits-and-blooms:
	go${GOVERSION} test ./benchmark/500k-large-groups/bits-and-blooms/... -bench . -run ^$$ -cpu 1 -benchmem -count=$${COUNT} -failfast \
 		| tee benchmark/500k-large-groups/bits-and-blooms/benchmark-results.txt
bench-memory: bench-memory-bitmap bench-memory-map bench-memory-map-64 bench-memory-bitmap-64 bench-memory-sroar \
	bench-memory-kelindar bench-memory-bits-and-blooms
# TODO works bad when there are >1 test, it includes allocated space from all tests
bench-memory-bitmap:
	go${GOVERSION} test ./benchmark/500k-large-groups/bitmap/... . -run ^*Memory* -failfast -test.memprofilerate=1
bench-memory-map:
	go${GOVERSION} test ./benchmark/500k-large-groups/map/... . -run ^*Memory* -failfast -test.memprofilerate=1
bench-memory-map-64:
	go${GOVERSION} test ./benchmark/500k-large-groups/map64/... . -run ^*Memory* -failfast -test.memprofilerate=1
bench-memory-bitmap-64:
	go${GOVERSION} test ./benchmark/500k-large-groups/bitmap64/... . -run ^*Memory* -failfast -test.memprofilerate=1
bench-memory-sroar:
	go${GOVERSION} test ./benchmark/500k-large-groups/bitmap-sroar/... . -run ^*Memory* -failfast -test.memprofilerate=1
bench-memory-kelindar:
	go${GOVERSION} test ./benchmark/500k-large-groups/kelindar/... . -run ^*Memory* -failfast -test.memprofilerate=1
bench-memory-bits-and-blooms:
	go${GOVERSION} test ./benchmark/500k-large-groups/bits-and-blooms/... . -run ^*Memory* -failfast -test.memprofilerate=1
# -----------------------------------------------------------------------------
# WRK tool for performance measurement https://github.com/wg/wrk (the only one for microsecond results)
# -----------------------------------------------------------------------------
ifeq ($(IN_DOCKER),true)
  WRK_FILENAME_WHERE_PART = docker-
endif
wrk-run:
	./wrk -t${WRK_THREADS} -c${WRK_CONNECTIONS} -d${WRK_DURATION} --latency -s ${WRK_REQUEST} \
		${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/${APP_API} -- \
		  benchmark/${WRK_FOLDER}/json/${WRK_FILENAME_WHERE_PART}${WRK_FILENAME_PART}-t${WRK_THREADS}-c${WRK_CONNECTIONS}.json \
		  | tee benchmark/${WRK_FOLDER}/${WRK_FILENAME_WHERE_PART}${WRK_FILENAME_PART}-t${WRK_THREADS}-c${WRK_CONNECTIONS}.txt
wrk-map-t1-c1: WRK_THREADS = 1
wrk-map-t1-c1: WRK_CONNECTIONS = 1
wrk-map-t1-c1: APP_API_PART = map
wrk-map-t1-c1: WRK_FOLDER = ${WRK_MAP_FOLDER}
wrk-map-t1-c1:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-map-t1-c1-multiple: WRK_THREADS=1
wrk-map-t1-c1-multiple: WRK_CONNECTIONS=1
wrk-map-t1-c1-multiple: WRK_REQUEST=benchmark/500k-large-groups/sample/search-price-map-multiple-request-100.lua
wrk-map-t1-c1-multiple: APP_API_PART=map
wrk-map-t1-c1-multiple: WRK_FILENAME_PART=${APP_API_PART}-multiple
wrk-map-t1-c1-multiple: WRK_FOLDER = ${WRK_MAP_FOLDER}
wrk-map-t1-c1-multiple:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-map-t2-c20: WRK_THREADS = 2
wrk-map-t2-c20: WRK_CONNECTIONS = 20
wrk-map-t2-c20: APP_API_PART = map
wrk-map-t2-c20: WRK_FOLDER = ${WRK_MAP_FOLDER}
wrk-map-t2-c20:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-map-t2-c20-multiple: WRK_THREADS = 2
wrk-map-t2-c20-multiple: WRK_CONNECTIONS = 20
wrk-map-t2-c20-multiple: WRK_REQUEST=benchmark/500k-large-groups/sample/search-price-map-multiple-request-100.lua
wrk-map-t2-c20-multiple: APP_API_PART = map
wrk-map-t2-c20-multiple: WRK_FILENAME_PART=${APP_API_PART}-multiple
wrk-map-t2-c20-multiple: WRK_FOLDER = ${WRK_MAP_FOLDER}
wrk-map-t2-c20-multiple:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-bitmap-bulk-1000-t1-c1: WRK_THREADS=1
wrk-bitmap-bulk-1000-t1-c1: WRK_CONNECTIONS=1
wrk-bitmap-bulk-1000-t1-c1: WRK_REQUEST=benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-1000-nd.lua
wrk-bitmap-bulk-1000-t1-c1: APP_API_PART=bitmap
wrk-bitmap-bulk-1000-t1-c1: APP_API=${APP_BULK_API}
wrk-bitmap-bulk-1000-t1-c1: WRK_FILENAME_PART=${APP_API_PART}-bulk-1000
wrk-bitmap-bulk-1000-t1-c1: WRK_FOLDER=${WRK_BITMAP_FOLDER}
wrk-bitmap-bulk-1000-t1-c1:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-bitmap-t1-c1: WRK_THREADS=1
wrk-bitmap-t1-c1: WRK_CONNECTIONS=1
wrk-bitmap-t1-c1: APP_API_PART=bitmap
wrk-bitmap-t1-c1: WRK_FOLDER = ${WRK_BITMAP_FOLDER}
wrk-bitmap-t1-c1:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-bitmap-t1-c1-multiple: WRK_THREADS=1
wrk-bitmap-t1-c1-multiple: WRK_CONNECTIONS=1
wrk-bitmap-t1-c1-multiple: WRK_REQUEST=benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-100.lua
wrk-bitmap-t1-c1-multiple: APP_API_PART=bitmap
wrk-bitmap-t1-c1-multiple: WRK_FILENAME_PART=${APP_API_PART}-multiple
wrk-bitmap-t1-c1-multiple: WRK_FOLDER = ${WRK_BITMAP_FOLDER}
wrk-bitmap-t1-c1-multiple:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-bitmap-t2-c20: WRK_THREADS=2
wrk-bitmap-t2-c20: WRK_CONNECTIONS=20
wrk-bitmap-t2-c20: APP_API_PART=bitmap
wrk-bitmap-t2-c20: WRK_FOLDER = ${WRK_BITMAP_FOLDER}
wrk-bitmap-t2-c20:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-bitmap-t2-c20-multiple: WRK_THREADS = 2
wrk-bitmap-t2-c20-multiple: WRK_CONNECTIONS = 20
wrk-bitmap-t2-c20-multiple: WRK_REQUEST=benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-100.lua
wrk-bitmap-t2-c20-multiple: APP_API_PART = bitmap
wrk-bitmap-t2-c20-multiple: WRK_FILENAME_PART=${APP_API_PART}-multiple
wrk-bitmap-t2-c20-multiple: WRK_FOLDER = ${WRK_BITMAP_FOLDER}
wrk-bitmap-t2-c20-multiple:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-kelindar-t1-c1: WRK_THREADS=1
wrk-kelindar-t1-c1: WRK_CONNECTIONS=1
wrk-kelindar-t1-c1: APP_API_PART=kelindar
wrk-kelindar-t1-c1: WRK_FOLDER = ${WRK_KELINDAR_FOLDER}
wrk-kelindar-t1-c1:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk-kelindar-t2-c20: WRK_THREADS=2
wrk-kelindar-t2-c20: WRK_CONNECTIONS=20
wrk-kelindar-t2-c20: APP_API_PART=kelindar
wrk-kelindar-t2-c20: WRK_FOLDER = ${WRK_KELINDAR_FOLDER}
wrk-kelindar-t2-c20:
	$(MAKE) -e wrk-run
	$(MAKE) trigger-gc
wrk: wrk-map-t1-c1 wrk-map-t2-c20 wrk-bitmap-t1-c1 wrk-bitmap-t2-c20
# -----------------------------------------------------------------------------
# WRK2 tool for performance measurement https://github.com/giltene/wrk2
# -----------------------------------------------------------------------------
ifeq ($(IN_DOCKER),true)
	WRK_FILENAME_WHERE_PART = docker-
endif
wrk2-run:
	./wrk2 -t${WRK_THREADS} -c${WRK_CONNECTIONS} -d${WRK_DURATION} --latency -R${WRK2_RATE} \
		${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/${APP_API} \
    	-s ${WRK_REQUEST} -- benchmark/${WRK_FOLDER}/json/${WRK_FILENAME_WHERE_PART}${WRK_FILENAME_PART}-t${WRK_THREADS}-c${WRK_CONNECTIONS}-R${WRK2_RATE}.json \
    	| tee benchmark/${WRK_FOLDER}/${WRK_FILENAME_WHERE_PART}${WRK_FILENAME_PART}-t${WRK_THREADS}-c${WRK_CONNECTIONS}-R${WRK2_RATE}.txt
wrk2-map-t1-c1: WRK_THREADS = 1
wrk2-map-t1-c1: WRK_CONNECTIONS = 1
wrk2-map-t1-c1: APP_API_PART = map
wrk2-map-t1-c1: WRK_FOLDER = ${WRK2_MAP_FOLDER}
wrk2-map-t1-c1:
	$(MAKE) -e wrk2-run
	$(MAKE) trigger-gc
wrk2-map-t2-c20: WRK_THREADS=2
wrk2-map-t2-c20: WRK_CONNECTIONS=20
wrk2-map-t2-c20: APP_API_PART=map
wrk2-map-t2-c20: WRK_FOLDER = ${WRK2_MAP_FOLDER}
wrk2-map-t2-c20:
	$(MAKE) -e wrk2-run
	$(MAKE) trigger-gc
wrk2-bitmap-bulk-1000-t1-c1: WRK_THREADS=1
wrk2-bitmap-bulk-1000-t1-c1: WRK_CONNECTIONS=1
wrk2-bitmap-bulk-1000-t1-c1: WRK_REQUEST=benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-1000-nd.lua
wrk2-bitmap-bulk-1000-t1-c1: APP_API_PART=bitmap
wrk2-bitmap-bulk-1000-t1-c1: APP_API=${APP_BULK_API}
wrk2-bitmap-bulk-1000-t1-c1: WRK_FILENAME_PART=${APP_API_PART}-bulk-1000
wrk2-bitmap-bulk-1000-t1-c1: WRK_FOLDER = ${WRK2_BITMAP_FOLDER}
wrk2-bitmap-bulk-1000-t1-c1:
	$(MAKE) -e wrk2-run
	$(MAKE) trigger-gc
wrk2-bitmap-t1-c1: WRK_THREADS=1
wrk2-bitmap-t1-c1: WRK_CONNECTIONS=1
wrk2-bitmap-t1-c1: APP_API_PART=bitmap
wrk2-bitmap-t1-c1: WRK_FOLDER = ${WRK2_BITMAP_FOLDER}
wrk2-bitmap-t1-c1:
	$(MAKE) -e wrk2-run
	$(MAKE) trigger-gc
wrk2-bitmap-t2-c20: WRK_THREADS=2
wrk2-bitmap-t2-c20: WRK_CONNECTIONS=20
wrk2-bitmap-t2-c20: APP_API_PART=bitmap
wrk2-bitmap-t2-c20: WRK_FOLDER = ${WRK2_BITMAP_FOLDER}
wrk2-bitmap-t2-c20:
	$(MAKE) -e wrk2-run
	$(MAKE) trigger-gc
wrk2: wrk2-map-t1-c1 wrk2-map-t2-c20 wrk2-bitmap-t1-c1 wrk2-bitmap-t2-c20
# -----------------------------------------------------------------------------
# Hey Tool for performance measurement (tested once) https://github.com/rakyll/hey
# -----------------------------------------------------------------------------
hey:
	hey -cpus 2 -c 200 -n 1000000 -m POST -D benchmark/500k-large-groups/sample/search-price-request.json -T "application/json" \
 		${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/bitmap/prices
# -----------------------------------------------------------------------------
# AB Tool for performance measurement (used few times)
# -----------------------------------------------------------------------------
ab-run:
	ab -k -c ${AB_CONCURRENCY} -n ${AB_REQUESTS_NUMBER} -T application/json -benchmark/500k-large-groups/sample/search-price-request.json \
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
run-wrk-experiments:
	go${GOVERSION} test ./runner/... -run PerformanceWrkExperiments -covermode=atomic -short -test.v -count=1
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
	go${GOVERSION} tool pprof ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/debug/pprof/allocs
pprof-profile: # CPU profiler. Run it and run test
	go${GOVERSION} tool pprof ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/debug/pprof/profile
bench-diff:
	go${GOVERSION} run benchmark/analyze/main.go -f1 "benchmark/500k-large-groups/bitmap/wrk/json/bitmap-t2-c20.json" \
		-f2 "benchmark/500k-large-groups/map/wrk/json/map-t2-c20.json" \
		-o "benchmark/500k-large-groups/diff/wrk/t2-c20-bitmap-vs-map.md"
	go${GOVERSION} run benchmark/analyze/main.go -f1 "benchmark/500k-large-groups/bitmap/wrk/json/bitmap-t1-c1.json" \
    		-f2 "benchmark/500k-large-groups/map/wrk/json/map-t1-c1.json" \
    		-o "benchmark/500k-large-groups/diff/wrk/t1-c1-bitmap-vs-map.md"
	# '-split' should NOT contain 'pkg' cause looks like it is unable to process '/'
	benchstat -split 'goos' -alpha 1 benchmark/500k-large-groups/map/benchmark-results.txt benchmark/500k-large-groups/bitmap/benchmark-results.txt \
		| tee benchmark/500k-large-groups/diff/benchmark-results.txt
bench-diff-example:
	go run benchmark/analyze/main.go -f2 "reports/$$(ls reports | tail -n 2 | head -n 1)/$$(ls reports/$$(ls reports | tail -n 2 | head -n 1))" \
		-f1 "reports/$$(ls reports | tail -n 1)/$$(ls reports/$$(ls reports | tail -n 1))" \
		-o "reports/$$(ls reports | tail -n 1)/diff-go1.17.6-vs-go1.16.15.md"