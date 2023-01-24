### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|427µs|better: on 18µs, on 4.40%, in 1.0 times |
|90%|829µs|911µs|better: on 82µs, on 9.89%, in 1.1 times |
|95%|978µs|1.132ms|better: on 154µs, on 15.75%, in 1.2 times , 1 order of magnitude|
|97%|1.088ms|1.536ms|better: on 448µs, on 41.18%, in 1.4 times |
|98%|1.202ms|2.47ms|better: on 1.268ms, on 105.49%, in 2.1 times |
|99%|2.158ms|4.84ms|better: on 2.682ms, on 124.28%, in 2.2 times |
|99.999%|32.233ms|45.173ms|better: on 12.94ms, on 40.15%, in 1.4 times |
|Requests, count|1351536|1280125|more: 5.6% , in 1.1 times |
