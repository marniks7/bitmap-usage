### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.54ms|263µs|worth: on 3.277ms, on -92.57%, in 0.1 times , -1 order of magnitude|
|90%|7.023ms|537µs|worth: on 6.486ms, on -92.35%, in 0.1 times , -1 order of magnitude|
|95%|8.12ms|619µs|worth: on 7.501ms, on -92.38%, in 0.1 times , -1 order of magnitude|
|97%|8.643ms|679µs|worth: on 7.964ms, on -92.14%, in 0.1 times , -1 order of magnitude|
|98%|9.005ms|760µs|worth: on 8.245ms, on -91.56%, in 0.1 times , -1 order of magnitude|
|99%|9.442ms|997µs|worth: on 8.445ms, on -89.44%, in 0.1 times , -1 order of magnitude|
|99.999%|18.167ms|10.692ms|worth: on 7.475ms, on -41.15%, in 0.6 times |
|Requests, count|164757|2152710|less: -92.3% , in 0.1 times |
