### Difference Report
Case1: wrk-t2-c20-map32-Default-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Default-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.891ms|374µs|worth: on 3.517ms, on -90.39%, in 0.1 times , -1 order of magnitude|
|90%|7.703ms|761µs|worth: on 6.942ms, on -90.12%, in 0.1 times , -1 order of magnitude|
|95%|8.88ms|880µs|worth: on 8ms, on -90.09%, in 0.1 times , -1 order of magnitude|
|97%|9.467ms|980µs|worth: on 8.487ms, on -89.65%, in 0.1 times , -1 order of magnitude|
|98%|9.945ms|1.08ms|worth: on 8.865ms, on -89.14%, in 0.1 times |
|99%|10.744ms|1.293ms|worth: on 9.451ms, on -87.97%, in 0.1 times , -1 order of magnitude|
|99.999%|16.616ms|11.04ms|worth: on 5.576ms, on -33.56%, in 0.7 times |
|Requests, count|151482|1521742|less: -90.0% , in 0.1 times |
