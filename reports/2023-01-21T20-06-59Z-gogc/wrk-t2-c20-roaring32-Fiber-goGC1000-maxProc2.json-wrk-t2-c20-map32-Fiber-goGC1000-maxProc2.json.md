### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|3.581ms|better: on 3.328ms, on 1315.42%, in 14.2 times , 1 order of magnitude|
|90%|509µs|7.072ms|better: on 6.563ms, on 1289.39%, in 13.9 times , 1 order of magnitude|
|95%|585µs|8.168ms|better: on 7.583ms, on 1296.24%, in 14.0 times , 1 order of magnitude|
|97%|637µs|8.693ms|better: on 8.056ms, on 1264.68%, in 13.6 times , 1 order of magnitude|
|98%|692µs|9.083ms|better: on 8.391ms, on 1212.57%, in 13.1 times , 1 order of magnitude|
|99%|863µs|9.496ms|better: on 8.633ms, on 1000.35%, in 11.0 times , 1 order of magnitude|
|99.999%|9.59ms|14.528ms|better: on 4.938ms, on 51.49%, in 1.5 times , 1 order of magnitude|
|Requests, count|2250457|163640|more: 1275.2% , in 13.8 times |
