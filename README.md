# Bitmap Usage

[![Test](https://github.com/marniks7/bitmap-usage/actions/workflows/test.yaml/badge.svg)](https://github.com/marniks7/bitmap-usage/actions/workflows/test.yaml)
[![codecov](https://codecov.io/gh/marniks7/bitmap-usage/branch/master/graph/badge.svg?token=YDLIOFV6AQ)](https://codecov.io/gh/marniks7/bitmap-usage)

## Goal

For data size <2M entities

1. Efficient storage data in memory
2. Efficient search
3. Prepare infrastructure for performance analyze

## Guidance about this repo

This repo is comparing `bitmap` and `map` as a cache in-memory storage.

Let's first understand what is your purpose? Do you want to improve memory? Do you want to improve CPU? or both?
Are you ready to increase cost of development and support for that?

* Read [Status](docs/status.md), you might get some issues running non-essential benchmarks
* Read [Design](docs/design.md)
    * Take into consideration: very few search options are supported, so benchmarks are limited
* Read [Benchmark Aggregation](docs/benchmark.md) - it may not be up-to-date, but will give you the common understanding
  of the `bitmap` benefits
* `Memory`: `bitmap` occupies less memory? This is only half of the story.
  First, you should beware why. bitmap and map index part has minimum difference. In fact, it is about storing or
  not storing original entities. If storing original entities is MUST - you may not gain any memory benefits
  Second, read `CPU` section below
* `CPU`: `bitmap` is way faster, but it comes with the cost of increased memory allocation and GC pressure.
  This means, that proper GC configuration is MUST, and, unfortunately, minimum memory limit is not an option, e.g.
  you may need to set memory limit as `1GB` for `100MB` of the actual cache.
* `High throughput` vs `Low Latency` - low-latency is expected here.
* `Sizing`: there is test for only ~`500k` prices with ~`8` conditions each. Your results for your data could be
  different.
* `Cost`: `bitmap` development and support is way harder than regular `map`. It is about supporting low-level data
  types. In contrast `Map` is like business as usual - you will be able to spend more time on you actual business cases,
  then on
  dealing with performance. More over, you can check issues of
  different `bitmap libraries` and found all sort of issues hard-to-spot, like race conditions. Good testing, even
  for concurrent READ scenarios is must.
* `Usage`: this repository is comparing search capabilities, at the same time update or inserts could be as well
  important use case. Not only timing and memory usage (gc) is important here, but also you mind end up with x2
  memory requirements (e.g. creating two caches at the same time) or will be forced to add READ lock for concurrency
  update\read. Map as well doesn't allow concurrent writes, so at least search compare oranges with oranges
* `Language`: `go` is used here. `java` maybe a good alternative, there are different efficient map implementations,
  32-bit option (less memory \ faster) for free

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
      -d @benchmark/500k-large-groups/sample/search-price-request.json
```

* Search 1 price. Map

```bash
curl -POST http://localhost:8091/v1/search/map/prices \
      -H "Content-Type: application/json" \
      -d @benchmark/500k-large-groups/sample/search-price-request.json
```

* Search 5 prices. Bitmap

```bash
curl -H "Content-Type: application/json" -POST http://localhost:8091/v5/search/bitmap/bulk/prices \
    -d @benchmark/500k-large-groups/sample/search-price-bulk-request-5-nd.json
```

* Search 10000 prices. Bitmap

```bash
time curl -H "Content-Type: application/json" -o /dev/null -POST http://localhost:8091/v5/search/bitmap/bulk/prices \
    -d @benchmark/500k-large-groups/sample/search-price-bulk-request-10000-nd.json
```

## Benchmarks

[Benchmark Aggregation](docs/benchmark.md)

* Low-level: `make bench` (go tests)
* Memory:
    * `make bench-memory-bitmap`
      See [bitmap memory](benchmark/500k-large-groups/bitmap/memory)
    * `make bench-memory-map`. See [map memory](benchmark/500k-large-groups/map/memory)
* High-level
    * Wrk: `make wrk`
    * Wrk new approach: `make run-wrk-experiments` (in 1 click). See [reports](reports)
    * Wrk2: `make wrk2`
* Docker (beta)
    * Build & Run app: `make build docker docker-run-fiber`
    * Benchmarks
        * Wrk: `make wrk -e IN_DOCKER=true`
        * Wrk2: `make wrk2 -e IN_DOCKER=true`

## Design & more

* [Design](docs/design.md)
* [Tasks](docs/tasks.md)