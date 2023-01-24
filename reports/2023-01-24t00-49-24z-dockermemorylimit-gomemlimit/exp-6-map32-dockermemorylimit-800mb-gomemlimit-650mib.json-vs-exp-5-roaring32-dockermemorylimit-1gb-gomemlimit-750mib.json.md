### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|409µs|worth: on 3.311ms, on -89.01%, in 0.1 times , -1 order of magnitude|
|90%|7.25ms|829µs|worth: on 6.421ms, on -88.57%, in 0.1 times , -1 order of magnitude|
|95%|8.386ms|978µs|worth: on 7.408ms, on -88.34%, in 0.1 times , -1 order of magnitude|
|97%|8.938ms|1.088ms|worth: on 7.85ms, on -87.83%, in 0.1 times |
|98%|9.334ms|1.202ms|worth: on 8.132ms, on -87.12%, in 0.1 times |
|99%|9.808ms|2.158ms|worth: on 7.65ms, on -78.00%, in 0.2 times |
|99.999%|65.501ms|32.233ms|worth: on 33.268ms, on -50.79%, in 0.5 times |
|Requests, count|158549|1351536|less: -88.3% , in 0.1 times |
