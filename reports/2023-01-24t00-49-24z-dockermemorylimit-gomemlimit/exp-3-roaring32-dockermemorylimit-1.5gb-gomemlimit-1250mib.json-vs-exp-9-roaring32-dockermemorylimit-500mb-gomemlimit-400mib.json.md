### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|427µs|better: on 28µs, on 7.02%, in 1.1 times |
|90%|796µs|911µs|better: on 115µs, on 14.45%, in 1.1 times |
|95%|930µs|1.132ms|better: on 202µs, on 21.72%, in 1.2 times , 1 order of magnitude|
|97%|1.018ms|1.536ms|better: on 518µs, on 50.88%, in 1.5 times |
|98%|1.085ms|2.47ms|better: on 1.385ms, on 127.65%, in 2.3 times |
|99%|1.23ms|4.84ms|better: on 3.61ms, on 293.50%, in 3.9 times |
|99.999%|58.327ms|45.173ms|worth: on 13.154ms, on -22.55%, in 0.8 times |
|Requests, count|1390640|1280125|more: 8.6% , in 1.1 times |
