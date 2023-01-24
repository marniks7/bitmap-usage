### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|3.715ms|better: on 76µs, on 2.09%, in 1.0 times |
|90%|7.119ms|7.27ms|better: on 151µs, on 2.12%, in 1.0 times |
|95%|8.239ms|8.413ms|better: on 174µs, on 2.11%, in 1.0 times |
|97%|8.773ms|8.967ms|better: on 194µs, on 2.21%, in 1.0 times |
|98%|9.099ms|9.35ms|better: on 251µs, on 2.76%, in 1.0 times |
|99%|9.597ms|9.799ms|better: on 202µs, on 2.10%, in 1.0 times |
|99.999%|52.769ms|38.249ms|worth: on 14.52ms, on -27.52%, in 0.7 times |
|Requests, count|160945|158459|more: 1.6% , in 1.0 times |
