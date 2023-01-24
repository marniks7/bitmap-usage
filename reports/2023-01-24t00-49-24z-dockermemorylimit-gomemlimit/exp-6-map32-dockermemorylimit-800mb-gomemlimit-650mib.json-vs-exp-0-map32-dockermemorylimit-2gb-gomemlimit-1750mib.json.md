### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|3.69ms|worth: on 30µs, on -0.81%, in 1.0 times |
|90%|7.25ms|7.254ms|better: on 4µs, on 0.06%, in 1.0 times |
|95%|8.386ms|8.396ms|better: on 10µs, on 0.12%, in 1.0 times |
|97%|8.938ms|8.975ms|better: on 37µs, on 0.41%, in 1.0 times |
|98%|9.334ms|9.347ms|better: on 13µs, on 0.14%, in 1.0 times |
|99%|9.808ms|9.772ms|worth: on 36µs, on -0.37%, in 1.0 times |
|99.999%|65.501ms|49.717ms|worth: on 15.784ms, on -24.10%, in 0.8 times |
|Requests, count|158549|159419|less: -0.5% , in 1.0 times |
