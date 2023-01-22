### Difference Report
Case1: wrk-t2-c20-map32-Default-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.891ms|254µs|worth: on 3.637ms, on -93.47%, in 0.1 times , -1 order of magnitude|
|90%|7.703ms|516µs|worth: on 7.187ms, on -93.30%, in 0.1 times , -1 order of magnitude|
|95%|8.88ms|597µs|worth: on 8.283ms, on -93.28%, in 0.1 times , -1 order of magnitude|
|97%|9.467ms|661µs|worth: on 8.806ms, on -93.02%, in 0.1 times , -1 order of magnitude|
|98%|9.945ms|736µs|worth: on 9.209ms, on -92.60%, in 0.1 times , -1 order of magnitude|
|99%|10.744ms|930µs|worth: on 9.814ms, on -91.34%, in 0.1 times , -2 order of magnitude|
|99.999%|16.616ms|10.253ms|worth: on 6.363ms, on -38.29%, in 0.6 times |
|Requests, count|151482|2224434|less: -93.2% , in 0.1 times |
