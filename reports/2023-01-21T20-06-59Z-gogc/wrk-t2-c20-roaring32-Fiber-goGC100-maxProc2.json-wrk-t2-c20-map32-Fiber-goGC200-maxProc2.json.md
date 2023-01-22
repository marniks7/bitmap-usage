### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|3.572ms|better: on 3.284ms, on 1140.28%, in 12.4 times , 1 order of magnitude|
|90%|676µs|7.055ms|better: on 6.379ms, on 943.64%, in 10.4 times , 1 order of magnitude|
|95%|1.182ms|8.162ms|better: on 6.98ms, on 590.52%, in 6.9 times |
|97%|2.563ms|8.682ms|better: on 6.119ms, on 238.74%, in 3.4 times |
|98%|3.749ms|9.031ms|better: on 5.282ms, on 140.89%, in 2.4 times |
|99%|5.576ms|9.464ms|better: on 3.888ms, on 69.73%, in 1.7 times |
|99.999%|11.676ms|11.692ms|better: on 16µs, on 0.14%, in 1.0 times |
|Requests, count|1884912|163501|more: 1052.8% , in 11.5 times |
