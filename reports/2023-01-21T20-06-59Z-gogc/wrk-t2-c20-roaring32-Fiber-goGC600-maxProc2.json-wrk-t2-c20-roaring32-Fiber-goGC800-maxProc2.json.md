### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|263µs|worth: on 4µs, on -1.50%, in 1.0 times |
|90%|554µs|537µs|worth: on 17µs, on -3.07%, in 1.0 times |
|95%|646µs|619µs|worth: on 27µs, on -4.18%, in 1.0 times |
|97%|749µs|679µs|worth: on 70µs, on -9.35%, in 0.9 times |
|98%|886µs|760µs|worth: on 126µs, on -14.22%, in 0.9 times |
|99%|1.545ms|997µs|worth: on 548µs, on -35.47%, in 0.6 times , -1 order of magnitude|
|99.999%|13.086ms|10.692ms|worth: on 2.394ms, on -18.29%, in 0.8 times |
|Requests, count|2098189|2152710|less: -2.5% , in 1.0 times |
