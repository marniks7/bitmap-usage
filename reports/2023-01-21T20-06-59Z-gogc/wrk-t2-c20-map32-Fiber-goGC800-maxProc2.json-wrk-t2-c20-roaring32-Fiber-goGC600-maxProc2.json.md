### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|267µs|worth: on 3.267ms, on -92.44%, in 0.1 times , -1 order of magnitude|
|90%|7.001ms|554µs|worth: on 6.447ms, on -92.09%, in 0.1 times , -1 order of magnitude|
|95%|8.092ms|646µs|worth: on 7.446ms, on -92.02%, in 0.1 times , -1 order of magnitude|
|97%|8.618ms|749µs|worth: on 7.869ms, on -91.31%, in 0.1 times , -1 order of magnitude|
|98%|8.953ms|886µs|worth: on 8.067ms, on -90.10%, in 0.1 times , -1 order of magnitude|
|99%|9.388ms|1.545ms|worth: on 7.843ms, on -83.54%, in 0.2 times |
|99.999%|11.856ms|13.086ms|better: on 1.23ms, on 10.37%, in 1.1 times |
|Requests, count|164883|2098189|less: -92.1% , in 0.1 times |
