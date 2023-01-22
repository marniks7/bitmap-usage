### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|253µs|worth: on 3.281ms, on -92.84%, in 0.1 times , -1 order of magnitude|
|90%|7.001ms|509µs|worth: on 6.492ms, on -92.73%, in 0.1 times , -1 order of magnitude|
|95%|8.092ms|585µs|worth: on 7.507ms, on -92.77%, in 0.1 times , -1 order of magnitude|
|97%|8.618ms|637µs|worth: on 7.981ms, on -92.61%, in 0.1 times , -1 order of magnitude|
|98%|8.953ms|692µs|worth: on 8.261ms, on -92.27%, in 0.1 times , -1 order of magnitude|
|99%|9.388ms|863µs|worth: on 8.525ms, on -90.81%, in 0.1 times , -1 order of magnitude|
|99.999%|11.856ms|9.59ms|worth: on 2.266ms, on -19.11%, in 0.8 times , -1 order of magnitude|
|Requests, count|164883|2250457|less: -92.7% , in 0.1 times |
