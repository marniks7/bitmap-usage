### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|3.549ms|better: on 3.276ms, on 1200.00%, in 13.0 times , 1 order of magnitude|
|90%|567µs|6.985ms|better: on 6.418ms, on 1131.92%, in 12.3 times , 1 order of magnitude|
|95%|664µs|8.091ms|better: on 7.427ms, on 1118.52%, in 12.2 times , 1 order of magnitude|
|97%|802µs|8.621ms|better: on 7.819ms, on 974.94%, in 10.7 times , 1 order of magnitude|
|98%|1.05ms|8.93ms|better: on 7.88ms, on 750.48%, in 8.5 times |
|99%|2.817ms|9.398ms|better: on 6.581ms, on 233.62%, in 3.3 times |
|99.999%|11.435ms|11.742ms|better: on 307µs, on 2.68%, in 1.0 times |
|Requests, count|2063784|164298|more: 1156.1% , in 12.6 times |
