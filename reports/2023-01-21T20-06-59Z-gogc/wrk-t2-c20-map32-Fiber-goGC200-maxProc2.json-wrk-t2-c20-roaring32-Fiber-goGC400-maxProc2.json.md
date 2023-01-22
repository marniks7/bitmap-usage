### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.572ms|273µs|worth: on 3.299ms, on -92.36%, in 0.1 times , -1 order of magnitude|
|90%|7.055ms|567µs|worth: on 6.488ms, on -91.96%, in 0.1 times , -1 order of magnitude|
|95%|8.162ms|664µs|worth: on 7.498ms, on -91.86%, in 0.1 times , -1 order of magnitude|
|97%|8.682ms|802µs|worth: on 7.88ms, on -90.76%, in 0.1 times , -1 order of magnitude|
|98%|9.031ms|1.05ms|worth: on 7.981ms, on -88.37%, in 0.1 times |
|99%|9.464ms|2.817ms|worth: on 6.647ms, on -70.23%, in 0.3 times |
|99.999%|11.692ms|11.435ms|worth: on 257µs, on -2.20%, in 1.0 times |
|Requests, count|163501|2063784|less: -92.1% , in 0.1 times |
