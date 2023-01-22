### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|263µs|better: on 10µs, on 3.95%, in 1.0 times |
|90%|509µs|537µs|better: on 28µs, on 5.50%, in 1.1 times |
|95%|585µs|619µs|better: on 34µs, on 5.81%, in 1.1 times |
|97%|637µs|679µs|better: on 42µs, on 6.59%, in 1.1 times |
|98%|692µs|760µs|better: on 68µs, on 9.83%, in 1.1 times |
|99%|863µs|997µs|better: on 134µs, on 15.53%, in 1.2 times |
|99.999%|9.59ms|10.692ms|better: on 1.102ms, on 11.49%, in 1.1 times , 1 order of magnitude|
|Requests, count|2250457|2152710|more: 4.5% , in 1.0 times |
