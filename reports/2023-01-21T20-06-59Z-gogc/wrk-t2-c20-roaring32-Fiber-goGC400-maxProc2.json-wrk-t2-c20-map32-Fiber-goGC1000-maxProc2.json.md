### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|3.581ms|better: on 3.308ms, on 1211.72%, in 13.1 times , 1 order of magnitude|
|90%|567µs|7.072ms|better: on 6.505ms, on 1147.27%, in 12.5 times , 1 order of magnitude|
|95%|664µs|8.168ms|better: on 7.504ms, on 1130.12%, in 12.3 times , 1 order of magnitude|
|97%|802µs|8.693ms|better: on 7.891ms, on 983.92%, in 10.8 times , 1 order of magnitude|
|98%|1.05ms|9.083ms|better: on 8.033ms, on 765.05%, in 8.7 times |
|99%|2.817ms|9.496ms|better: on 6.679ms, on 237.10%, in 3.4 times |
|99.999%|11.435ms|14.528ms|better: on 3.093ms, on 27.05%, in 1.3 times |
|Requests, count|2063784|163640|more: 1161.2% , in 12.6 times |
