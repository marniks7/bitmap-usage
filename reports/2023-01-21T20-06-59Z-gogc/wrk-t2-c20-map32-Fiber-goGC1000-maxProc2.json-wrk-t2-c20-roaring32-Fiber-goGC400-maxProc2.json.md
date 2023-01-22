### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.581ms|273µs|worth: on 3.308ms, on -92.38%, in 0.1 times , -1 order of magnitude|
|90%|7.072ms|567µs|worth: on 6.505ms, on -91.98%, in 0.1 times , -1 order of magnitude|
|95%|8.168ms|664µs|worth: on 7.504ms, on -91.87%, in 0.1 times , -1 order of magnitude|
|97%|8.693ms|802µs|worth: on 7.891ms, on -90.77%, in 0.1 times , -1 order of magnitude|
|98%|9.083ms|1.05ms|worth: on 8.033ms, on -88.44%, in 0.1 times |
|99%|9.496ms|2.817ms|worth: on 6.679ms, on -70.33%, in 0.3 times |
|99.999%|14.528ms|11.435ms|worth: on 3.093ms, on -21.29%, in 0.8 times |
|Requests, count|163640|2063784|less: -92.1% , in 0.1 times |
