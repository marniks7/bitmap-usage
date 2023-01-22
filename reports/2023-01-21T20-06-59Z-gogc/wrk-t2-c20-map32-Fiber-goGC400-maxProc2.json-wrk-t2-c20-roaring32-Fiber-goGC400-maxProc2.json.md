### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.549ms|273µs|worth: on 3.276ms, on -92.31%, in 0.1 times , -1 order of magnitude|
|90%|6.985ms|567µs|worth: on 6.418ms, on -91.88%, in 0.1 times , -1 order of magnitude|
|95%|8.091ms|664µs|worth: on 7.427ms, on -91.79%, in 0.1 times , -1 order of magnitude|
|97%|8.621ms|802µs|worth: on 7.819ms, on -90.70%, in 0.1 times , -1 order of magnitude|
|98%|8.93ms|1.05ms|worth: on 7.88ms, on -88.24%, in 0.1 times |
|99%|9.398ms|2.817ms|worth: on 6.581ms, on -70.03%, in 0.3 times |
|99.999%|11.742ms|11.435ms|worth: on 307µs, on -2.61%, in 1.0 times |
|Requests, count|164298|2063784|less: -92.0% , in 0.1 times |
