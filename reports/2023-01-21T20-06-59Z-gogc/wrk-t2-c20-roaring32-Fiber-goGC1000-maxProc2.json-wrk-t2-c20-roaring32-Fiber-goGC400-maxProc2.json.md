### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|273µs|better: on 20µs, on 7.91%, in 1.1 times |
|90%|509µs|567µs|better: on 58µs, on 11.39%, in 1.1 times |
|95%|585µs|664µs|better: on 79µs, on 13.50%, in 1.1 times |
|97%|637µs|802µs|better: on 165µs, on 25.90%, in 1.3 times |
|98%|692µs|1.05ms|better: on 358µs, on 51.73%, in 1.5 times , 1 order of magnitude|
|99%|863µs|2.817ms|better: on 1.954ms, on 226.42%, in 3.3 times , 1 order of magnitude|
|99.999%|9.59ms|11.435ms|better: on 1.845ms, on 19.24%, in 1.2 times , 1 order of magnitude|
|Requests, count|2250457|2063784|more: 9.0% , in 1.1 times |
