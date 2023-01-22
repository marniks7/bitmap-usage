### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|3.54ms|better: on 3.267ms, on 1196.70%, in 13.0 times , 1 order of magnitude|
|90%|567µs|7.023ms|better: on 6.456ms, on 1138.62%, in 12.4 times , 1 order of magnitude|
|95%|664µs|8.12ms|better: on 7.456ms, on 1122.89%, in 12.2 times , 1 order of magnitude|
|97%|802µs|8.643ms|better: on 7.841ms, on 977.68%, in 10.8 times , 1 order of magnitude|
|98%|1.05ms|9.005ms|better: on 7.955ms, on 757.62%, in 8.6 times |
|99%|2.817ms|9.442ms|better: on 6.625ms, on 235.18%, in 3.4 times |
|99.999%|11.435ms|18.167ms|better: on 6.732ms, on 58.87%, in 1.6 times |
|Requests, count|2063784|164757|more: 1152.6% , in 12.5 times |
