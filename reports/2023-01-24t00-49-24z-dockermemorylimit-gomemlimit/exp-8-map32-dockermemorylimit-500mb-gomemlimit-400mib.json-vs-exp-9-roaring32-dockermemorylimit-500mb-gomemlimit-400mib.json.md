### Difference Report
Case1: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.751ms|427µs|worth: on 3.324ms, on -88.62%, in 0.1 times , -1 order of magnitude|
|90%|7.383ms|911µs|worth: on 6.472ms, on -87.66%, in 0.1 times , -1 order of magnitude|
|95%|8.545ms|1.132ms|worth: on 7.413ms, on -86.75%, in 0.1 times |
|97%|9.127ms|1.536ms|worth: on 7.591ms, on -83.17%, in 0.2 times |
|98%|9.496ms|2.47ms|worth: on 7.026ms, on -73.99%, in 0.3 times |
|99%|9.936ms|4.84ms|worth: on 5.096ms, on -51.29%, in 0.5 times |
|99.999%|51.45ms|45.173ms|worth: on 6.277ms, on -12.20%, in 0.9 times |
|Requests, count|156741|1280125|less: -87.8% , in 0.1 times |
