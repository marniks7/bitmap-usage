### Difference Report
Case1: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|427µs|399µs|worth: on 28µs, on -6.56%, in 0.9 times |
|90%|911µs|796µs|worth: on 115µs, on -12.62%, in 0.9 times |
|95%|1.132ms|930µs|worth: on 202µs, on -17.84%, in 0.8 times , -1 order of magnitude|
|97%|1.536ms|1.018ms|worth: on 518µs, on -33.72%, in 0.7 times |
|98%|2.47ms|1.085ms|worth: on 1.385ms, on -56.07%, in 0.4 times |
|99%|4.84ms|1.23ms|worth: on 3.61ms, on -74.59%, in 0.3 times |
|99.999%|45.173ms|58.327ms|better: on 13.154ms, on 29.12%, in 1.3 times |
|Requests, count|1280125|1390640|less: -7.9% , in 0.9 times |
