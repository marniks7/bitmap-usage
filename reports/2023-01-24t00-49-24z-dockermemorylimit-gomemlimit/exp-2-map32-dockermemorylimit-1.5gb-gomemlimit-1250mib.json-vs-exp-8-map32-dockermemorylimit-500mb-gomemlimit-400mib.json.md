### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|3.751ms|better: on 36µs, on 0.97%, in 1.0 times |
|90%|7.27ms|7.383ms|better: on 113µs, on 1.55%, in 1.0 times |
|95%|8.413ms|8.545ms|better: on 132µs, on 1.57%, in 1.0 times |
|97%|8.967ms|9.127ms|better: on 160µs, on 1.78%, in 1.0 times |
|98%|9.35ms|9.496ms|better: on 146µs, on 1.56%, in 1.0 times |
|99%|9.799ms|9.936ms|better: on 137µs, on 1.40%, in 1.0 times |
|99.999%|38.249ms|51.45ms|better: on 13.201ms, on 34.51%, in 1.3 times |
|Requests, count|158459|156741|more: 1.1% , in 1.0 times |
