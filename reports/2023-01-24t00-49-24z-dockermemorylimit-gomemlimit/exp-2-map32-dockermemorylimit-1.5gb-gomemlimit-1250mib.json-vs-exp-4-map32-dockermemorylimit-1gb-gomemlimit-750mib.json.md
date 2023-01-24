### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|3.639ms|worth: on 76µs, on -2.05%, in 1.0 times |
|90%|7.27ms|7.119ms|worth: on 151µs, on -2.08%, in 1.0 times |
|95%|8.413ms|8.239ms|worth: on 174µs, on -2.07%, in 1.0 times |
|97%|8.967ms|8.773ms|worth: on 194µs, on -2.16%, in 1.0 times |
|98%|9.35ms|9.099ms|worth: on 251µs, on -2.68%, in 1.0 times |
|99%|9.799ms|9.597ms|worth: on 202µs, on -2.06%, in 1.0 times |
|99.999%|38.249ms|52.769ms|better: on 14.52ms, on 37.96%, in 1.4 times |
|Requests, count|158459|160945|less: -1.5% , in 1.0 times |
