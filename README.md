# Bitmap Usage

## Goal

Efficient storage and efficient search for prices based on many conditions (attributes)

* [Design](docs/design.md)
* [Tasks](docs/tasks.md)

## Disclaimer
> The work is in progress, there are not enough unit tests to cover logic,
> so benchmarks may change drastically
 
## Usage

### Single Request

```bash
curl -POST http://localhost:8091/v1/search/prices \
    -H "Content-Type: application/json" \
    -d @sample/search-price-request.json
```

### Bulk Request

* 0-5

```bash
curl -H "Content-Type: application/json" -POST http://localhost:8091/v1/search/bulk/prices \
    -d @sample/search-price-bulk-request-5.json
```

* 5+

```bash
time curl -H "Content-Type: application/json" -o /dev/null -POST http://localhost:8091/v1/search/bulk/prices \
    -d @sample/search-price-bulk-request-10000.json
```

## Benchmarks (low level)
* 2021/05/30
```
goos: linux
goarch: amd64
pkg: bitmap-usage/benchmark/Prices-487k-PricesPerOffering-9.7k
cpu: Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
BenchmarkMapOfferingIndex_FindPrice_Conditions8
BenchmarkMapOfferingIndex_FindPrice_Conditions8-12              	    4920	    207133 ns/op
BenchmarkMapOfferingIndex_Optimized_FindPrice_Conditions8
BenchmarkMapOfferingIndex_Optimized_FindPrice_Conditions8-12    	   15822	     77085 ns/op
BenchmarkBitmap_FindPriceIndexId_Conditions8
BenchmarkBitmap_FindPriceIndexId_Conditions8-12                 	   99075	     11059 ns/op
BenchmarkBitmap_FindPrice_Conditions8
BenchmarkBitmap_FindPrice_Conditions8-12                        	   84208	     12368 ns/op
PASS
ok  	bitmap-usage/benchmark/Prices-487k-PricesPerOffering-9.7k	29.292s
```

## Performance Testing

* Single Request One Threaded
  ```ab -k -c 1 -n 1000 -T application/json -p sample/search-price-request.json http://localhost:8091/v1/search/prices```
* Single Request Concurrent
  ```ab -k -c 20 -n 100000 -T application/json -p sample/search-price-request.json http://localhost:8091/v1/search/prices```
* Bulk Request One Threaded
  ```ab -k -c 1 -n 100 -T application/json -p sample/search-price-bulk-request-10000.json http://localhost:8091/v1/search/bulk/prices```
