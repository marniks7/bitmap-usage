### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|3.715ms|worth: on 5µs, on -0.13%, in 1.0 times |
|90%|7.25ms|7.27ms|better: on 20µs, on 0.28%, in 1.0 times |
|95%|8.386ms|8.413ms|better: on 27µs, on 0.32%, in 1.0 times |
|97%|8.938ms|8.967ms|better: on 29µs, on 0.32%, in 1.0 times |
|98%|9.334ms|9.35ms|better: on 16µs, on 0.17%, in 1.0 times |
|99%|9.808ms|9.799ms|worth: on 9µs, on -0.09%, in 1.0 times |
|99.999%|65.501ms|38.249ms|worth: on 27.252ms, on -41.61%, in 0.6 times |
|Requests, count|158549|158459|more: 0.1% , in 1.0 times |
