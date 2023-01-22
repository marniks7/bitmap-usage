### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|3.534ms|better: on 3.281ms, on 1296.84%, in 14.0 times , 1 order of magnitude|
|90%|509µs|7.001ms|better: on 6.492ms, on 1275.44%, in 13.8 times , 1 order of magnitude|
|95%|585µs|8.092ms|better: on 7.507ms, on 1283.25%, in 13.8 times , 1 order of magnitude|
|97%|637µs|8.618ms|better: on 7.981ms, on 1252.90%, in 13.5 times , 1 order of magnitude|
|98%|692µs|8.953ms|better: on 8.261ms, on 1193.79%, in 12.9 times , 1 order of magnitude|
|99%|863µs|9.388ms|better: on 8.525ms, on 987.83%, in 10.9 times , 1 order of magnitude|
|99.999%|9.59ms|11.856ms|better: on 2.266ms, on 23.63%, in 1.2 times , 1 order of magnitude|
|Requests, count|2250457|164883|more: 1264.9% , in 13.6 times |
