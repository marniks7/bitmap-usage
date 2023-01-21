### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Default-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.791ms|374µs|worth: on 3.417ms, on -90.13%, in 0.1 times , -1 order of magnitude|
|90%|7.572ms|761µs|worth: on 6.811ms, on -89.95%, in 0.1 times , -1 order of magnitude|
|95%|8.707ms|880µs|worth: on 7.827ms, on -89.89%, in 0.1 times , -1 order of magnitude|
|97%|9.333ms|980µs|worth: on 8.353ms, on -89.50%, in 0.1 times , -1 order of magnitude|
|98%|9.732ms|1.08ms|worth: on 8.652ms, on -88.90%, in 0.1 times |
|99%|10.481ms|1.293ms|worth: on 9.188ms, on -87.66%, in 0.1 times , -1 order of magnitude|
|99.999%|24.058ms|11.04ms|worth: on 13.018ms, on -54.11%, in 0.5 times |
|Requests, count|155306|1521742|less: -89.8% , in 0.1 times |
