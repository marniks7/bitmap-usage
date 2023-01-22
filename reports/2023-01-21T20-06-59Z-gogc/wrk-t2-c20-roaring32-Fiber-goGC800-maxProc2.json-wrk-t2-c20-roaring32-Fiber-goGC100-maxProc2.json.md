### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|288µs|better: on 25µs, on 9.51%, in 1.1 times |
|90%|537µs|676µs|better: on 139µs, on 25.88%, in 1.3 times |
|95%|619µs|1.182ms|better: on 563µs, on 90.95%, in 1.9 times , 1 order of magnitude|
|97%|679µs|2.563ms|better: on 1.884ms, on 277.47%, in 3.8 times , 1 order of magnitude|
|98%|760µs|3.749ms|better: on 2.989ms, on 393.29%, in 4.9 times , 1 order of magnitude|
|99%|997µs|5.576ms|better: on 4.579ms, on 459.28%, in 5.6 times , 1 order of magnitude|
|99.999%|10.692ms|11.676ms|better: on 984µs, on 9.20%, in 1.1 times |
|Requests, count|2152710|1884912|more: 14.2% , in 1.1 times |
