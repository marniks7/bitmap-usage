### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|3.549ms|better: on 3.296ms, on 1302.77%, in 14.0 times , 1 order of magnitude|
|90%|509µs|6.985ms|better: on 6.476ms, on 1272.30%, in 13.7 times , 1 order of magnitude|
|95%|585µs|8.091ms|better: on 7.506ms, on 1283.08%, in 13.8 times , 1 order of magnitude|
|97%|637µs|8.621ms|better: on 7.984ms, on 1253.38%, in 13.5 times , 1 order of magnitude|
|98%|692µs|8.93ms|better: on 8.238ms, on 1190.46%, in 12.9 times , 1 order of magnitude|
|99%|863µs|9.398ms|better: on 8.535ms, on 988.99%, in 10.9 times , 1 order of magnitude|
|99.999%|9.59ms|11.742ms|better: on 2.152ms, on 22.44%, in 1.2 times , 1 order of magnitude|
|Requests, count|2250457|164298|more: 1269.7% , in 13.7 times |
