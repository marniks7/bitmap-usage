### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|280µs|better: on 13µs, on 4.87%, in 1.0 times |
|90%|554µs|605µs|better: on 51µs, on 9.21%, in 1.1 times |
|95%|646µs|773µs|better: on 127µs, on 19.66%, in 1.2 times |
|97%|749µs|1.159ms|better: on 410µs, on 54.74%, in 1.5 times , 1 order of magnitude|
|98%|886µs|2.155ms|better: on 1.269ms, on 143.23%, in 2.4 times , 1 order of magnitude|
|99%|1.545ms|4.146ms|better: on 2.601ms, on 168.35%, in 2.7 times |
|99.999%|13.086ms|11.591ms|worth: on 1.495ms, on -11.42%, in 0.9 times |
|Requests, count|2098189|1977373|more: 6.1% , in 1.1 times |
