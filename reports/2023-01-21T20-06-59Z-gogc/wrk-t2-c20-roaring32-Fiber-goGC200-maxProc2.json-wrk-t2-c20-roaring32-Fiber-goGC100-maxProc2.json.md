### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|288µs|better: on 8µs, on 2.86%, in 1.0 times |
|90%|605µs|676µs|better: on 71µs, on 11.74%, in 1.1 times |
|95%|773µs|1.182ms|better: on 409µs, on 52.91%, in 1.5 times , 1 order of magnitude|
|97%|1.159ms|2.563ms|better: on 1.404ms, on 121.14%, in 2.2 times |
|98%|2.155ms|3.749ms|better: on 1.594ms, on 73.97%, in 1.7 times |
|99%|4.146ms|5.576ms|better: on 1.43ms, on 34.49%, in 1.3 times |
|99.999%|11.591ms|11.676ms|better: on 85µs, on 0.73%, in 1.0 times |
|Requests, count|1977373|1884912|more: 4.9% , in 1.0 times |
