### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|427µs|worth: on 3.212ms, on -88.27%, in 0.1 times , -1 order of magnitude|
|90%|7.119ms|911µs|worth: on 6.208ms, on -87.20%, in 0.1 times , -1 order of magnitude|
|95%|8.239ms|1.132ms|worth: on 7.107ms, on -86.26%, in 0.1 times |
|97%|8.773ms|1.536ms|worth: on 7.237ms, on -82.49%, in 0.2 times |
|98%|9.099ms|2.47ms|worth: on 6.629ms, on -72.85%, in 0.3 times |
|99%|9.597ms|4.84ms|worth: on 4.757ms, on -49.57%, in 0.5 times |
|99.999%|52.769ms|45.173ms|worth: on 7.596ms, on -14.39%, in 0.9 times |
|Requests, count|160945|1280125|less: -87.4% , in 0.1 times |
