### Difference Report
Case1: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|427µs|3.715ms|better: on 3.288ms, on 770.02%, in 8.7 times , 1 order of magnitude|
|90%|911µs|7.27ms|better: on 6.359ms, on 698.02%, in 8.0 times , 1 order of magnitude|
|95%|1.132ms|8.413ms|better: on 7.281ms, on 643.20%, in 7.4 times |
|97%|1.536ms|8.967ms|better: on 7.431ms, on 483.79%, in 5.8 times |
|98%|2.47ms|9.35ms|better: on 6.88ms, on 278.54%, in 3.8 times |
|99%|4.84ms|9.799ms|better: on 4.959ms, on 102.46%, in 2.0 times |
|99.999%|45.173ms|38.249ms|worth: on 6.924ms, on -15.33%, in 0.8 times |
|Requests, count|1280125|158459|more: 707.9% , in 8.1 times |
