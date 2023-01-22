### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|3.549ms|better: on 3.269ms, on 1167.50%, in 12.7 times , 1 order of magnitude|
|90%|605µs|6.985ms|better: on 6.38ms, on 1054.55%, in 11.5 times , 1 order of magnitude|
|95%|773µs|8.091ms|better: on 7.318ms, on 946.70%, in 10.5 times , 1 order of magnitude|
|97%|1.159ms|8.621ms|better: on 7.462ms, on 643.83%, in 7.4 times |
|98%|2.155ms|8.93ms|better: on 6.775ms, on 314.39%, in 4.1 times |
|99%|4.146ms|9.398ms|better: on 5.252ms, on 126.68%, in 2.3 times |
|99.999%|11.591ms|11.742ms|better: on 151µs, on 1.30%, in 1.0 times |
|Requests, count|1977373|164298|more: 1103.5% , in 12.0 times |
