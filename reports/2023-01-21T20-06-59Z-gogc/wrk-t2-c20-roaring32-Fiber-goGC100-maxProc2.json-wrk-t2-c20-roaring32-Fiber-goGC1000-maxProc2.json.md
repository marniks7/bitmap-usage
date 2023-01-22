### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|253µs|worth: on 35µs, on -12.15%, in 0.9 times |
|90%|676µs|509µs|worth: on 167µs, on -24.70%, in 0.8 times |
|95%|1.182ms|585µs|worth: on 597µs, on -50.51%, in 0.5 times , -1 order of magnitude|
|97%|2.563ms|637µs|worth: on 1.926ms, on -75.15%, in 0.2 times , -1 order of magnitude|
|98%|3.749ms|692µs|worth: on 3.057ms, on -81.54%, in 0.2 times , -1 order of magnitude|
|99%|5.576ms|863µs|worth: on 4.713ms, on -84.52%, in 0.2 times , -1 order of magnitude|
|99.999%|11.676ms|9.59ms|worth: on 2.086ms, on -17.87%, in 0.8 times , -1 order of magnitude|
|Requests, count|1884912|2250457|less: -16.2% , in 0.8 times |
