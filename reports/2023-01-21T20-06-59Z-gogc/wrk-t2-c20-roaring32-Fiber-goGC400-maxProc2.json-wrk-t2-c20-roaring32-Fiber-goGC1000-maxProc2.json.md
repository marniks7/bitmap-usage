### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|253µs|worth: on 20µs, on -7.33%, in 0.9 times |
|90%|567µs|509µs|worth: on 58µs, on -10.23%, in 0.9 times |
|95%|664µs|585µs|worth: on 79µs, on -11.90%, in 0.9 times |
|97%|802µs|637µs|worth: on 165µs, on -20.57%, in 0.8 times |
|98%|1.05ms|692µs|worth: on 358µs, on -34.10%, in 0.7 times , -1 order of magnitude|
|99%|2.817ms|863µs|worth: on 1.954ms, on -69.36%, in 0.3 times , -1 order of magnitude|
|99.999%|11.435ms|9.59ms|worth: on 1.845ms, on -16.13%, in 0.8 times , -1 order of magnitude|
|Requests, count|2063784|2250457|less: -8.3% , in 0.9 times |
