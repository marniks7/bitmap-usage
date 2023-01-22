### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|253µs|worth: on 27µs, on -9.64%, in 0.9 times |
|90%|605µs|509µs|worth: on 96µs, on -15.87%, in 0.8 times |
|95%|773µs|585µs|worth: on 188µs, on -24.32%, in 0.8 times |
|97%|1.159ms|637µs|worth: on 522µs, on -45.04%, in 0.5 times , -1 order of magnitude|
|98%|2.155ms|692µs|worth: on 1.463ms, on -67.89%, in 0.3 times , -1 order of magnitude|
|99%|4.146ms|863µs|worth: on 3.283ms, on -79.18%, in 0.2 times , -1 order of magnitude|
|99.999%|11.591ms|9.59ms|worth: on 2.001ms, on -17.26%, in 0.8 times , -1 order of magnitude|
|Requests, count|1977373|2250457|less: -12.1% , in 0.9 times |
