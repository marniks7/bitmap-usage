### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.791ms|254µs|worth: on 3.537ms, on -93.30%, in 0.1 times , -1 order of magnitude|
|90%|7.572ms|516µs|worth: on 7.056ms, on -93.19%, in 0.1 times , -1 order of magnitude|
|95%|8.707ms|597µs|worth: on 8.11ms, on -93.14%, in 0.1 times , -1 order of magnitude|
|97%|9.333ms|661µs|worth: on 8.672ms, on -92.92%, in 0.1 times , -1 order of magnitude|
|98%|9.732ms|736µs|worth: on 8.996ms, on -92.44%, in 0.1 times , -1 order of magnitude|
|99%|10.481ms|930µs|worth: on 9.551ms, on -91.13%, in 0.1 times , -2 order of magnitude|
|99.999%|24.058ms|10.253ms|worth: on 13.805ms, on -57.38%, in 0.4 times |
|Requests, count|155306|2224434|less: -93.0% , in 0.1 times |
