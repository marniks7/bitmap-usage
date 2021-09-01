# Benchmark

## Run
* see [Readme](../README.md)

## Results
* 487k prices, 9.7k prices per offering

### Timing (low level)
* [map latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/map/benchmark-results.txt)
* [bitmap latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap/benchmark-results.txt)
* [diff latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/diff/benchmark-results.txt)

|Case|Bitmap, ns|Map, ns|Benefit|
|---|---|---|---|
|FindPrice|8466|233692|96% less, ~27 times less, 1 order of magnitude|
|FindPrice_MapOptimized_3824_of_9700|8466|75852|88% less, ~9 times less|
|FindPrice_BitmapAndMapOptimized|3047|75852|96% less, ~25 times less|
|FindPrice_HTTPClientServer*|75890|417117|82% less, ~5.4 times less|

### Timing (high level)

* 1 connection (1 processor)
  * [map latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/map/wrk/map-t1-c1.txt)
  * [bitmap latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap/wrk/bitmap-t1-c1.txt)
  * [diff latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/diff/wrk/diff.md)

|Case|Bitmap, ns|Map, ns|Bitmap benefit|
|---|---|---|---|
|50%|34000|395000|91.39% better, in 11.6 times better, 1 order of magnitude|
|90%|45000|541000|91.68% better, in 12.0 times better, 1 order of magnitude|
|95%|52000|647000|91.96% better, in 12.4 times better, 1 order of magnitude|
|97%|62000|747000|91.70% better, in 12.0 times better, 1 order of magnitude|
|98%|76000|848000|91.04% better, in 11.2 times better, 1 order of magnitude|
|99%|97000|1077000|90.99% better, in 11.1 times better, 2 order of magnitude|
|99.999%|7170000|9466000|24.26% better, in 1.3 times better|
|Requests|785931|70829|1009.6% more, in 11.1 times more|

* 20 connections (2 processors)
  * [map latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/map/wrk/map-t2-c20.txt)
  * [bitmap latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap/wrk/bitmap-t2-c20.txt)
  * [diff latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/diff/wrk/diff.md)

|Case|Bitmap, ns|Map, ns|Bitmap benefit|
|---|---|---|---|
|50%|270000|3299000|91.82% better, in 12.2 times better, 1 order of magnitude|
|90%|550000|6668000|91.75% better, in 12.1 times better, 1 order of magnitude|
|95%|635000|7694000|91.75% better, in 12.1 times better, 1 order of magnitude|
|97%|707000|8354000|91.54% better, in 11.8 times better, 1 order of magnitude|
|98%|781000|8968000|91.29% better, in 11.5 times better, 1 order of magnitude|
|99%|951000|10087000|90.57% better, in 10.6 times better, 2 order of magnitude|
|99.999%|20000000|21471000|6.85% better, in 1.1 times better|
|Requests|2138513|176831|1109.4% more, in 12.1 times more|

### Memory

* [map latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/map/memory/map-heapdump-top.txt)
* [bitmap latest](../benchmark/Prices-487k-PricesPerOffering-9.7k/bitmap/memory/bitmap-heapdump-top.txt)

|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|Total|90MB|180MB|90MB|
|Price Storage (all)|87MB|175MB|89MB. But this value might be decreased to 52MB (-37MB)|
|Index|2.67MB|4.69MB|2MB|

#### Memory with LRU*
|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|LRU|10%-100%. 9MB-87MB| 100% 175MB (harder to use)|
|Index|3MB|5MB|-2MB|
|Results|12MB-90MB|180MB|90MB-168MB|

#### Memory Detailed
|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|Total|90MB|180MB|90MB|
|Price Storage|57MB|153MB|96MB. But this value might be decreased to 59MB (-37MB)|
|Index to UUID Map|7.44MB|0MB|-7.44MB difference|
|Index|2.67MB|4.69MB|2MB|
|UUIDs for prices|22MB|22MB|no difference|

## Notes. Memory
* *Bitmap allows storing Price which is needed for response-only. This is small and efficient object.
More over, it allows using LRU cache and evict entire Prices Storage and load what is often used only.
In case of 'map' stored prices contains all data needed for price search, that is why LRU cache is not that efficient. 
It will force eviction and loading ALL prices per offering.
* Calculations and memory results looks promising, but there is one huge pitfall - 
  benchmark executed with no memory limits. In case if _strict_ memory limits will be introduced, in current version of 
  roaring bitmaps TPS should be limited, otherwise GC pressure will drop timings significantly.
  There is one project that looks promising - [sroar](https://github.com/dgraph-io/sroar/) - huge memory allocations drop
  
## Notes. Search based on simple map index
1. **BenchmarkMapOfferingIndex_FindPrice_Conditions8_3824position**
   * Search doesn't depend on element position and requires iteration over all elements
1. **BenchmarkMapOfferingIndex_FindPrice_Conditions8_3824position_Optimized**
   * Search optimized based on data specifics, and this is when search stops on price position.
      Worst case scenario is the same as for non-optimized benchmark
1. **BenchmarkMapOfferingIndex_FindPrice_Conditions8_MultiplePricesErr_Optimized**
   * Search prices when not all conditions specified, so there are multiple prices found.
     This test shows (as expected) that such search requires iteration over all elements

### Notes. HTTP Client Server*
Includes send request, read response, unmarshal and test library validations that no errors.
This adds 77020 ns/op for bitmap and 143759 ns/op for map index. Such difference in overhead is unclear, 
cause the code is the same. This benchmark requires deeper investigation to properly interpret results.

*This is a part of go test on mocks, just for illustration purposes here. Prefer `Timing (high level)`

## Machine, Software and Run notes
* OS: linux, arch: amd64
* CPU: Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
    * 6 cores (12 processors)
* The same machine used to run app and benchmark
* Processors are limited to `2` for app plus `2` more on benchmark tool
* Browser and other applications might work during execution  
* Benchmark tools: 
  * [wrk](https://github.com/wg/wrk/)
    * wrk is the only choice - it supports microseconds
  * [wrk2](https://github.com/giltene/wrk2)
  * [hey](https://github.com/rakyll/hey)
  * [ab](http://httpd.apache.org/docs/current/programs/ab.html)  
