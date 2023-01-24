### Difference Report
Case1: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|427µs|3.72ms|better: on 3.293ms, on 771.19%, in 8.7 times , 1 order of magnitude|
|90%|911µs|7.25ms|better: on 6.339ms, on 695.83%, in 8.0 times , 1 order of magnitude|
|95%|1.132ms|8.386ms|better: on 7.254ms, on 640.81%, in 7.4 times |
|97%|1.536ms|8.938ms|better: on 7.402ms, on 481.90%, in 5.8 times |
|98%|2.47ms|9.334ms|better: on 6.864ms, on 277.89%, in 3.8 times |
|99%|4.84ms|9.808ms|better: on 4.968ms, on 102.64%, in 2.0 times |
|99.999%|45.173ms|65.501ms|better: on 20.328ms, on 45.00%, in 1.5 times |
|Requests, count|1280125|158549|more: 707.4% , in 8.1 times |
