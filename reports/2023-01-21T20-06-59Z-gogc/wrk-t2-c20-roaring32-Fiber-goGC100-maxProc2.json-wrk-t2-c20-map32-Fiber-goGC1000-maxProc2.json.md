### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|3.581ms|better: on 3.293ms, on 1143.40%, in 12.4 times , 1 order of magnitude|
|90%|676µs|7.072ms|better: on 6.396ms, on 946.15%, in 10.5 times , 1 order of magnitude|
|95%|1.182ms|8.168ms|better: on 6.986ms, on 591.03%, in 6.9 times |
|97%|2.563ms|8.693ms|better: on 6.13ms, on 239.17%, in 3.4 times |
|98%|3.749ms|9.083ms|better: on 5.334ms, on 142.28%, in 2.4 times |
|99%|5.576ms|9.496ms|better: on 3.92ms, on 70.30%, in 1.7 times |
|99.999%|11.676ms|14.528ms|better: on 2.852ms, on 24.43%, in 1.2 times |
|Requests, count|1884912|163640|more: 1051.9% , in 11.5 times |
