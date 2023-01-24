### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|409µs|worth: on 3.23ms, on -88.76%, in 0.1 times , -1 order of magnitude|
|90%|7.119ms|829µs|worth: on 6.29ms, on -88.36%, in 0.1 times , -1 order of magnitude|
|95%|8.239ms|978µs|worth: on 7.261ms, on -88.13%, in 0.1 times , -1 order of magnitude|
|97%|8.773ms|1.088ms|worth: on 7.685ms, on -87.60%, in 0.1 times |
|98%|9.099ms|1.202ms|worth: on 7.897ms, on -86.79%, in 0.1 times |
|99%|9.597ms|2.158ms|worth: on 7.439ms, on -77.51%, in 0.2 times |
|99.999%|52.769ms|32.233ms|worth: on 20.536ms, on -38.92%, in 0.6 times |
|Requests, count|160945|1351536|less: -88.1% , in 0.1 times |
