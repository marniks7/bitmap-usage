### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|377µs|worth: on 3.343ms, on -89.87%, in 0.1 times , -1 order of magnitude|
|90%|7.25ms|751µs|worth: on 6.499ms, on -89.64%, in 0.1 times , -1 order of magnitude|
|95%|8.386ms|873µs|worth: on 7.513ms, on -89.59%, in 0.1 times , -1 order of magnitude|
|97%|8.938ms|954µs|worth: on 7.984ms, on -89.33%, in 0.1 times , -1 order of magnitude|
|98%|9.334ms|1.014ms|worth: on 8.32ms, on -89.14%, in 0.1 times |
|99%|9.808ms|1.126ms|worth: on 8.682ms, on -88.52%, in 0.1 times |
|99.999%|65.501ms|43.02ms|worth: on 22.481ms, on -34.32%, in 0.7 times |
|Requests, count|158549|1475585|less: -89.3% , in 0.1 times |
