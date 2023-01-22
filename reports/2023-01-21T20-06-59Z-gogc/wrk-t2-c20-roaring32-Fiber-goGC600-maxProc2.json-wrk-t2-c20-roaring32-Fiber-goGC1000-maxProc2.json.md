### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|253µs|worth: on 14µs, on -5.24%, in 0.9 times |
|90%|554µs|509µs|worth: on 45µs, on -8.12%, in 0.9 times |
|95%|646µs|585µs|worth: on 61µs, on -9.44%, in 0.9 times |
|97%|749µs|637µs|worth: on 112µs, on -14.95%, in 0.9 times |
|98%|886µs|692µs|worth: on 194µs, on -21.90%, in 0.8 times |
|99%|1.545ms|863µs|worth: on 682µs, on -44.14%, in 0.6 times , -1 order of magnitude|
|99.999%|13.086ms|9.59ms|worth: on 3.496ms, on -26.72%, in 0.7 times , -1 order of magnitude|
|Requests, count|2098189|2250457|less: -6.8% , in 0.9 times |
