### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|267µs|better: on 14µs, on 5.53%, in 1.1 times |
|90%|509µs|554µs|better: on 45µs, on 8.84%, in 1.1 times |
|95%|585µs|646µs|better: on 61µs, on 10.43%, in 1.1 times |
|97%|637µs|749µs|better: on 112µs, on 17.58%, in 1.2 times |
|98%|692µs|886µs|better: on 194µs, on 28.03%, in 1.3 times |
|99%|863µs|1.545ms|better: on 682µs, on 79.03%, in 1.8 times , 1 order of magnitude|
|99.999%|9.59ms|13.086ms|better: on 3.496ms, on 36.45%, in 1.4 times , 1 order of magnitude|
|Requests, count|2250457|2098189|more: 7.3% , in 1.1 times |
