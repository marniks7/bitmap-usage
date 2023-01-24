### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|427µs|worth: on 3.263ms, on -88.43%, in 0.1 times , -1 order of magnitude|
|90%|7.254ms|911µs|worth: on 6.343ms, on -87.44%, in 0.1 times , -1 order of magnitude|
|95%|8.396ms|1.132ms|worth: on 7.264ms, on -86.52%, in 0.1 times |
|97%|8.975ms|1.536ms|worth: on 7.439ms, on -82.89%, in 0.2 times |
|98%|9.347ms|2.47ms|worth: on 6.877ms, on -73.57%, in 0.3 times |
|99%|9.772ms|4.84ms|worth: on 4.932ms, on -50.47%, in 0.5 times |
|99.999%|49.717ms|45.173ms|worth: on 4.544ms, on -9.14%, in 0.9 times |
|Requests, count|159419|1280125|less: -87.5% , in 0.1 times |
