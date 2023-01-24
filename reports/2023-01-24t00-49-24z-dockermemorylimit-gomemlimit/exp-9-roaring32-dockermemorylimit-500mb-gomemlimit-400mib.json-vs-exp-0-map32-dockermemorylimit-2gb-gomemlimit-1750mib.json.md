### Difference Report
Case1: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|427µs|3.69ms|better: on 3.263ms, on 764.17%, in 8.6 times , 1 order of magnitude|
|90%|911µs|7.254ms|better: on 6.343ms, on 696.27%, in 8.0 times , 1 order of magnitude|
|95%|1.132ms|8.396ms|better: on 7.264ms, on 641.70%, in 7.4 times |
|97%|1.536ms|8.975ms|better: on 7.439ms, on 484.31%, in 5.8 times |
|98%|2.47ms|9.347ms|better: on 6.877ms, on 278.42%, in 3.8 times |
|99%|4.84ms|9.772ms|better: on 4.932ms, on 101.90%, in 2.0 times |
|99.999%|45.173ms|49.717ms|better: on 4.544ms, on 10.06%, in 1.1 times |
|Requests, count|1280125|159419|more: 703.0% , in 8.0 times |
