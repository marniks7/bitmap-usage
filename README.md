# Bitmap Usage

[![Test](https://github.com/marniks7/bitmap-usage/actions/workflows/test.yaml/badge.svg)](https://github.com/marniks7/bitmap-usage/actions/workflows/test.yaml)
[![codecov](https://codecov.io/gh/marniks7/bitmap-usage/branch/master/graph/badge.svg?token=YDLIOFV6AQ)](https://codecov.io/gh/marniks7/bitmap-usage)

## Goal

For data size <2M entities

1. Efficient storage data in memory
2. Efficient search
3. Prepare infrastructure for performance analyze

## Guidance about this repo

This repo is comparing `bitmap` and `map` as a cache.

Some criterias to consider: decrease memory requirements? Decrease CPU requirements? Improve latency?
Increase cost of development and support for that?
See below

* Read [Status](docs/status.md), you might get some issues running non-essential benchmarks
* Read [Design](docs/design.md)
    * Take into consideration: very few search options are supported, so benchmarks are limited
* Read [Benchmark Aggregation](docs/benchmark.md) - it may not be up-to-date, but will give you the common understanding
  of the `bitmap` benefits
* `Sizing`: there is test for only ~`500k` prices with ~`8` conditions each. The results for your data could be
  different.
* `Fair competition`: there are different strategies to improve both `bitmap` and `map` and some of them were applied.
* `High throughput` vs `Low Latency` - low-latency is expected here
* `Usage`: this repository is comparing search capabilities,leaving update or inserts behind, which could be as well
  important use case. Not only timing and memory usage (gc) is important here, but also you mind end up with x2
  memory requirements (e.g. creating two caches at the same time) or will be forced to add READ lock for concurrency
  update\read. Map as well doesn't allow concurrent writes, so at least search compare oranges with oranges
* `Requests`: with bitmaps client were able to send on `1281%` more requests. e.g. `2 244 242` vs `162 471`
* `Latency`: at the same time for `99% percentile` got better timing on `>900%`, e.g. `911µs` vs `9.534ms` with even
  better results for all requests before 99% percentile
* `Memory`: `bitmap` cache occupies less memory? This is only half of the story.
  First, you should beware why. bitmap and map index part has minimum difference for such sizing (`2MB vs 4MB`). In
  fact, benefits
  comes from ability not to store all fields of original entities. If storing original entities is MUST - you may not
  gain any memory benefits. bitmap takes less for used structures - `90MB vs 180MB total`. Second, read `CPU` section
  below
* `CPU`: `bitmap` is way faster (1 order of magnitude), but it comes with the cost of increased memory allocation and GC
  pressure. This means, that proper GC configuration is MUST, and minimum memory limit might not be an option, e.g.
  you may need to set memory limit as `1GB` for `100MB` of the actual cache. Those numbers are based on
  used `GOGC=1000`. However, for this cost app will be able to accept `1000%` more requests with low latency.
  Check important of GOGC for example
  here [bitmap. gogc 1000 vs 100](reports/2023-01-21T20-06-59Z-gogc/wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json-wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json.md)
* `Cost`: `bitmap` development and support is way harder than regular `map`. It is about supporting low-level data
  types. In contrast `Map` is like business as usual - you will be able to spend more time on you actual business cases,
  then on
  dealing with performance. More over, you can check issues of
  different `bitmap libraries` and found all sort of issues hard-to-spot, like race conditions. Good testing, even
  for concurrent READ scenarios is must.
* `Language`: `go` is used here. `java` maybe a good alternative, over the years people built different efficient map
  implementations, and not only that, java's 32-bit support is free
* `MicroSeconds Latency`: when it comes to bitmaps, you can achieve micro-seconds latency and here every improvement
  matters. For example,
  [bitmap. http server fiber vs default](reports/2023-01-21T17-28-56Z-http-server/wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json-wrk-t2-c20-roaring32-Default-goGC1000-maxProc2.json.md)
  fiber got `40%` better timings (`319µs` improvement for 97% percentile). Map has fewer requests, and timing from the
  start way higher,
  so, it is `1-3%` (`135µs` for 97%
  percentile) [map](reports/2023-01-21T17-28-56Z-http-server/wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json-wrk-t2-c20-map32-Default-goGC1000-maxProc2.json.md)
  Not many tools support microsecond measurements, `wrk` is among those.

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