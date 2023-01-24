### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|3.72ms|better: on 3.321ms, on 832.33%, in 9.3 times , 1 order of magnitude|
|90%|796µs|7.25ms|better: on 6.454ms, on 810.80%, in 9.1 times , 1 order of magnitude|
|95%|930µs|8.386ms|better: on 7.456ms, on 801.72%, in 9.0 times , 1 order of magnitude|
|97%|1.018ms|8.938ms|better: on 7.92ms, on 778.00%, in 8.8 times |
|98%|1.085ms|9.334ms|better: on 8.249ms, on 760.28%, in 8.6 times |
|99%|1.23ms|9.808ms|better: on 8.578ms, on 697.40%, in 8.0 times |
|99.999%|58.327ms|65.501ms|better: on 7.174ms, on 12.30%, in 1.1 times |
|Requests, count|1390640|158549|more: 777.1% , in 8.8 times |
