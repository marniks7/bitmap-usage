### Difference Report
Case1: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|427µs|3.751ms|better: on 3.324ms, on 778.45%, in 8.8 times , 1 order of magnitude|
|90%|911µs|7.383ms|better: on 6.472ms, on 710.43%, in 8.1 times , 1 order of magnitude|
|95%|1.132ms|8.545ms|better: on 7.413ms, on 654.86%, in 7.5 times |
|97%|1.536ms|9.127ms|better: on 7.591ms, on 494.21%, in 5.9 times |
|98%|2.47ms|9.496ms|better: on 7.026ms, on 284.45%, in 3.8 times |
|99%|4.84ms|9.936ms|better: on 5.096ms, on 105.29%, in 2.1 times |
|99.999%|45.173ms|51.45ms|better: on 6.277ms, on 13.90%, in 1.1 times |
|Requests, count|1280125|156741|more: 716.7% , in 8.2 times |
