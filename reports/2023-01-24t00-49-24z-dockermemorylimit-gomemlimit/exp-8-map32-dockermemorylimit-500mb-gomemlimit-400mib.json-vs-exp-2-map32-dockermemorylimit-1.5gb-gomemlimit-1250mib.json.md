### Difference Report
Case1: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.751ms|3.715ms|worth: on 36µs, on -0.96%, in 1.0 times |
|90%|7.383ms|7.27ms|worth: on 113µs, on -1.53%, in 1.0 times |
|95%|8.545ms|8.413ms|worth: on 132µs, on -1.54%, in 1.0 times |
|97%|9.127ms|8.967ms|worth: on 160µs, on -1.75%, in 1.0 times |
|98%|9.496ms|9.35ms|worth: on 146µs, on -1.54%, in 1.0 times |
|99%|9.936ms|9.799ms|worth: on 137µs, on -1.38%, in 1.0 times |
|99.999%|51.45ms|38.249ms|worth: on 13.201ms, on -25.66%, in 0.7 times |
|Requests, count|156741|158459|less: -1.1% , in 1.0 times |
