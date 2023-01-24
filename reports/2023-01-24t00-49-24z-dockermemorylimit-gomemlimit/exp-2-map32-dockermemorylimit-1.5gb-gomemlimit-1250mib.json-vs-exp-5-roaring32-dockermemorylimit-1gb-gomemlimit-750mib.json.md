### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|409µs|worth: on 3.306ms, on -88.99%, in 0.1 times , -1 order of magnitude|
|90%|7.27ms|829µs|worth: on 6.441ms, on -88.60%, in 0.1 times , -1 order of magnitude|
|95%|8.413ms|978µs|worth: on 7.435ms, on -88.38%, in 0.1 times , -1 order of magnitude|
|97%|8.967ms|1.088ms|worth: on 7.879ms, on -87.87%, in 0.1 times |
|98%|9.35ms|1.202ms|worth: on 8.148ms, on -87.14%, in 0.1 times |
|99%|9.799ms|2.158ms|worth: on 7.641ms, on -77.98%, in 0.2 times |
|99.999%|38.249ms|32.233ms|worth: on 6.016ms, on -15.73%, in 0.8 times |
|Requests, count|158459|1351536|less: -88.3% , in 0.1 times |
