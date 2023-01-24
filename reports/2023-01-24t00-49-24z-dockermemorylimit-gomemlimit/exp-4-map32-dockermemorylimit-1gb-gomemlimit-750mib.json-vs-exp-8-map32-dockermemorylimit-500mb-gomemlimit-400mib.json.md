### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|3.751ms|better: on 112µs, on 3.08%, in 1.0 times |
|90%|7.119ms|7.383ms|better: on 264µs, on 3.71%, in 1.0 times |
|95%|8.239ms|8.545ms|better: on 306µs, on 3.71%, in 1.0 times |
|97%|8.773ms|9.127ms|better: on 354µs, on 4.04%, in 1.0 times |
|98%|9.099ms|9.496ms|better: on 397µs, on 4.36%, in 1.0 times |
|99%|9.597ms|9.936ms|better: on 339µs, on 3.53%, in 1.0 times |
|99.999%|52.769ms|51.45ms|worth: on 1.319ms, on -2.50%, in 1.0 times |
|Requests, count|160945|156741|more: 2.7% , in 1.0 times |
