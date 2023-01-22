### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|267µs|worth: on 13µs, on -4.64%, in 1.0 times |
|90%|605µs|554µs|worth: on 51µs, on -8.43%, in 0.9 times |
|95%|773µs|646µs|worth: on 127µs, on -16.43%, in 0.8 times |
|97%|1.159ms|749µs|worth: on 410µs, on -35.38%, in 0.6 times , -1 order of magnitude|
|98%|2.155ms|886µs|worth: on 1.269ms, on -58.89%, in 0.4 times , -1 order of magnitude|
|99%|4.146ms|1.545ms|worth: on 2.601ms, on -62.74%, in 0.4 times |
|99.999%|11.591ms|13.086ms|better: on 1.495ms, on 12.90%, in 1.1 times |
|Requests, count|1977373|2098189|less: -5.8% , in 0.9 times |
