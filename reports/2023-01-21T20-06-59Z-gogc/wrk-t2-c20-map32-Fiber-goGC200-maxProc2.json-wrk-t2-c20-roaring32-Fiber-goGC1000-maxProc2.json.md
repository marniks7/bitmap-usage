### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.572ms|253µs|worth: on 3.319ms, on -92.92%, in 0.1 times , -1 order of magnitude|
|90%|7.055ms|509µs|worth: on 6.546ms, on -92.79%, in 0.1 times , -1 order of magnitude|
|95%|8.162ms|585µs|worth: on 7.577ms, on -92.83%, in 0.1 times , -1 order of magnitude|
|97%|8.682ms|637µs|worth: on 8.045ms, on -92.66%, in 0.1 times , -1 order of magnitude|
|98%|9.031ms|692µs|worth: on 8.339ms, on -92.34%, in 0.1 times , -1 order of magnitude|
|99%|9.464ms|863µs|worth: on 8.601ms, on -90.88%, in 0.1 times , -1 order of magnitude|
|99.999%|11.692ms|9.59ms|worth: on 2.102ms, on -17.98%, in 0.8 times , -1 order of magnitude|
|Requests, count|163501|2250457|less: -92.7% , in 0.1 times |
