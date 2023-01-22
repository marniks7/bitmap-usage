### Difference Report
Case1: wrk-t2-c20-roaring32-Default-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|374µs|3.791ms|better: on 3.417ms, on 913.64%, in 10.1 times , 1 order of magnitude|
|90%|761µs|7.572ms|better: on 6.811ms, on 895.01%, in 10.0 times , 1 order of magnitude|
|95%|880µs|8.707ms|better: on 7.827ms, on 889.43%, in 9.9 times , 1 order of magnitude|
|97%|980µs|9.333ms|better: on 8.353ms, on 852.35%, in 9.5 times , 1 order of magnitude|
|98%|1.08ms|9.732ms|better: on 8.652ms, on 801.11%, in 9.0 times |
|99%|1.293ms|10.481ms|better: on 9.188ms, on 710.60%, in 8.1 times , 1 order of magnitude|
|99.999%|11.04ms|24.058ms|better: on 13.018ms, on 117.92%, in 2.2 times |
|Requests, count|1521742|155306|more: 879.8% , in 9.8 times |
