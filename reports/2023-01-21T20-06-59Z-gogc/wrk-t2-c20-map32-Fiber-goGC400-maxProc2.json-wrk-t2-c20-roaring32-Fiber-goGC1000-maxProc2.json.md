### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.549ms|253µs|worth: on 3.296ms, on -92.87%, in 0.1 times , -1 order of magnitude|
|90%|6.985ms|509µs|worth: on 6.476ms, on -92.71%, in 0.1 times , -1 order of magnitude|
|95%|8.091ms|585µs|worth: on 7.506ms, on -92.77%, in 0.1 times , -1 order of magnitude|
|97%|8.621ms|637µs|worth: on 7.984ms, on -92.61%, in 0.1 times , -1 order of magnitude|
|98%|8.93ms|692µs|worth: on 8.238ms, on -92.25%, in 0.1 times , -1 order of magnitude|
|99%|9.398ms|863µs|worth: on 8.535ms, on -90.82%, in 0.1 times , -1 order of magnitude|
|99.999%|11.742ms|9.59ms|worth: on 2.152ms, on -18.33%, in 0.8 times , -1 order of magnitude|
|Requests, count|164298|2250457|less: -92.7% , in 0.1 times |
