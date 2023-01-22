### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|263µs|worth: on 25µs, on -8.68%, in 0.9 times |
|90%|676µs|537µs|worth: on 139µs, on -20.56%, in 0.8 times |
|95%|1.182ms|619µs|worth: on 563µs, on -47.63%, in 0.5 times , -1 order of magnitude|
|97%|2.563ms|679µs|worth: on 1.884ms, on -73.51%, in 0.3 times , -1 order of magnitude|
|98%|3.749ms|760µs|worth: on 2.989ms, on -79.73%, in 0.2 times , -1 order of magnitude|
|99%|5.576ms|997µs|worth: on 4.579ms, on -82.12%, in 0.2 times , -1 order of magnitude|
|99.999%|11.676ms|10.692ms|worth: on 984µs, on -8.43%, in 0.9 times |
|Requests, count|1884912|2152710|less: -12.4% , in 0.9 times |
