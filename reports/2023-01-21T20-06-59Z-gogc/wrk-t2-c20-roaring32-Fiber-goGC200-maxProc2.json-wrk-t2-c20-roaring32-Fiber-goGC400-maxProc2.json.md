### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|273µs|worth: on 7µs, on -2.50%, in 1.0 times |
|90%|605µs|567µs|worth: on 38µs, on -6.28%, in 0.9 times |
|95%|773µs|664µs|worth: on 109µs, on -14.10%, in 0.9 times |
|97%|1.159ms|802µs|worth: on 357µs, on -30.80%, in 0.7 times , -1 order of magnitude|
|98%|2.155ms|1.05ms|worth: on 1.105ms, on -51.28%, in 0.5 times |
|99%|4.146ms|2.817ms|worth: on 1.329ms, on -32.05%, in 0.7 times |
|99.999%|11.591ms|11.435ms|worth: on 156µs, on -1.35%, in 1.0 times |
|Requests, count|1977373|2063784|less: -4.2% , in 1.0 times |
