# Bitmap Usage

## Goal

Efficient storage and efficient search for prices based on many conditions (attributes)

* [Design](docs/design.md)
* [Tasks](docs/tasks.md)

## Disclaimer
> Work in progress. There are still a lot todo to get the 'right' results.
> Unit tests, different data cases, more business cases, challenges with benchmarking and env configuration
 
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
curl -H "Content-Type: application/json" -POST http://localhost:8091/v4/search/bitmap/bulk/prices \
    -d @sample/search-price-bulk-request-5.json
```

* 5+

```bash
time curl -H "Content-Type: application/json" -o /dev/null -POST http://localhost:8091/v4/search/bitmap/bulk/prices \
    -d @sample/search-price-bulk-request-10000.json
```

## Benchmarks
* [Benchmark Results](docs/benchmark.md)
* Low-level `make benchmark`
* High-level `make wrk`
* Memory `make benchmark-memory`