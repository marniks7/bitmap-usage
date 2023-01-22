### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|3.549ms|better: on 3.282ms, on 1229.21%, in 13.3 times , 1 order of magnitude|
|90%|554µs|6.985ms|better: on 6.431ms, on 1160.83%, in 12.6 times , 1 order of magnitude|
|95%|646µs|8.091ms|better: on 7.445ms, on 1152.48%, in 12.5 times , 1 order of magnitude|
|97%|749µs|8.621ms|better: on 7.872ms, on 1051.00%, in 11.5 times , 1 order of magnitude|
|98%|886µs|8.93ms|better: on 8.044ms, on 907.90%, in 10.1 times , 1 order of magnitude|
|99%|1.545ms|9.398ms|better: on 7.853ms, on 508.28%, in 6.1 times |
|99.999%|13.086ms|11.742ms|worth: on 1.344ms, on -10.27%, in 0.9 times |
|Requests, count|2098189|164298|more: 1177.1% , in 12.8 times |
