### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|3.715ms|better: on 25µs, on 0.68%, in 1.0 times |
|90%|7.254ms|7.27ms|better: on 16µs, on 0.22%, in 1.0 times |
|95%|8.396ms|8.413ms|better: on 17µs, on 0.20%, in 1.0 times |
|97%|8.975ms|8.967ms|worth: on 8µs, on -0.09%, in 1.0 times |
|98%|9.347ms|9.35ms|better: on 3µs, on 0.03%, in 1.0 times |
|99%|9.772ms|9.799ms|better: on 27µs, on 0.28%, in 1.0 times |
|99.999%|49.717ms|38.249ms|worth: on 11.468ms, on -23.07%, in 0.8 times |
|Requests, count|159419|158459|more: 0.6% , in 1.0 times |
