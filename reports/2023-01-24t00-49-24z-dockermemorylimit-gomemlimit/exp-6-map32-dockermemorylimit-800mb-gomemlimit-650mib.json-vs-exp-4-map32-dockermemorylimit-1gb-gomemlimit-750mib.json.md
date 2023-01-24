### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|3.639ms|worth: on 81µs, on -2.18%, in 1.0 times |
|90%|7.25ms|7.119ms|worth: on 131µs, on -1.81%, in 1.0 times |
|95%|8.386ms|8.239ms|worth: on 147µs, on -1.75%, in 1.0 times |
|97%|8.938ms|8.773ms|worth: on 165µs, on -1.85%, in 1.0 times |
|98%|9.334ms|9.099ms|worth: on 235µs, on -2.52%, in 1.0 times |
|99%|9.808ms|9.597ms|worth: on 211µs, on -2.15%, in 1.0 times |
|99.999%|65.501ms|52.769ms|worth: on 12.732ms, on -19.44%, in 0.8 times |
|Requests, count|158549|160945|less: -1.5% , in 1.0 times |
