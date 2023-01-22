### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|254µs|3.791ms|better: on 3.537ms, on 1392.52%, in 14.9 times , 1 order of magnitude|
|90%|516µs|7.572ms|better: on 7.056ms, on 1367.44%, in 14.7 times , 1 order of magnitude|
|95%|597µs|8.707ms|better: on 8.11ms, on 1358.46%, in 14.6 times , 1 order of magnitude|
|97%|661µs|9.333ms|better: on 8.672ms, on 1311.95%, in 14.1 times , 1 order of magnitude|
|98%|736µs|9.732ms|better: on 8.996ms, on 1222.28%, in 13.2 times , 1 order of magnitude|
|99%|930µs|10.481ms|better: on 9.551ms, on 1026.99%, in 11.3 times , 2 order of magnitude|
|99.999%|10.253ms|24.058ms|better: on 13.805ms, on 134.64%, in 2.3 times |
|Requests, count|2224434|155306|more: 1332.3% , in 14.3 times |
