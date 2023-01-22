### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|280µs|worth: on 3.254ms, on -92.08%, in 0.1 times , -1 order of magnitude|
|90%|7.001ms|605µs|worth: on 6.396ms, on -91.36%, in 0.1 times , -1 order of magnitude|
|95%|8.092ms|773µs|worth: on 7.319ms, on -90.45%, in 0.1 times , -1 order of magnitude|
|97%|8.618ms|1.159ms|worth: on 7.459ms, on -86.55%, in 0.1 times |
|98%|8.953ms|2.155ms|worth: on 6.798ms, on -75.93%, in 0.2 times |
|99%|9.388ms|4.146ms|worth: on 5.242ms, on -55.84%, in 0.4 times |
|99.999%|11.856ms|11.591ms|worth: on 265µs, on -2.24%, in 1.0 times |
|Requests, count|164883|1977373|less: -91.7% , in 0.1 times |
