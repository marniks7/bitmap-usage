### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.559ms|253µs|worth: on 3.306ms, on -92.89%, in 0.1 times , -1 order of magnitude|
|90%|6.981ms|509µs|worth: on 6.472ms, on -92.71%, in 0.1 times , -1 order of magnitude|
|95%|8.082ms|585µs|worth: on 7.497ms, on -92.76%, in 0.1 times , -1 order of magnitude|
|97%|8.606ms|637µs|worth: on 7.969ms, on -92.60%, in 0.1 times , -1 order of magnitude|
|98%|8.921ms|692µs|worth: on 8.229ms, on -92.24%, in 0.1 times , -1 order of magnitude|
|99%|9.376ms|863µs|worth: on 8.513ms, on -90.80%, in 0.1 times , -1 order of magnitude|
|99.999%|11.642ms|9.59ms|worth: on 2.052ms, on -17.63%, in 0.8 times , -1 order of magnitude|
|Requests, count|164690|2250457|less: -92.7% , in 0.1 times |
