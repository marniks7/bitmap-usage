### Difference Report
Case1: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|427µs|414µs|worth: on 13µs, on -3.04%, in 1.0 times |
|90%|911µs|848µs|worth: on 63µs, on -6.92%, in 0.9 times |
|95%|1.132ms|1.005ms|worth: on 127µs, on -11.22%, in 0.9 times |
|97%|1.536ms|1.13ms|worth: on 406µs, on -26.43%, in 0.7 times |
|98%|2.47ms|1.303ms|worth: on 1.167ms, on -47.25%, in 0.5 times |
|99%|4.84ms|2.733ms|worth: on 2.107ms, on -43.53%, in 0.6 times |
|99.999%|45.173ms|62.218ms|better: on 17.045ms, on 37.73%, in 1.4 times |
|Requests, count|1280125|1331229|less: -3.8% , in 1.0 times |
