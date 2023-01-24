### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|427µs|better: on 13µs, on 3.14%, in 1.0 times |
|90%|848µs|911µs|better: on 63µs, on 7.43%, in 1.1 times |
|95%|1.005ms|1.132ms|better: on 127µs, on 12.64%, in 1.1 times |
|97%|1.13ms|1.536ms|better: on 406µs, on 35.93%, in 1.4 times |
|98%|1.303ms|2.47ms|better: on 1.167ms, on 89.56%, in 1.9 times |
|99%|2.733ms|4.84ms|better: on 2.107ms, on 77.09%, in 1.8 times |
|99.999%|62.218ms|45.173ms|worth: on 17.045ms, on -27.40%, in 0.7 times |
|Requests, count|1331229|1280125|more: 4.0% , in 1.0 times |
