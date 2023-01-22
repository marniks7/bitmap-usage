### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.572ms|280µs|worth: on 3.292ms, on -92.16%, in 0.1 times , -1 order of magnitude|
|90%|7.055ms|605µs|worth: on 6.45ms, on -91.42%, in 0.1 times , -1 order of magnitude|
|95%|8.162ms|773µs|worth: on 7.389ms, on -90.53%, in 0.1 times , -1 order of magnitude|
|97%|8.682ms|1.159ms|worth: on 7.523ms, on -86.65%, in 0.1 times |
|98%|9.031ms|2.155ms|worth: on 6.876ms, on -76.14%, in 0.2 times |
|99%|9.464ms|4.146ms|worth: on 5.318ms, on -56.19%, in 0.4 times |
|99.999%|11.692ms|11.591ms|worth: on 101µs, on -0.86%, in 1.0 times |
|Requests, count|163501|1977373|less: -91.7% , in 0.1 times |
