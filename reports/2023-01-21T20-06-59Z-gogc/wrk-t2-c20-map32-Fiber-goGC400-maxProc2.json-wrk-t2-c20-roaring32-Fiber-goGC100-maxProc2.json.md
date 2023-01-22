### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.549ms|288µs|worth: on 3.261ms, on -91.89%, in 0.1 times , -1 order of magnitude|
|90%|6.985ms|676µs|worth: on 6.309ms, on -90.32%, in 0.1 times , -1 order of magnitude|
|95%|8.091ms|1.182ms|worth: on 6.909ms, on -85.39%, in 0.1 times |
|97%|8.621ms|2.563ms|worth: on 6.058ms, on -70.27%, in 0.3 times |
|98%|8.93ms|3.749ms|worth: on 5.181ms, on -58.02%, in 0.4 times |
|99%|9.398ms|5.576ms|worth: on 3.822ms, on -40.67%, in 0.6 times |
|99.999%|11.742ms|11.676ms|worth: on 66µs, on -0.56%, in 1.0 times |
|Requests, count|164298|1884912|less: -91.3% , in 0.1 times |
