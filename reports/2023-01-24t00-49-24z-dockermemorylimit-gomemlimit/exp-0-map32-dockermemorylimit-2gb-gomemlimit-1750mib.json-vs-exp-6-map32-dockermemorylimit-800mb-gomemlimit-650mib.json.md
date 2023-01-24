### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|3.72ms|better: on 30µs, on 0.81%, in 1.0 times |
|90%|7.254ms|7.25ms|worth: on 4µs, on -0.06%, in 1.0 times |
|95%|8.396ms|8.386ms|worth: on 10µs, on -0.12%, in 1.0 times |
|97%|8.975ms|8.938ms|worth: on 37µs, on -0.41%, in 1.0 times |
|98%|9.347ms|9.334ms|worth: on 13µs, on -0.14%, in 1.0 times |
|99%|9.772ms|9.808ms|better: on 36µs, on 0.37%, in 1.0 times |
|99.999%|49.717ms|65.501ms|better: on 15.784ms, on 31.75%, in 1.3 times |
|Requests, count|159419|158549|more: 0.5% , in 1.0 times |
