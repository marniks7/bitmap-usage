### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|427µs|worth: on 3.293ms, on -88.52%, in 0.1 times , -1 order of magnitude|
|90%|7.25ms|911µs|worth: on 6.339ms, on -87.43%, in 0.1 times , -1 order of magnitude|
|95%|8.386ms|1.132ms|worth: on 7.254ms, on -86.50%, in 0.1 times |
|97%|8.938ms|1.536ms|worth: on 7.402ms, on -82.81%, in 0.2 times |
|98%|9.334ms|2.47ms|worth: on 6.864ms, on -73.54%, in 0.3 times |
|99%|9.808ms|4.84ms|worth: on 4.968ms, on -50.65%, in 0.5 times |
|99.999%|65.501ms|45.173ms|worth: on 20.328ms, on -31.03%, in 0.7 times |
|Requests, count|158549|1280125|less: -87.6% , in 0.1 times |
