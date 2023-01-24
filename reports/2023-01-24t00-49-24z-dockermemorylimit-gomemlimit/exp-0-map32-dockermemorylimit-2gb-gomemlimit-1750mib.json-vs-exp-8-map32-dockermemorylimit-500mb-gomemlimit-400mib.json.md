### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|3.751ms|better: on 61µs, on 1.65%, in 1.0 times |
|90%|7.254ms|7.383ms|better: on 129µs, on 1.78%, in 1.0 times |
|95%|8.396ms|8.545ms|better: on 149µs, on 1.77%, in 1.0 times |
|97%|8.975ms|9.127ms|better: on 152µs, on 1.69%, in 1.0 times |
|98%|9.347ms|9.496ms|better: on 149µs, on 1.59%, in 1.0 times |
|99%|9.772ms|9.936ms|better: on 164µs, on 1.68%, in 1.0 times |
|99.999%|49.717ms|51.45ms|better: on 1.733ms, on 3.49%, in 1.0 times |
|Requests, count|159419|156741|more: 1.7% , in 1.0 times |
