### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|3.534ms|better: on 3.261ms, on 1194.51%, in 12.9 times , 1 order of magnitude|
|90%|567µs|7.001ms|better: on 6.434ms, on 1134.74%, in 12.3 times , 1 order of magnitude|
|95%|664µs|8.092ms|better: on 7.428ms, on 1118.67%, in 12.2 times , 1 order of magnitude|
|97%|802µs|8.618ms|better: on 7.816ms, on 974.56%, in 10.7 times , 1 order of magnitude|
|98%|1.05ms|8.953ms|better: on 7.903ms, on 752.67%, in 8.5 times |
|99%|2.817ms|9.388ms|better: on 6.571ms, on 233.26%, in 3.3 times |
|99.999%|11.435ms|11.856ms|better: on 421µs, on 3.68%, in 1.0 times |
|Requests, count|2063784|164883|more: 1151.7% , in 12.5 times |
