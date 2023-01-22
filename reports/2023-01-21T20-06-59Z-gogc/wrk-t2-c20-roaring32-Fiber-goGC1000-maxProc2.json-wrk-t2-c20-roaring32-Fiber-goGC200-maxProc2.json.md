### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|280µs|better: on 27µs, on 10.67%, in 1.1 times |
|90%|509µs|605µs|better: on 96µs, on 18.86%, in 1.2 times |
|95%|585µs|773µs|better: on 188µs, on 32.14%, in 1.3 times |
|97%|637µs|1.159ms|better: on 522µs, on 81.95%, in 1.8 times , 1 order of magnitude|
|98%|692µs|2.155ms|better: on 1.463ms, on 211.42%, in 3.1 times , 1 order of magnitude|
|99%|863µs|4.146ms|better: on 3.283ms, on 380.42%, in 4.8 times , 1 order of magnitude|
|99.999%|9.59ms|11.591ms|better: on 2.001ms, on 20.87%, in 1.2 times , 1 order of magnitude|
|Requests, count|2250457|1977373|more: 13.8% , in 1.1 times |
