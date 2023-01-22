### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.549ms|267µs|worth: on 3.282ms, on -92.48%, in 0.1 times , -1 order of magnitude|
|90%|6.985ms|554µs|worth: on 6.431ms, on -92.07%, in 0.1 times , -1 order of magnitude|
|95%|8.091ms|646µs|worth: on 7.445ms, on -92.02%, in 0.1 times , -1 order of magnitude|
|97%|8.621ms|749µs|worth: on 7.872ms, on -91.31%, in 0.1 times , -1 order of magnitude|
|98%|8.93ms|886µs|worth: on 8.044ms, on -90.08%, in 0.1 times , -1 order of magnitude|
|99%|9.398ms|1.545ms|worth: on 7.853ms, on -83.56%, in 0.2 times |
|99.999%|11.742ms|13.086ms|better: on 1.344ms, on 11.45%, in 1.1 times |
|Requests, count|164298|2098189|less: -92.2% , in 0.1 times |
