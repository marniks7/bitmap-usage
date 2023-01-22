### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|3.534ms|better: on 3.246ms, on 1127.08%, in 12.3 times , 1 order of magnitude|
|90%|676µs|7.001ms|better: on 6.325ms, on 935.65%, in 10.4 times , 1 order of magnitude|
|95%|1.182ms|8.092ms|better: on 6.91ms, on 584.60%, in 6.8 times |
|97%|2.563ms|8.618ms|better: on 6.055ms, on 236.25%, in 3.4 times |
|98%|3.749ms|8.953ms|better: on 5.204ms, on 138.81%, in 2.4 times |
|99%|5.576ms|9.388ms|better: on 3.812ms, on 68.36%, in 1.7 times |
|99.999%|11.676ms|11.856ms|better: on 180µs, on 1.54%, in 1.0 times |
|Requests, count|1884912|164883|more: 1043.2% , in 11.4 times |
