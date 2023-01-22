### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|280µs|better: on 7µs, on 2.56%, in 1.0 times |
|90%|567µs|605µs|better: on 38µs, on 6.70%, in 1.1 times |
|95%|664µs|773µs|better: on 109µs, on 16.42%, in 1.2 times |
|97%|802µs|1.159ms|better: on 357µs, on 44.51%, in 1.4 times , 1 order of magnitude|
|98%|1.05ms|2.155ms|better: on 1.105ms, on 105.24%, in 2.1 times |
|99%|2.817ms|4.146ms|better: on 1.329ms, on 47.18%, in 1.5 times |
|99.999%|11.435ms|11.591ms|better: on 156µs, on 1.36%, in 1.0 times |
|Requests, count|2063784|1977373|more: 4.4% , in 1.0 times |
