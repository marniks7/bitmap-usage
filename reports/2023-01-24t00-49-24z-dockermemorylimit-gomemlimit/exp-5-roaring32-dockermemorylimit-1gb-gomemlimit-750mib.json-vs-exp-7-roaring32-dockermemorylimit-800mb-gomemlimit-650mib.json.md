### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|414µs|better: on 5µs, on 1.22%, in 1.0 times |
|90%|829µs|848µs|better: on 19µs, on 2.29%, in 1.0 times |
|95%|978µs|1.005ms|better: on 27µs, on 2.76%, in 1.0 times , 1 order of magnitude|
|97%|1.088ms|1.13ms|better: on 42µs, on 3.86%, in 1.0 times |
|98%|1.202ms|1.303ms|better: on 101µs, on 8.40%, in 1.1 times |
|99%|2.158ms|2.733ms|better: on 575µs, on 26.65%, in 1.3 times |
|99.999%|32.233ms|62.218ms|better: on 29.985ms, on 93.03%, in 1.9 times |
|Requests, count|1351536|1331229|more: 1.5% , in 1.0 times |
