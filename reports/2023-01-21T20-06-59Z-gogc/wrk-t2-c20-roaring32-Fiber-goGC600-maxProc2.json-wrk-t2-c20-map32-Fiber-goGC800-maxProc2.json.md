### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|3.534ms|better: on 3.267ms, on 1223.60%, in 13.2 times , 1 order of magnitude|
|90%|554µs|7.001ms|better: on 6.447ms, on 1163.72%, in 12.6 times , 1 order of magnitude|
|95%|646µs|8.092ms|better: on 7.446ms, on 1152.63%, in 12.5 times , 1 order of magnitude|
|97%|749µs|8.618ms|better: on 7.869ms, on 1050.60%, in 11.5 times , 1 order of magnitude|
|98%|886µs|8.953ms|better: on 8.067ms, on 910.50%, in 10.1 times , 1 order of magnitude|
|99%|1.545ms|9.388ms|better: on 7.843ms, on 507.64%, in 6.1 times |
|99.999%|13.086ms|11.856ms|worth: on 1.23ms, on -9.40%, in 0.9 times |
|Requests, count|2098189|164883|more: 1172.5% , in 12.7 times |
