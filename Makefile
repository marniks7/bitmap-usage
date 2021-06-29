APP_PROTOCOL = http
APP_HOST = 127.0.0.1
APP_PORT = 8091
FIBER = false
GOGC = 1000
GOMAXPROCS = 2
SROAR = false
ROARING64 = false
MAP64 = false

build:
	go generate ./... && go build .
run:
	FIBER=${FIBER} GOMAXPROCS=${GOMAXPROCS} GOGC=${GOGC} SROAR=${SROAR} ROARING64=${ROARING64} MAP64=${MAP64} ADDR=:${APP_PORT} ./bitmap-usage
run-64:
	FIBER=${FIBER} GOMAXPROCS=${GOMAXPROCS} GOGC=${GOGC} SROAR=${SROAR} ROARING64=true MAP64=true ADDR=:${APP_PORT} ./bitmap-usage
run-sroar:
	FIBER=${FIBER} GOMAXPROCS=${GOMAXPROCS} GOGC=${GOGC} SROAR=true ROARING64=${ROARING64} MAP64=true ADDR=:${APP_PORT} ./bitmap-usage
run-fiber:
	FIBER=true GOMAXPROCS=${GOMAXPROCS} GOGC=${GOGC} SROAR=${SROAR} ROARING64=${ROARING64} MAP64=${MAP64} ADDR=:${APP_PORT} ./bitmap-usage
build-run: build run
test:
	go test -covermode=count -coverprofile=coverprofile.out ./... -short
test-cover:
	go tool cover -html=coverprofile.out
run-profile-gc:
	GOMAXPROCS=${GOMAXPROCS} GODEBUG=gctrace=1 ADDR=:${APP_PORT} ./bitmap-usage
run-no-gc:
	GOMAXPROCS=${GOMAXPROCS} GOGC=off ./bitmap-usage
docker-build:
	docker build . -t bitmap-usage
docker-run:
	docker run -p ${APP_PORT}:8080 --cpus="2" --env GOMAXPROCS=${GOMAXPROCS} GOGC=${GOGC} bitmap-usage
bench:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k/... -bench . -run ^$$ -cpu 1 -benchmem -failfast > benchmark/Prices-487k-PricesPerOffering-9.7k/benchmark-results.txt && cat benchmark/Prices-487k-PricesPerOffering-9.7k/benchmark-results.txt
bench-64:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k-64/... -bench . -run ^$$ -cpu 1 -benchmem -failfast > benchmark/Prices-487k-PricesPerOffering-9.7k-64/benchmark-results.txt && cat benchmark/Prices-487k-PricesPerOffering-9.7k-64/benchmark-results.txt
bench-sroar:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k-sroar/... -bench . -run ^$$ -cpu 1 -benchmem -failfast > benchmark/Prices-487k-PricesPerOffering-9.7k-sroar/benchmark-results.txt && cat benchmark/Prices-487k-PricesPerOffering-9.7k-sroar/benchmark-results.txt
bench-memory:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k/... . -failfast -test.memprofilerate=1
bench-memory-sroar:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k-sroar/... . -failfast -test.memprofilerate=1
docker-run-profile-gc:
	docker run -p ${APP_PORT}:8080 --cpus="2" --env GOMAXPROCS=2 --env GODEBUG=gctrace=1 bitmap-usage
wrk-map-t1-c1:
	wrk -t1 -c1 -d30s --latency ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/map/prices -s sample/wrk-search-price-request.lua > benchmark/wrk/map-t1-c1.txt && cat benchmark/wrk/map-t1-c1.txt
wrk-map-t2-c20:
	wrk -t2 -c20 -d30s --latency ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/map/prices -s sample/wrk-search-price-request.lua > benchmark/wrk/map-t2-c20.txt && cat benchmark/wrk/map-t2-c20.txt
wrk-bitmap-bulk-1000-t1-c1:
	wrk -t1 -c1 -d30s --latency ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v4/search/bitmap/bulk/prices -s sample/wrk-search-price-bulk-request-1000.lua > benchmark/wrk/bitmap-bulk-1000-t1-c1.txt && cat benchmark/wrk/bitmap-bulk-1000-t1-c1.txt
wrk-bitmap-t1-c1:
	wrk -t1 -c1 -d30s --latency ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/bitmap/prices -s sample/wrk-search-price-request.lua > benchmark/wrk/bitmap-t1-c1.txt && cat benchmark/wrk/bitmap-t1-c1.txt
wrk-bitmap-t2-c20:
	wrk -t2 -c20 -d30s --latency ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/bitmap/prices -s sample/wrk-search-price-request.lua > benchmark/wrk/bitmap-t2-c20.txt && cat benchmark/wrk/bitmap-t2-c20.txt
trigger-gc:
	curl ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/debug/pprof/gc && sleep 1
wrk: wrk-map-t1-c1 trigger-gc wrk-map-t2-c20 trigger-gc wrk-bitmap-t1-c1 trigger-gc wrk-bitmap-t2-c20 trigger-gc
hey:
	hey -cpus 2 -c 200 -n 1000000 -m POST -D sample/search-price-request.json -T "application/json" ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/bitmap/prices
ab-bitmap-1:
	ab -k -c 1 -n 1000 -T application/json -p sample/search-price-request.json ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/bitmap/prices
ab-map-1:
	ab -k -c 1 -n 1000 -T application/json -p sample/search-price-request.json ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/map/prices
ab-bitmap-20:
	ab -k -c 20 -n 100000 -T application/json -p sample/search-price-request.json ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/bitmap/prices
ab-map-20:
	ab -k -c 20 -n 100000 -T application/json -p sample/search-price-request.json ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v1/search/map/prices
ab-bulk-bitmap-1:
	ab -k -c 1 -n 100 -T application/json -p sample/search-price-bulk-request-10000.json ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v4/search/bitmap/bulk/prices
ab-bulk-map-1:
	ab -k -c 1 -n 100 -T application/json -p sample/search-price-bulk-request-10000.json ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/v4/search/bitmap/bulk/prices
ab:	ab-bitmap-1 trigger-gc ab-bitmap-20 trigger-gc ab-map-1 trigger-gc ab-map-20 trigger-gc
pprof-allocs: # Memory allocations profiler. Run test, run it
	go tool pprof ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/debug/pprof/allocs
pprof-profile: # CPU profiler. Run it and run test
	go tool pprof ${APP_PROTOCOL}://${APP_HOST}:${APP_PORT}/debug/pprof/profile