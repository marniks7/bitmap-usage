### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.54ms|273µs|worth: on 3.267ms, on -92.29%, in 0.1 times , -1 order of magnitude|
|90%|7.023ms|567µs|worth: on 6.456ms, on -91.93%, in 0.1 times , -1 order of magnitude|
|95%|8.12ms|664µs|worth: on 7.456ms, on -91.82%, in 0.1 times , -1 order of magnitude|
|97%|8.643ms|802µs|worth: on 7.841ms, on -90.72%, in 0.1 times , -1 order of magnitude|
|98%|9.005ms|1.05ms|worth: on 7.955ms, on -88.34%, in 0.1 times |
|99%|9.442ms|2.817ms|worth: on 6.625ms, on -70.17%, in 0.3 times |
|99.999%|18.167ms|11.435ms|worth: on 6.732ms, on -37.06%, in 0.6 times |
|Requests, count|164757|2063784|less: -92.0% , in 0.1 times |
