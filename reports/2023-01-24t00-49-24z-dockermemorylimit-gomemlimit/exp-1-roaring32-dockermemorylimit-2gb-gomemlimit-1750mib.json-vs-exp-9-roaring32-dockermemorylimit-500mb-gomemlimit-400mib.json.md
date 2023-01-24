### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|427µs|better: on 50µs, on 13.26%, in 1.1 times |
|90%|751µs|911µs|better: on 160µs, on 21.30%, in 1.2 times |
|95%|873µs|1.132ms|better: on 259µs, on 29.67%, in 1.3 times , 1 order of magnitude|
|97%|954µs|1.536ms|better: on 582µs, on 61.01%, in 1.6 times , 1 order of magnitude|
|98%|1.014ms|2.47ms|better: on 1.456ms, on 143.59%, in 2.4 times |
|99%|1.126ms|4.84ms|better: on 3.714ms, on 329.84%, in 4.3 times |
|99.999%|43.02ms|45.173ms|better: on 2.153ms, on 5.00%, in 1.1 times |
|Requests, count|1475585|1280125|more: 15.3% , in 1.2 times |
