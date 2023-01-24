### Difference Report
Case1: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|427µs|3.639ms|better: on 3.212ms, on 752.22%, in 8.5 times , 1 order of magnitude|
|90%|911µs|7.119ms|better: on 6.208ms, on 681.45%, in 7.8 times , 1 order of magnitude|
|95%|1.132ms|8.239ms|better: on 7.107ms, on 627.83%, in 7.3 times |
|97%|1.536ms|8.773ms|better: on 7.237ms, on 471.16%, in 5.7 times |
|98%|2.47ms|9.099ms|better: on 6.629ms, on 268.38%, in 3.7 times |
|99%|4.84ms|9.597ms|better: on 4.757ms, on 98.29%, in 2.0 times |
|99.999%|45.173ms|52.769ms|better: on 7.596ms, on 16.82%, in 1.2 times |
|Requests, count|1280125|160945|more: 695.4% , in 8.0 times |
