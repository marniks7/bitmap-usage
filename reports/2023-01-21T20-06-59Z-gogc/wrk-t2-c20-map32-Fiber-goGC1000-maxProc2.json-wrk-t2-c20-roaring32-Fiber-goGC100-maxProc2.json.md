### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.581ms|288µs|worth: on 3.293ms, on -91.96%, in 0.1 times , -1 order of magnitude|
|90%|7.072ms|676µs|worth: on 6.396ms, on -90.44%, in 0.1 times , -1 order of magnitude|
|95%|8.168ms|1.182ms|worth: on 6.986ms, on -85.53%, in 0.1 times |
|97%|8.693ms|2.563ms|worth: on 6.13ms, on -70.52%, in 0.3 times |
|98%|9.083ms|3.749ms|worth: on 5.334ms, on -58.73%, in 0.4 times |
|99%|9.496ms|5.576ms|worth: on 3.92ms, on -41.28%, in 0.6 times |
|99.999%|14.528ms|11.676ms|worth: on 2.852ms, on -19.63%, in 0.8 times |
|Requests, count|163640|1884912|less: -91.3% , in 0.1 times |
