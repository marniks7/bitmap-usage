### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.559ms|273µs|worth: on 3.286ms, on -92.33%, in 0.1 times , -1 order of magnitude|
|90%|6.981ms|567µs|worth: on 6.414ms, on -91.88%, in 0.1 times , -1 order of magnitude|
|95%|8.082ms|664µs|worth: on 7.418ms, on -91.78%, in 0.1 times , -1 order of magnitude|
|97%|8.606ms|802µs|worth: on 7.804ms, on -90.68%, in 0.1 times , -1 order of magnitude|
|98%|8.921ms|1.05ms|worth: on 7.871ms, on -88.23%, in 0.1 times |
|99%|9.376ms|2.817ms|worth: on 6.559ms, on -69.96%, in 0.3 times |
|99.999%|11.642ms|11.435ms|worth: on 207µs, on -1.78%, in 1.0 times |
|Requests, count|164690|2063784|less: -92.0% , in 0.1 times |
