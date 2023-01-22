### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|273µs|better: on 6µs, on 2.25%, in 1.0 times |
|90%|554µs|567µs|better: on 13µs, on 2.35%, in 1.0 times |
|95%|646µs|664µs|better: on 18µs, on 2.79%, in 1.0 times |
|97%|749µs|802µs|better: on 53µs, on 7.08%, in 1.1 times |
|98%|886µs|1.05ms|better: on 164µs, on 18.51%, in 1.2 times , 1 order of magnitude|
|99%|1.545ms|2.817ms|better: on 1.272ms, on 82.33%, in 1.8 times |
|99.999%|13.086ms|11.435ms|worth: on 1.651ms, on -12.62%, in 0.9 times |
|Requests, count|2098189|2063784|more: 1.7% , in 1.0 times |
