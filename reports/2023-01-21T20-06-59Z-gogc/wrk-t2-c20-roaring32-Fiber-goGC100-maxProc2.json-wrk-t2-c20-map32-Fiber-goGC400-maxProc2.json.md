### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|3.549ms|better: on 3.261ms, on 1132.29%, in 12.3 times , 1 order of magnitude|
|90%|676µs|6.985ms|better: on 6.309ms, on 933.28%, in 10.3 times , 1 order of magnitude|
|95%|1.182ms|8.091ms|better: on 6.909ms, on 584.52%, in 6.8 times |
|97%|2.563ms|8.621ms|better: on 6.058ms, on 236.36%, in 3.4 times |
|98%|3.749ms|8.93ms|better: on 5.181ms, on 138.20%, in 2.4 times |
|99%|5.576ms|9.398ms|better: on 3.822ms, on 68.54%, in 1.7 times |
|99.999%|11.676ms|11.742ms|better: on 66µs, on 0.57%, in 1.0 times |
|Requests, count|1884912|164298|more: 1047.3% , in 11.5 times |
