### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|3.751ms|better: on 31µs, on 0.83%, in 1.0 times |
|90%|7.25ms|7.383ms|better: on 133µs, on 1.83%, in 1.0 times |
|95%|8.386ms|8.545ms|better: on 159µs, on 1.90%, in 1.0 times |
|97%|8.938ms|9.127ms|better: on 189µs, on 2.11%, in 1.0 times |
|98%|9.334ms|9.496ms|better: on 162µs, on 1.74%, in 1.0 times |
|99%|9.808ms|9.936ms|better: on 128µs, on 1.31%, in 1.0 times |
|99.999%|65.501ms|51.45ms|worth: on 14.051ms, on -21.45%, in 0.8 times |
|Requests, count|158549|156741|more: 1.2% , in 1.0 times |
