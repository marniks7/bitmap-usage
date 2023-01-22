### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.581ms|253µs|worth: on 3.328ms, on -92.93%, in 0.1 times , -1 order of magnitude|
|90%|7.072ms|509µs|worth: on 6.563ms, on -92.80%, in 0.1 times , -1 order of magnitude|
|95%|8.168ms|585µs|worth: on 7.583ms, on -92.84%, in 0.1 times , -1 order of magnitude|
|97%|8.693ms|637µs|worth: on 8.056ms, on -92.67%, in 0.1 times , -1 order of magnitude|
|98%|9.083ms|692µs|worth: on 8.391ms, on -92.38%, in 0.1 times , -1 order of magnitude|
|99%|9.496ms|863µs|worth: on 8.633ms, on -90.91%, in 0.1 times , -1 order of magnitude|
|99.999%|14.528ms|9.59ms|worth: on 4.938ms, on -33.99%, in 0.7 times , -1 order of magnitude|
|Requests, count|163640|2250457|less: -92.7% , in 0.1 times |
