### Difference Report
Case1: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.751ms|409µs|worth: on 3.342ms, on -89.10%, in 0.1 times , -1 order of magnitude|
|90%|7.383ms|829µs|worth: on 6.554ms, on -88.77%, in 0.1 times , -1 order of magnitude|
|95%|8.545ms|978µs|worth: on 7.567ms, on -88.55%, in 0.1 times , -1 order of magnitude|
|97%|9.127ms|1.088ms|worth: on 8.039ms, on -88.08%, in 0.1 times |
|98%|9.496ms|1.202ms|worth: on 8.294ms, on -87.34%, in 0.1 times |
|99%|9.936ms|2.158ms|worth: on 7.778ms, on -78.28%, in 0.2 times |
|99.999%|51.45ms|32.233ms|worth: on 19.217ms, on -37.35%, in 0.6 times |
|Requests, count|156741|1351536|less: -88.4% , in 0.1 times |
