### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|3.69ms|worth: on 25µs, on -0.67%, in 1.0 times |
|90%|7.27ms|7.254ms|worth: on 16µs, on -0.22%, in 1.0 times |
|95%|8.413ms|8.396ms|worth: on 17µs, on -0.20%, in 1.0 times |
|97%|8.967ms|8.975ms|better: on 8µs, on 0.09%, in 1.0 times |
|98%|9.35ms|9.347ms|worth: on 3µs, on -0.03%, in 1.0 times |
|99%|9.799ms|9.772ms|worth: on 27µs, on -0.28%, in 1.0 times |
|99.999%|38.249ms|49.717ms|better: on 11.468ms, on 29.98%, in 1.3 times |
|Requests, count|158459|159419|less: -0.6% , in 1.0 times |
