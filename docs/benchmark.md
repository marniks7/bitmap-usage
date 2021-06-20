# Benchmark

## Run
* see [Readme](../README.md)

## Results
* 487k prices, 9.7k prices per offering

### Timing (low level)
|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|FindPrice|18246 ns/op|207368 ns/op|~11 times less, 1 order of magnitude|
|FindPrice_MapOptimized|18246 ns/op|75852 ns/op|~4 times less|
|FindPrice_HTTPClientServer*|95266 ns/op|351127 ns/op|~3.7 times less|

### Timing (high level)
* 1 connection (1 OS thread)

|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|50%|58.00us|796.00us|738us|
|75%|80.00us|1.28ms|1.2ms|
|90%|125.00us|1.35ms|1.2ms|
|99%|5.26ms**|1.49ms|3.77ms|
|request/sec|13612|1127|12485|
|total requests|408784|33836|374948|

** with `export GOGC=1000000000` - it is 325.00us and throughput decreased

* 10 connections (1 OS thread)

|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|50%|116.00us|709.00us|593us|
|75%|143.00us|771.00us|593us|
|90%|250.00us|1.00ms|628us|
|99%|7.51ms|2.70ms|-4.81ms|
|request/sec|70407|13875|56532|
|total requests|2117336|416435|1700901|

* 20 connections (6 OS threads)

|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|50%|180.00us|0.95ms|770us|
|75%|292.00us|1.63ms|1338us|
|90%|616.00us|2.03ms|1414us|
|99%|8.74ms|5.57ms|-3.17ms|
|requests/sec|76189|14403|61786|
|total requests|2288549|432554|1855995|

### Memory
|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|Total|90MB|180MB|90MB|
|Price Storage (all)|86MB|175MB|89MB. But this value might be decreased to 52MB (-37MB)|
|Index|2.67MB|4.69MB|2MB|

#### Memory with LRU*
|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|LRU|10%-100%. 9MB-86MB| 100% 175MB (harder to use)|
|Index|3MB|5MB|-2MB|
|Results|12MB-89MB|180MB|90MB-168MB|

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
