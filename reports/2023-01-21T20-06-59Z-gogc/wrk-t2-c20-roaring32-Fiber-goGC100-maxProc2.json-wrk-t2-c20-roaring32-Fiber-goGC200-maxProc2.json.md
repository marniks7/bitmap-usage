### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|280µs|worth: on 8µs, on -2.78%, in 1.0 times |
|90%|676µs|605µs|worth: on 71µs, on -10.50%, in 0.9 times |
|95%|1.182ms|773µs|worth: on 409µs, on -34.60%, in 0.7 times , -1 order of magnitude|
|97%|2.563ms|1.159ms|worth: on 1.404ms, on -54.78%, in 0.5 times |
|98%|3.749ms|2.155ms|worth: on 1.594ms, on -42.52%, in 0.6 times |
|99%|5.576ms|4.146ms|worth: on 1.43ms, on -25.65%, in 0.7 times |
|99.999%|11.676ms|11.591ms|worth: on 85µs, on -0.73%, in 1.0 times |
|Requests, count|1884912|1977373|less: -4.7% , in 1.0 times |
