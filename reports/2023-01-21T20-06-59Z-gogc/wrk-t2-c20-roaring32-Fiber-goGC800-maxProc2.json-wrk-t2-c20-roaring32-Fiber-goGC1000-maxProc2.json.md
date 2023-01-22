### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|253µs|worth: on 10µs, on -3.80%, in 1.0 times |
|90%|537µs|509µs|worth: on 28µs, on -5.21%, in 0.9 times |
|95%|619µs|585µs|worth: on 34µs, on -5.49%, in 0.9 times |
|97%|679µs|637µs|worth: on 42µs, on -6.19%, in 0.9 times |
|98%|760µs|692µs|worth: on 68µs, on -8.95%, in 0.9 times |
|99%|997µs|863µs|worth: on 134µs, on -13.44%, in 0.9 times |
|99.999%|10.692ms|9.59ms|worth: on 1.102ms, on -10.31%, in 0.9 times , -1 order of magnitude|
|Requests, count|2152710|2250457|less: -4.3% , in 1.0 times |
