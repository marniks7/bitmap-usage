# Benchmark with WRK
* Map. One thread
```
wrk -c10 -t1 -d30s --latency http://127.0.0.1:8091/v1/search/map/prices -s sample/wrk-search-price-request.lua
Running 30s test @ http://127.0.0.1:8091/v1/search/map/prices
1 threads and 10 connections
Thread Stats   Avg      Stdev     Max   +/- Stdev
Latency   797.69us  614.34us  21.79ms   96.58%
Req/Sec    13.22k     2.16k   16.51k    84.33%
Latency Distribution
50%  709.00us
75%  771.00us
90%    1.00ms
99%    2.70ms
394801 requests in 30.01s, 76.81MB read
Requests/sec:  13154.45
Transfer/sec:      2.56MB
```
* Bitmap. One thread
```
wrk -c10 -t1 -d30s --latency http://127.0.0.1:8091/v1/search/bitmap/prices -s sample/wrk-search-price-request.lua
Running 30s test @ http://127.0.0.1:8091/v1/search/bitmap/prices
  1 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   359.72us    1.27ms  29.24ms   96.10%
    Req/Sec    69.67k    16.16k  101.48k    76.33%
  Latency Distribution
     50%  116.00us
     75%  143.00us
     90%  250.00us
     99%    7.51ms
  2080853 requests in 30.04s, 404.83MB read
Requests/sec:  69270.84
Transfer/sec:     13.48MB
```
* Map. Concurrent, 20 threads
```
wrk -c400 -t20 -d30s --latency http://127.0.0.1:8091/v1/search/map/prices -s sample/wrk-search-price-request.lua
Running 30s test @ http://127.0.0.1:8091/v1/search/map/prices
  20 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    30.32ms   31.36ms 477.06ms   91.67%
    Req/Sec   781.23    279.69     3.91k    86.19%
  Latency Distribution
     50%   27.06ms
     75%   37.44ms
     90%   56.53ms
     99%  162.70ms
  467214 requests in 30.10s, 90.90MB read
Requests/sec:  15523.61
Transfer/sec:      3.02MB
```
* Bitmap. Concurrent, 20 threads
```
wrk -c400 -t20 -d30s --latency http://127.0.0.1:8091/v1/search/bitmap/prices -s sample/wrk-search-price-request.lua
Running 30s test @ http://127.0.0.1:8091/v1/search/bitmap/prices
20 threads and 400 connections
Thread Stats   Avg      Stdev     Max   +/- Stdev
Latency     6.90ms    9.44ms 179.13ms   90.59%
Req/Sec     4.24k     1.19k   12.80k    73.32%
Latency Distribution
50%    4.17ms
75%    8.56ms
90%   15.77ms
99%   46.38ms
2529277 requests in 30.07s, 492.07MB read
Requests/sec:  84122.03
Transfer/sec:     16.37MB
```