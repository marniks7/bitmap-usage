### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|3.72ms|better: on 81µs, on 2.23%, in 1.0 times |
|90%|7.119ms|7.25ms|better: on 131µs, on 1.84%, in 1.0 times |
|95%|8.239ms|8.386ms|better: on 147µs, on 1.78%, in 1.0 times |
|97%|8.773ms|8.938ms|better: on 165µs, on 1.88%, in 1.0 times |
|98%|9.099ms|9.334ms|better: on 235µs, on 2.58%, in 1.0 times |
|99%|9.597ms|9.808ms|better: on 211µs, on 2.20%, in 1.0 times |
|99.999%|52.769ms|65.501ms|better: on 12.732ms, on 24.13%, in 1.2 times |
|Requests, count|160945|158549|more: 1.5% , in 1.0 times |
