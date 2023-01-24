### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|377µs|worth: on 3.338ms, on -89.85%, in 0.1 times , -1 order of magnitude|
|90%|7.27ms|751µs|worth: on 6.519ms, on -89.67%, in 0.1 times , -1 order of magnitude|
|95%|8.413ms|873µs|worth: on 7.54ms, on -89.62%, in 0.1 times , -1 order of magnitude|
|97%|8.967ms|954µs|worth: on 8.013ms, on -89.36%, in 0.1 times , -1 order of magnitude|
|98%|9.35ms|1.014ms|worth: on 8.336ms, on -89.16%, in 0.1 times |
|99%|9.799ms|1.126ms|worth: on 8.673ms, on -88.51%, in 0.1 times |
|99.999%|38.249ms|43.02ms|better: on 4.771ms, on 12.47%, in 1.1 times |
|Requests, count|158459|1475585|less: -89.3% , in 0.1 times |
