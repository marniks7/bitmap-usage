# Bitmap Usage

## Goal

For data size <2M
1. Efficient storage data in memory 
2. Efficient search
3. Prepare infrastructure for performance analyze

## Disclaimer
> Work in progress. There are still a lot todo to get the 'right' results.
> Unit tests, different data cases, more business cases, challenges with benchmarking and env configuration

* See [Status](docs/status.md) for details

## Build & Run
* `make build run-fiber`

## Usage  
* Search 1 price. Bitmap 
```bash
curl -POST http://localhost:8091/v1/search/bitmap/prices \
      -H "Content-Type: application/json" \
      -d @sample/search-price-request.json
```
* Search 1 price. Map
```bash
curl -POST http://localhost:8091/v1/search/map/prices \
      -H "Content-Type: application/json" \
      -d @sample/search-price-request.json
```
* Search 5 prices. Bitmap
```bash
curl -H "Content-Type: application/json" -POST http://localhost:8091/v4/search/bitmap/bulk/prices \
    -d @sample/search-price-bulk-request-5.json
```
* Search 10000 prices. Bitmap
```bash
time curl -H "Content-Type: application/json" -o /dev/null -POST http://localhost:8091/v4/search/bitmap/bulk/prices \
    -d @sample/search-price-bulk-request-10000.json
```

## Benchmarks
* Low-level `make bench` (go tests). [bench results](benchmark/Prices-487k-PricesPerOffering-9.7k/benchmark-results.txt)
* High-level `make wrk`. [wrk results](benchmark/wrk)
  * Wrk2: `make wrk2`. [wrk2 results](benchmark/wrk2)
* Docker (beta) 
  * Build & Run app: `make build docker docker-run-fiber`
  * Benchmarks: `make wrk -e IN_DOCKER=true`. [docker wrk results](benchmark/docker/wrk)
    * `make wrk2 -e IN_DOCKER=true`. [docker wrk2 results](benchmark/docker/wrk2)

## Design & more
* [Design](docs/design.md)
* [Tasks](docs/tasks.md)