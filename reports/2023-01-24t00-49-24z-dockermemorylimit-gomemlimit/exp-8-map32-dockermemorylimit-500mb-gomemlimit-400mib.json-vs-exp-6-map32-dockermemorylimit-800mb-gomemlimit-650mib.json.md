### Difference Report
Case1: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.751ms|3.72ms|worth: on 31µs, on -0.83%, in 1.0 times |
|90%|7.383ms|7.25ms|worth: on 133µs, on -1.80%, in 1.0 times |
|95%|8.545ms|8.386ms|worth: on 159µs, on -1.86%, in 1.0 times |
|97%|9.127ms|8.938ms|worth: on 189µs, on -2.07%, in 1.0 times |
|98%|9.496ms|9.334ms|worth: on 162µs, on -1.71%, in 1.0 times |
|99%|9.936ms|9.808ms|worth: on 128µs, on -1.29%, in 1.0 times |
|99.999%|51.45ms|65.501ms|better: on 14.051ms, on 27.31%, in 1.3 times |
|Requests, count|156741|158549|less: -1.1% , in 1.0 times |
