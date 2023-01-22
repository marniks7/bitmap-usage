### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.572ms|288µs|worth: on 3.284ms, on -91.94%, in 0.1 times , -1 order of magnitude|
|90%|7.055ms|676µs|worth: on 6.379ms, on -90.42%, in 0.1 times , -1 order of magnitude|
|95%|8.162ms|1.182ms|worth: on 6.98ms, on -85.52%, in 0.1 times |
|97%|8.682ms|2.563ms|worth: on 6.119ms, on -70.48%, in 0.3 times |
|98%|9.031ms|3.749ms|worth: on 5.282ms, on -58.49%, in 0.4 times |
|99%|9.464ms|5.576ms|worth: on 3.888ms, on -41.08%, in 0.6 times |
|99.999%|11.692ms|11.676ms|worth: on 16µs, on -0.14%, in 1.0 times |
|Requests, count|163501|1884912|less: -91.3% , in 0.1 times |
