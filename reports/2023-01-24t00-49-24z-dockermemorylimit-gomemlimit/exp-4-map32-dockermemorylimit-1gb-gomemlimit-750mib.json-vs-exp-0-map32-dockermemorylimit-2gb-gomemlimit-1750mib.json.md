### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|3.69ms|better: on 51µs, on 1.40%, in 1.0 times |
|90%|7.119ms|7.254ms|better: on 135µs, on 1.90%, in 1.0 times |
|95%|8.239ms|8.396ms|better: on 157µs, on 1.91%, in 1.0 times |
|97%|8.773ms|8.975ms|better: on 202µs, on 2.30%, in 1.0 times |
|98%|9.099ms|9.347ms|better: on 248µs, on 2.73%, in 1.0 times |
|99%|9.597ms|9.772ms|better: on 175µs, on 1.82%, in 1.0 times |
|99.999%|52.769ms|49.717ms|worth: on 3.052ms, on -5.78%, in 0.9 times |
|Requests, count|160945|159419|more: 1.0% , in 1.0 times |
