### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|427µs|worth: on 3.288ms, on -88.51%, in 0.1 times , -1 order of magnitude|
|90%|7.27ms|911µs|worth: on 6.359ms, on -87.47%, in 0.1 times , -1 order of magnitude|
|95%|8.413ms|1.132ms|worth: on 7.281ms, on -86.54%, in 0.1 times |
|97%|8.967ms|1.536ms|worth: on 7.431ms, on -82.87%, in 0.2 times |
|98%|9.35ms|2.47ms|worth: on 6.88ms, on -73.58%, in 0.3 times |
|99%|9.799ms|4.84ms|worth: on 4.959ms, on -50.61%, in 0.5 times |
|99.999%|38.249ms|45.173ms|better: on 6.924ms, on 18.10%, in 1.2 times |
|Requests, count|158459|1280125|less: -87.6% , in 0.1 times |
