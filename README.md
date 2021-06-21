# Bitmap Usage

## Goal

Efficient storage and efficient search for prices based on many conditions

* [Design](docs/design.md)
* [Tasks](docs/tasks.md)

## Disclaimer
> Work in progress. There are still a lot todo to get the 'right' results.
> Unit tests, different data cases, more business cases, challenges with benchmarking and env configuration
 
## Build & Run
* `make build-run`

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
* [Benchmark Results](docs/benchmark.md)
* Low-level `make bench`
* High-level `make wrk`
* Memory `make bench-memory`