### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|267µs|better: on 4µs, on 1.52%, in 1.0 times |
|90%|537µs|554µs|better: on 17µs, on 3.17%, in 1.0 times |
|95%|619µs|646µs|better: on 27µs, on 4.36%, in 1.0 times |
|97%|679µs|749µs|better: on 70µs, on 10.31%, in 1.1 times |
|98%|760µs|886µs|better: on 126µs, on 16.58%, in 1.2 times |
|99%|997µs|1.545ms|better: on 548µs, on 54.96%, in 1.5 times , 1 order of magnitude|
|99.999%|10.692ms|13.086ms|better: on 2.394ms, on 22.39%, in 1.2 times |
|Requests, count|2152710|2098189|more: 2.6% , in 1.0 times |
