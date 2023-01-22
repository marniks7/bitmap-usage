### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|273µs|better: on 10µs, on 3.80%, in 1.0 times |
|90%|537µs|567µs|better: on 30µs, on 5.59%, in 1.1 times |
|95%|619µs|664µs|better: on 45µs, on 7.27%, in 1.1 times |
|97%|679µs|802µs|better: on 123µs, on 18.11%, in 1.2 times |
|98%|760µs|1.05ms|better: on 290µs, on 38.16%, in 1.4 times , 1 order of magnitude|
|99%|997µs|2.817ms|better: on 1.82ms, on 182.55%, in 2.8 times , 1 order of magnitude|
|99.999%|10.692ms|11.435ms|better: on 743µs, on 6.95%, in 1.1 times |
|Requests, count|2152710|2063784|more: 4.3% , in 1.0 times |
