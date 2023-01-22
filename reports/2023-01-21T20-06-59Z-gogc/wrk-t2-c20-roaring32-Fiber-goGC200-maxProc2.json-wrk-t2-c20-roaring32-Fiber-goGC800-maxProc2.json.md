### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|263µs|worth: on 17µs, on -6.07%, in 0.9 times |
|90%|605µs|537µs|worth: on 68µs, on -11.24%, in 0.9 times |
|95%|773µs|619µs|worth: on 154µs, on -19.92%, in 0.8 times |
|97%|1.159ms|679µs|worth: on 480µs, on -41.42%, in 0.6 times , -1 order of magnitude|
|98%|2.155ms|760µs|worth: on 1.395ms, on -64.73%, in 0.4 times , -1 order of magnitude|
|99%|4.146ms|997µs|worth: on 3.149ms, on -75.95%, in 0.2 times , -1 order of magnitude|
|99.999%|11.591ms|10.692ms|worth: on 899µs, on -7.76%, in 0.9 times |
|Requests, count|1977373|2152710|less: -8.1% , in 0.9 times |
