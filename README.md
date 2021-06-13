# Bitmap Usage

## Goal

Efficient storage and efficient search for prices based on many conditions (attributes)

* [Design](docs/design.md)
* [Tasks](docs/tasks.md)

## Disclaimer
> Work in progress. A lot of unit tests added recently to cover logic, however there still might be issues,
> so benchmarks may change drastically
 
## Usage

### Single Request
* Bitmap 
  ```bash
  curl -POST http://localhost:8091/v1/search/bitmap/prices \
      -H "Content-Type: application/json" \
      -d @sample/search-price-request.json
  ```
* Simple map
  ```bash
  curl -POST http://localhost:8091/v1/search/map/prices \
      -H "Content-Type: application/json" \
      -d @sample/search-price-request.json
  ```
### Bulk Request

* 0-5

```bash
curl -H "Content-Type: application/json" -POST http://localhost:8091/v1/search/bitmap/bulk/prices \
    -d @sample/search-price-bulk-request-5.json
```

* 5+

```bash
time curl -H "Content-Type: application/json" -o /dev/null -POST http://localhost:8091/v1/search/bitmap/bulk/prices \
    -d @sample/search-price-bulk-request-10000.json
```

## Benchmarks
* [Benchmark Results](benchmark/benchmark.md)

### Benchmarks (low level)
```
go test  -v ./benchmark/Prices-487k-PricesPerOffering-9.7k/... -bench . -run ^$ -cpu 1 -benchmem -failfast > benchmark/Prices-487k-PricesPerOffering-9.7k/benchmark-results.txt
```

### Benchmarks (high level)
* 1, 10 and 20 connections on 1, 1 and 6 OS threads respectively
```
wrk -c1 -t1 -d30s --latency http://127.0.0.1:8091/v1/search/map/prices -s sample/wrk-search-price-request.lua > benchmark/Prices-487k-PricesPerOffering-9.7k/map-c1-t1.txt
wrk -c1 -t1 -d30s --latency http://127.0.0.1:8091/v1/search/bitmap/prices -s sample/wrk-search-price-request.lua > benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap-c1-t1.txt

wrk -c10 -t1 -d30s --latency http://127.0.0.1:8091/v1/search/map/prices -s sample/wrk-search-price-request.lua > benchmark/Prices-487k-PricesPerOffering-9.7k/map-c10-t1.txt
wrk -c10 -t1 -d30s --latency http://127.0.0.1:8091/v1/search/bitmap/prices -s sample/wrk-search-price-request.lua > benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap-c10-t1.txt

wrk -c20 -t6 -d30s --latency http://127.0.0.1:8091/v1/search/map/prices -s sample/wrk-search-price-request.lua > benchmark/Prices-487k-PricesPerOffering-9.7k/map-c20-t6.txt
wrk -c20 -t6 -d30s --latency http://127.0.0.1:8091/v1/search/bitmap/prices -s sample/wrk-search-price-request.lua > benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap-c20-t6.txt
```

### Memory
```
go test  -v ./benchmark/Prices-487k-PricesPerOffering-9.7k/... . -failfast -test.memprofilerate=1
```