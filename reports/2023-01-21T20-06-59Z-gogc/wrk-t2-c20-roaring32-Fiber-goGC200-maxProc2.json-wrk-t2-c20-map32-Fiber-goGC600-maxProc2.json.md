### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|3.559ms|better: on 3.279ms, on 1171.07%, in 12.7 times , 1 order of magnitude|
|90%|605µs|6.981ms|better: on 6.376ms, on 1053.88%, in 11.5 times , 1 order of magnitude|
|95%|773µs|8.082ms|better: on 7.309ms, on 945.54%, in 10.5 times , 1 order of magnitude|
|97%|1.159ms|8.606ms|better: on 7.447ms, on 642.54%, in 7.4 times |
|98%|2.155ms|8.921ms|better: on 6.766ms, on 313.97%, in 4.1 times |
|99%|4.146ms|9.376ms|better: on 5.23ms, on 126.15%, in 2.3 times |
|99.999%|11.591ms|11.642ms|better: on 51µs, on 0.44%, in 1.0 times |
|Requests, count|1977373|164690|more: 1100.7% , in 12.0 times |
