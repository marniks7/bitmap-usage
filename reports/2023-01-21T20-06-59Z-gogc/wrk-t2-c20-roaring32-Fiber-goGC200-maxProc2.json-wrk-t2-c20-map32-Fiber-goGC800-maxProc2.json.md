### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|3.534ms|better: on 3.254ms, on 1162.14%, in 12.6 times , 1 order of magnitude|
|90%|605µs|7.001ms|better: on 6.396ms, on 1057.19%, in 11.6 times , 1 order of magnitude|
|95%|773µs|8.092ms|better: on 7.319ms, on 946.83%, in 10.5 times , 1 order of magnitude|
|97%|1.159ms|8.618ms|better: on 7.459ms, on 643.57%, in 7.4 times |
|98%|2.155ms|8.953ms|better: on 6.798ms, on 315.45%, in 4.2 times |
|99%|4.146ms|9.388ms|better: on 5.242ms, on 126.44%, in 2.3 times |
|99.999%|11.591ms|11.856ms|better: on 265µs, on 2.29%, in 1.0 times |
|Requests, count|1977373|164883|more: 1099.3% , in 12.0 times |
