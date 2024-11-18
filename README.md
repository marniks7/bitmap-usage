# Bitmap Usage: Compare Map vs Bitmap

[![Test](https://github.com/marniks7/bitmap-usage/actions/workflows/test.yaml/badge.svg)](https://github.com/marniks7/bitmap-usage/actions/workflows/test.yaml)
[![codecov](https://codecov.io/gh/marniks7/bitmap-usage/branch/master/graph/badge.svg?token=YDLIOFV6AQ)](https://codecov.io/gh/marniks7/bitmap-usage)

## Goal

For data size <2 million entities

1. Efficient storage data in memory
2. Efficient search
3. Prepare infrastructure for performance analyze

## Intro

This repo is comparing `bitmap` and `map` as an index/cache for entities

* `map` is provided by Golang built-in library
    * [show me the code for map](handlers-map/search-price.go)
* `bitmap`'s are provided by https://github.com/RoaringBitmap/roaring
    * [show me the code for bitmap](handlers-roaring/search-price.go)
* Few other bitmap repositories used occasionally, but excluded from the results described in this section

Considerations:

* `Data sizing`: there are ~`500k` prices with ~`8 conditions` for each price
* `Fair competition`: there are different strategies to improve both `bitmap` and `map` and some of them were applied.
* `High throughput` vs `Low Latency`: low-latency is expected here
* `Usage`: this repository is comparing `search` capabilities (e.g. find price by 8 input values/conditions).
* `Usage excluded`: it doesn't take into consideration update or inserts. It can be an important use case for you
  depending on the architecture. Not only timing and memory usage (gc) is important here, but also you mind end up with
  x2 memory requirements (e.g. creating two caches at the same time) or will be forced to add READ lock for concurrency
  update\read. Map as well doesn't allow concurrent writes, so at least search compares oranges with oranges
* `Measurement`: timing is measured by the `wrk` tool by calling service's json REST API (wrk is among very few
  available that supports microseconds)

## Search request/response sample
Request body:
```json
{
  "offeringId": "a38e432c-3965-4c74-8251-aa640002d2b2",
  "groupId": "group5",
  "priceSpecId": "MRC",
  "charValues": [
    {
      "char": "Term",
      "value": "18"
    },
    {
      "char": "B2B Traffic",
      "value": "10GB"
    },
    {
      "char": "VPN",
      "value": "ad796998-f1c7-4fcc-9a6b-1b33042fb375"
    },
    {
      "char": "B2B Bandwidth",
      "value": "1Mbps"
    },
    {
      "char": "Router",
      "value": "Included"
    }
  ]
}
```

Response body:
```json
{"id":"ed3a1325-9727-4bd0-ba29-a1d1486bf24d","spec":"MRC","value":2320,"currency":""}
```
## Results

| Topic                       | Map                   | Roaring Bitmap                                                                                                                                                        |
|-----------------------------|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Client Requests, count      | `162 471`             | ✅ `2 244 242`, which is `1 order of magnitude` more. Note: Absolute numbers might change drastically for different options, but `1` order of magnitude is ~consistent |
| Latency (99% percentile)    | `9.534ms`             | ✅ `911µs`, which is `1 order of magnitude` faster                                                                                                                     |
| Cache memory size           | `180mb`               | ✅ `90mb`, 2 times better. ONLY if original entities are not used                                                                                                      |
| -- Including index size     | `4mb`                 | ✅ `2mb`, 2 times less                                                                                                                                                 |
| -- Including entities size  | `175mb`               | ✅ `87mb`, 2 times less. ONLY if original entities are not used                                                                                                        |                                                                      |
| Usage memory (`GOMEMLIMIT`) | ✅ tested with `500mb` | ❌ `800MB` for `100MB` cache for similar latency, which is 1.6 times higher                                                                                            |

* ❌ `Cost`: `roaring bitmap` development and especially maintenance is higher than regular `map` because it is about
  supporting low-level data types. In contrast `Map` is like business as usual - you will be able to spend more time on
  you actual business cases, then on dealing with performance. More over, you can check issues of
  different `bitmap libraries` and found all sort of issues hard-to-spot, like race conditions. Add your changes on
  top. Good testing, even for concurrent READ scenarios is required.

## Build & Run

* build: `make build`
    * with codegen for extra options: `make build-generate` (might not work)
* run app:
    * map: `make run-map32-fiber`
    * bitmap: `make run-roaring32-fiber`
* run & benchmark in '1 click': `make run-wrk-experiments`. After the run see [reports](reports)
    * it runs the app for map, benchmarks for 5s, runs the app for bitmap and benchmarks again for 5s

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

[Benchmark Aggregation Report](docs/benchmark.md)

* High-level
    * In 1 click: `make run-wrk-experiments`. See [reports](reports)
    * Wrk: `make wrk`
    * Wrk2: `make wrk2`
* Low-level: `make bench` (go tests)
* Memory:
    * `make bench-memory-bitmap`
      See [bitmap memory](benchmark/500k-large-groups/bitmap/memory)
    * `make bench-memory-map`. See [map memory](benchmark/500k-large-groups/map/memory)
* Docker (beta)
    * Build: `make build docker`
        * Run roaring32: `make docker-run-roaring32-fiber`
        * Run map32: `make docker-run-map32-fiber`
    * Benchmarks
        * Wrk: `make wrk -e IN_DOCKER=true`
        * Wrk2: `make wrk2 -e IN_DOCKER=true`
* `GOMEMLIMIT`: You may need to set memory limit as `800MB` for `100MB` of the actual cache to get decent performance
  for `99%` percentile.
  See [bitmap 2gb vs 800mb](reports/2023-01-24t00-49-24z-dockermemorylimit-gomemlimit/exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json-vs-exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json.md).
  If degradation further is fine (we are still discussing timings `<5ms`)
  see [bitmap 2gb vs 500mb](reports/2023-01-24t00-49-24z-dockermemorylimit-gomemlimit/exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json-vs-exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json.md).
  No difference
  for [map 2gb vs 500mb](reports/2023-01-24t00-49-24z-dockermemorylimit-gomemlimit/exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json-vs-exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json.md)
* `GoGC`: Bitmap comes with the cost of increased memory allocation, which means increased GC pressure. Value `1000`
  looks good. For some background
  see [bitmap. gogc 1000 vs 100](reports/2023-01-21T20-06-59Z-gogc/wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json-wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json.md)
* `Http Server`: when it comes to bitmaps, you can achieve micro-seconds latency and here every improvement
  matters. For example,
  [bitmap. http server fiber vs default](reports/2023-01-21T17-28-56Z-http-server/wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json-wrk-t2-c20-roaring32-Default-goGC1000-maxProc2.json.md)
  fiber got `40%` better timings (`319µs` improvement for 97% percentile). Map has fewer requests, and timing from the
  start way higher,
  so, it is `1-3%` (`135µs` for 97%
  percentile) [map](reports/2023-01-21T17-28-56Z-http-server/wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json-wrk-t2-c20-map32-Default-goGC1000-maxProc2.json.md)
* `Docker`: has fewer requests `1 457 261` compare to non-docker option `2 244 242`, but similar timing. It is not yet
  clear why

## Docs

* Read [Status](docs/status.md), you might get some issues running non-essential benchmarks
* Read [Design](docs/design.md)
    * Take into consideration: very few search options are supported, so benchmarks are limited
* Read [Benchmark Aggregation](docs/benchmark.md) - it may not be up-to-date, but will give you the common understanding
  of the `bitmap` benefits