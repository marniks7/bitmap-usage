### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.54ms|253µs|worth: on 3.287ms, on -92.85%, in 0.1 times , -1 order of magnitude|
|90%|7.023ms|509µs|worth: on 6.514ms, on -92.75%, in 0.1 times , -1 order of magnitude|
|95%|8.12ms|585µs|worth: on 7.535ms, on -92.80%, in 0.1 times , -1 order of magnitude|
|97%|8.643ms|637µs|worth: on 8.006ms, on -92.63%, in 0.1 times , -1 order of magnitude|
|98%|9.005ms|692µs|worth: on 8.313ms, on -92.32%, in 0.1 times , -1 order of magnitude|
|99%|9.442ms|863µs|worth: on 8.579ms, on -90.86%, in 0.1 times , -1 order of magnitude|
|99.999%|18.167ms|9.59ms|worth: on 8.577ms, on -47.21%, in 0.5 times , -1 order of magnitude|
|Requests, count|164757|2250457|less: -92.7% , in 0.1 times |
