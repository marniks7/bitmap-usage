### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|3.572ms|better: on 3.319ms, on 1311.86%, in 14.1 times , 1 order of magnitude|
|90%|509µs|7.055ms|better: on 6.546ms, on 1286.05%, in 13.9 times , 1 order of magnitude|
|95%|585µs|8.162ms|better: on 7.577ms, on 1295.21%, in 14.0 times , 1 order of magnitude|
|97%|637µs|8.682ms|better: on 8.045ms, on 1262.95%, in 13.6 times , 1 order of magnitude|
|98%|692µs|9.031ms|better: on 8.339ms, on 1205.06%, in 13.1 times , 1 order of magnitude|
|99%|863µs|9.464ms|better: on 8.601ms, on 996.64%, in 11.0 times , 1 order of magnitude|
|99.999%|9.59ms|11.692ms|better: on 2.102ms, on 21.92%, in 1.2 times , 1 order of magnitude|
|Requests, count|2250457|163501|more: 1276.4% , in 13.8 times |
