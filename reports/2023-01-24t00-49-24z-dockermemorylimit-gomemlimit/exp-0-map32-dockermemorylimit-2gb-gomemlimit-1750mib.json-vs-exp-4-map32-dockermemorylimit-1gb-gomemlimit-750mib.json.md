### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|3.639ms|worth: on 51µs, on -1.38%, in 1.0 times |
|90%|7.254ms|7.119ms|worth: on 135µs, on -1.86%, in 1.0 times |
|95%|8.396ms|8.239ms|worth: on 157µs, on -1.87%, in 1.0 times |
|97%|8.975ms|8.773ms|worth: on 202µs, on -2.25%, in 1.0 times |
|98%|9.347ms|9.099ms|worth: on 248µs, on -2.65%, in 1.0 times |
|99%|9.772ms|9.597ms|worth: on 175µs, on -1.79%, in 1.0 times |
|99.999%|49.717ms|52.769ms|better: on 3.052ms, on 6.14%, in 1.1 times |
|Requests, count|159419|160945|less: -0.9% , in 1.0 times |
