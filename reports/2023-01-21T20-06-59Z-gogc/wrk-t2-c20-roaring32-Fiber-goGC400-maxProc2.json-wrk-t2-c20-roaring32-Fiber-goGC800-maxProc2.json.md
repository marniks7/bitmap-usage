### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|263µs|worth: on 10µs, on -3.66%, in 1.0 times |
|90%|567µs|537µs|worth: on 30µs, on -5.29%, in 0.9 times |
|95%|664µs|619µs|worth: on 45µs, on -6.78%, in 0.9 times |
|97%|802µs|679µs|worth: on 123µs, on -15.34%, in 0.8 times |
|98%|1.05ms|760µs|worth: on 290µs, on -27.62%, in 0.7 times , -1 order of magnitude|
|99%|2.817ms|997µs|worth: on 1.82ms, on -64.61%, in 0.4 times , -1 order of magnitude|
|99.999%|11.435ms|10.692ms|worth: on 743µs, on -6.50%, in 0.9 times |
|Requests, count|2063784|2152710|less: -4.1% , in 1.0 times |
