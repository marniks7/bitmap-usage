# Bitmap Usage

## Goal

1. Business: Efficient storage and efficient search for prices based on many conditions
2. Technical: Prepare infrastructure for performance analyze

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
* [Benchmark results](benchmark/Prices-487k-PricesPerOffering-9.7k)
* Low-level `make bench` (`go` tests)
* High-level `make wrk`
  * Wrk2: `make wrk2`
* Docker (alpha) 
  * Build & Run app: `make docker docker-run-fiber`
  * Benchmarks: `make wrk -e IN_DOCKER=true`
    * `make wrk2 -e IN_DOCKER=true`

## Design & more
* [Design](docs/design.md)
* [Tasks](docs/tasks.md)