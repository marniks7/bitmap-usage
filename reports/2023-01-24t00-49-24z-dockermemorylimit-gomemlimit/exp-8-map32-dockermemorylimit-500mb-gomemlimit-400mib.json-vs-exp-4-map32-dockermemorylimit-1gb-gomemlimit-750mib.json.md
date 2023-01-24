### Difference Report
Case1: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.751ms|3.639ms|worth: on 112µs, on -2.99%, in 1.0 times |
|90%|7.383ms|7.119ms|worth: on 264µs, on -3.58%, in 1.0 times |
|95%|8.545ms|8.239ms|worth: on 306µs, on -3.58%, in 1.0 times |
|97%|9.127ms|8.773ms|worth: on 354µs, on -3.88%, in 1.0 times |
|98%|9.496ms|9.099ms|worth: on 397µs, on -4.18%, in 1.0 times |
|99%|9.936ms|9.597ms|worth: on 339µs, on -3.41%, in 1.0 times |
|99.999%|51.45ms|52.769ms|better: on 1.319ms, on 2.56%, in 1.0 times |
|Requests, count|156741|160945|less: -2.6% , in 1.0 times |
