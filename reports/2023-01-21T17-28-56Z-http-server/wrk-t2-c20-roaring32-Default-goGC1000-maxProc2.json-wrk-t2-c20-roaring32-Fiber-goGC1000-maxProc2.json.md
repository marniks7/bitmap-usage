### Difference Report
Case1: wrk-t2-c20-roaring32-Default-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|374µs|254µs|worth: on 120µs, on -32.09%, in 0.7 times |
|90%|761µs|516µs|worth: on 245µs, on -32.19%, in 0.7 times |
|95%|880µs|597µs|worth: on 283µs, on -32.16%, in 0.7 times |
|97%|980µs|661µs|worth: on 319µs, on -32.55%, in 0.7 times |
|98%|1.08ms|736µs|worth: on 344µs, on -31.85%, in 0.7 times , -1 order of magnitude|
|99%|1.293ms|930µs|worth: on 363µs, on -28.07%, in 0.7 times , -1 order of magnitude|
|99.999%|11.04ms|10.253ms|worth: on 787µs, on -7.13%, in 0.9 times |
|Requests, count|1521742|2224434|less: -31.6% , in 0.7 times |
