### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|273µs|worth: on 3.261ms, on -92.28%, in 0.1 times , -1 order of magnitude|
|90%|7.001ms|567µs|worth: on 6.434ms, on -91.90%, in 0.1 times , -1 order of magnitude|
|95%|8.092ms|664µs|worth: on 7.428ms, on -91.79%, in 0.1 times , -1 order of magnitude|
|97%|8.618ms|802µs|worth: on 7.816ms, on -90.69%, in 0.1 times , -1 order of magnitude|
|98%|8.953ms|1.05ms|worth: on 7.903ms, on -88.27%, in 0.1 times |
|99%|9.388ms|2.817ms|worth: on 6.571ms, on -69.99%, in 0.3 times |
|99.999%|11.856ms|11.435ms|worth: on 421µs, on -3.55%, in 1.0 times |
|Requests, count|164883|2063784|less: -92.0% , in 0.1 times |
