# Benchmark

## Run
* see [Readme](../README.md)

## Results
* 487k prices, 9.7k prices per offering

### Timing (low level)
|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|FindPrice|18246 ns/op|207368 ns/op|~11 times less, 1 order of magnitude|
|FindPrice_MapOptimized_3824_of_9700|18246 ns/op|75852 ns/op|~4 times less|
|FindPrice_HTTPClientServer*|95266 ns/op|351127 ns/op|~3.7 times less|

### Timing (high level)
* 1 connection (1 processor)

|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|50%|57us|455.00us|398us|
|75%|65us|581.00us|516ms|
|90%|87us|0.9ms|0.8ms|
|95%|103us|1.00ms|0.9ms|
|97%|120us|1.07ms|1ms|
|98%|136us|1.14ms|1ms|
|99%|192us|1.33ms|1.1ms|
|request/sec|15.5k|2k|13.5k|
|total requests|470k|55.5k|414k|

* 20 connections (2 processors)

|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|50%|485us|3.31ms|3ms|
|75%|737us|4.84ms|4ms|
|90%|1.02ms|6.36ms|5.3ms|
|95%|1.02ms|7.39ms|6.3ms|
|97%|1.54ms|7.85ms|6.3us|
|98%|2.02ms|8.11ms|6ms|
|99%|3.88ms|8.56ms|4.7ms|
|requests/sec|40k|6k|34k|
|total requests|1.1kk|180k|0.9kk|

### Memory
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
