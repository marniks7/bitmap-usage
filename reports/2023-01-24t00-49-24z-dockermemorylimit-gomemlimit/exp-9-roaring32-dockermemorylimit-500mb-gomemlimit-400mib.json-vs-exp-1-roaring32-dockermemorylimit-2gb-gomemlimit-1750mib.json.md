### Difference Report
Case1: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|427µs|377µs|worth: on 50µs, on -11.71%, in 0.9 times |
|90%|911µs|751µs|worth: on 160µs, on -17.56%, in 0.8 times |
|95%|1.132ms|873µs|worth: on 259µs, on -22.88%, in 0.8 times , -1 order of magnitude|
|97%|1.536ms|954µs|worth: on 582µs, on -37.89%, in 0.6 times , -1 order of magnitude|
|98%|2.47ms|1.014ms|worth: on 1.456ms, on -58.95%, in 0.4 times |
|99%|4.84ms|1.126ms|worth: on 3.714ms, on -76.74%, in 0.2 times |
|99.999%|45.173ms|43.02ms|worth: on 2.153ms, on -4.77%, in 1.0 times |
|Requests, count|1280125|1475585|less: -13.2% , in 0.9 times |
