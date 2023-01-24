### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|3.72ms|better: on 5µs, on 0.13%, in 1.0 times |
|90%|7.27ms|7.25ms|worth: on 20µs, on -0.28%, in 1.0 times |
|95%|8.413ms|8.386ms|worth: on 27µs, on -0.32%, in 1.0 times |
|97%|8.967ms|8.938ms|worth: on 29µs, on -0.32%, in 1.0 times |
|98%|9.35ms|9.334ms|worth: on 16µs, on -0.17%, in 1.0 times |
|99%|9.799ms|9.808ms|better: on 9µs, on 0.09%, in 1.0 times |
|99.999%|38.249ms|65.501ms|better: on 27.252ms, on 71.25%, in 1.7 times |
|Requests, count|158459|158549|less: -0.1% , in 1.0 times |
