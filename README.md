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
* 2021/05/31
```
go test  -v ./benchmark/... -bench . -run ^$ -cpu 1 -benchmem -failfast
goos: linux
goarch: amd64
pkg: bitmap-usage/benchmark/Prices-487k-PricesPerOffering-9.7k
cpu: Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
BenchmarkMapOfferingIndex_FindPrice_Conditions8_3824position
BenchmarkMapOfferingIndex_FindPrice_Conditions8_3824position                	    4976	    218842 ns/op	     224 B/op	       2 allocs/op
BenchmarkMapOfferingIndex_FindPrice_Conditions8_MultiplePricesErr
BenchmarkMapOfferingIndex_FindPrice_Conditions8_MultiplePricesErr           	    5562	    219952 ns/op	     128 B/op	       1 allocs/op
BenchmarkMapOfferingIndex_FindPrice_Conditions8_3824position_Optimized
BenchmarkMapOfferingIndex_FindPrice_Conditions8_3824position_Optimized      	   15632	     76106 ns/op	     328 B/op	       5 allocs/op
BenchmarkMapOfferingIndex_FindPrice_Conditions8_MultiplePricesErr_Optimized
BenchmarkMapOfferingIndex_FindPrice_Conditions8_MultiplePricesErr_Optimized 	    5631	    210092 ns/op	     128 B/op	       1 allocs/op
BenchmarkBitmap_FindPriceIndexId_Conditions8
BenchmarkBitmap_FindPriceIndexId_Conditions8                                	   79185	     13058 ns/op	   11896 B/op	      10 allocs/op
BenchmarkBitmap_FindPrice_Conditions8
BenchmarkBitmap_FindPrice_Conditions8                                       	   56360	     18128 ns/op	   11896 B/op	      10 allocs/op
BenchmarkBitmap_FindPrice_Conditions8_MultiplePricesErr
BenchmarkBitmap_FindPrice_Conditions8_MultiplePricesErr                     	   91278	     12944 ns/op	   11816 B/op	       8 allocs/op
PASS
ok  	bitmap-usage/benchmark/Prices-487k-PricesPerOffering-9.7k	62.674s
```

## Performance Testing

* Single Request One Threaded
  ```ab -k -c 1 -n 1000 -T application/json -p sample/search-price-request.json http://localhost:8091/v1/search/prices```
* Single Request Concurrent
  ```ab -k -c 20 -n 100000 -T application/json -p sample/search-price-request.json http://localhost:8091/v1/search/prices```
* Bulk Request One Threaded
  ```ab -k -c 1 -n 100 -T application/json -p sample/search-price-bulk-request-10000.json http://localhost:8091/v1/search/bulk/prices```
