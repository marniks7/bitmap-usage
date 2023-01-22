### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|280µs|better: on 17µs, on 6.46%, in 1.1 times |
|90%|537µs|605µs|better: on 68µs, on 12.66%, in 1.1 times |
|95%|619µs|773µs|better: on 154µs, on 24.88%, in 1.2 times |
|97%|679µs|1.159ms|better: on 480µs, on 70.69%, in 1.7 times , 1 order of magnitude|
|98%|760µs|2.155ms|better: on 1.395ms, on 183.55%, in 2.8 times , 1 order of magnitude|
|99%|997µs|4.146ms|better: on 3.149ms, on 315.85%, in 4.2 times , 1 order of magnitude|
|99.999%|10.692ms|11.591ms|better: on 899µs, on 8.41%, in 1.1 times |
|Requests, count|2152710|1977373|more: 8.9% , in 1.1 times |
