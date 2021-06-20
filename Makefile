build:
	go generate ./... && go build .
run:
	GOMAXPROCS=2 GOGC=1000 ./bitmap-usage
test:
	go test -v -covermode=count -coverprofile=coverprofile.out ./... -short
test-cover:
	go tool cover -html=coverprofile.out
run-profile-gc:
	GOMAXPROCS=2 GODEBUG=gctrace=1 ./bitmap-usage
run-no-gc:
	GOMAXPROCS=2 GOGC=off ./bitmap-usage
docker-build:
	docker build . -t bitmap-usage
docker-run:
	docker run -p 8091:8080 --cpus="2" --env GOMAXPROCS=2 GOGC=1000 bitmap-usage
bench:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k/... -bench . -run ^$ -cpu 1 -benchmem -failfast > benchmark/Prices-487k-PricesPerOffering-9.7k/benchmark-results.txt && cat benchmark/Prices-487k-PricesPerOffering-9.7k/benchmark-results.txt
bench-memory:
	go test -v ./benchmark/Prices-487k-PricesPerOffering-9.7k/... . -failfast -test.memprofilerate=1
docker-run-profile-gc:
	docker run -p 8091:8080 --cpus="2" --env GOMAXPROCS=2 --env GODEBUG=gctrace=1 bitmap-usage
wrk-map-t1-c1:
	wrk -t1 -c1 -d30s --latency http://127.0.0.1:8091/v1/search/map/prices -s sample/wrk-search-price-request.lua > benchmark/Prices-487k-PricesPerOffering-9.7k/map-t1-c1.txt && cat benchmark/Prices-487k-PricesPerOffering-9.7k/map-t1-c1.txt
wrk-map-t2-c20:
	wrk -t2 -c20 -d30s --latency http://127.0.0.1:8091/v1/search/map/prices -s sample/wrk-search-price-request.lua > benchmark/Prices-487k-PricesPerOffering-9.7k/map-t2-c20.txt && cat benchmark/Prices-487k-PricesPerOffering-9.7k/map-t2-c20.txt
wrk-bitmap-t1-c1:
	wrk -t1 -c1 -d30s --latency http://127.0.0.1:8091/v1/search/bitmap/prices -s sample/wrk-search-price-request.lua > benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap-t1-c1.txt && cat benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap-t1-c1.txt
wrk-bitmap-t2-c20:
	wrk -t2 -c20 -d30s --latency http://127.0.0.1:8091/v1/search/bitmap/prices -s sample/wrk-search-price-request.lua > benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap-t2-c20.txt && cat benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap-t2-c20.txt
trigger-gc:
	curl http://127.0.0.1:8091/debug/pprof/gc && sleep 1
wrk: wrk-map-t1-c1 trigger-gc wrk-map-t2-c20 trigger-gc wrk-bitmap-t1-c1 trigger-gc wrk-bitmap-t2-c20 trigger-gc
hey:
	hey -cpus 2 -c 200 -n 1000000 -m POST -D sample/search-price-request.json -T "application/json" http://127.0.0.1:8091/v1/search/bitmap/prices