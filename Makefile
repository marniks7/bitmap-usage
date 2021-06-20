build:
	go generate ./... && go build .
run:
	GOMAXPROCS=2 ./bitmap-usage
test:
	go test --short -coverprofile -v ./...
run-profile-gc:
	GOMAXPROCS=2 GODEBUG=gctrace=1 ./bitmap-usage
run-no-gc:
	GOMAXPROCS=2 GOGC=off ./bitmap-usage
docker-build:
	docker build . -t bitmap-usage
docker-run:
	docker run -p 8091:8080 --cpus="2" --env GOMAXPROCS=2 bitmap-usage
benchmark:
	go test  -v ./benchmark/Prices-487k-PricesPerOffering-9.7k/... -bench . -run ^$ -cpu 1 -benchmem -failfast > benchmark/Prices-487k-PricesPerOffering-9.7k/benchmark-results.txt && cat benchmark/Prices-487k-PricesPerOffering-9.7k/benchmark-results.txt
benchmark-memory:
	go test  -v ./benchmark/Prices-487k-PricesPerOffering-9.7k/... . -failfast -test.memprofilerate=1
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
wrk: wrk-map-t1-c1 wrk-map-t2-c20 wrk-bitmap-t1-c1 wrk-bitmap-t2-c20 # TODO re-run app before each execution
