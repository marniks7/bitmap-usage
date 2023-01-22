### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|267µs|worth: on 6µs, on -2.20%, in 1.0 times |
|90%|567µs|554µs|worth: on 13µs, on -2.29%, in 1.0 times |
|95%|664µs|646µs|worth: on 18µs, on -2.71%, in 1.0 times |
|97%|802µs|749µs|worth: on 53µs, on -6.61%, in 0.9 times |
|98%|1.05ms|886µs|worth: on 164µs, on -15.62%, in 0.8 times , -1 order of magnitude|
|99%|2.817ms|1.545ms|worth: on 1.272ms, on -45.15%, in 0.5 times |
|99.999%|11.435ms|13.086ms|better: on 1.651ms, on 14.44%, in 1.1 times |
|Requests, count|2063784|2098189|less: -1.6% , in 1.0 times |
