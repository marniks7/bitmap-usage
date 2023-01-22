### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.549ms|280µs|worth: on 3.269ms, on -92.11%, in 0.1 times , -1 order of magnitude|
|90%|6.985ms|605µs|worth: on 6.38ms, on -91.34%, in 0.1 times , -1 order of magnitude|
|95%|8.091ms|773µs|worth: on 7.318ms, on -90.45%, in 0.1 times , -1 order of magnitude|
|97%|8.621ms|1.159ms|worth: on 7.462ms, on -86.56%, in 0.1 times |
|98%|8.93ms|2.155ms|worth: on 6.775ms, on -75.87%, in 0.2 times |
|99%|9.398ms|4.146ms|worth: on 5.252ms, on -55.88%, in 0.4 times |
|99.999%|11.742ms|11.591ms|worth: on 151µs, on -1.29%, in 1.0 times |
|Requests, count|164298|1977373|less: -91.7% , in 0.1 times |
