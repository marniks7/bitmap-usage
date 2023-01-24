### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|3.72ms|better: on 3.306ms, on 798.55%, in 9.0 times , 1 order of magnitude|
|90%|848µs|7.25ms|better: on 6.402ms, on 754.95%, in 8.5 times , 1 order of magnitude|
|95%|1.005ms|8.386ms|better: on 7.381ms, on 734.43%, in 8.3 times |
|97%|1.13ms|8.938ms|better: on 7.808ms, on 690.97%, in 7.9 times |
|98%|1.303ms|9.334ms|better: on 8.031ms, on 616.35%, in 7.2 times |
|99%|2.733ms|9.808ms|better: on 7.075ms, on 258.87%, in 3.6 times |
|99.999%|62.218ms|65.501ms|better: on 3.283ms, on 5.28%, in 1.1 times |
|Requests, count|1331229|158549|more: 739.6% , in 8.4 times |
