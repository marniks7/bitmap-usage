### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|427µs|worth: on 4.621ms, on -91.54%, in 0.1 times , -1 order of magnitude|
|90%|11.405ms|911µs|worth: on 10.494ms, on -92.01%, in 0.1 times , -2 order of magnitude|
|95%|13.544ms|1.132ms|worth: on 12.412ms, on -91.64%, in 0.1 times , -1 order of magnitude|
|97%|14.846ms|1.536ms|worth: on 13.31ms, on -89.65%, in 0.1 times , -1 order of magnitude|
|98%|15.813ms|2.47ms|worth: on 13.343ms, on -84.38%, in 0.2 times , -1 order of magnitude|
|99%|17.471ms|4.84ms|worth: on 12.631ms, on -72.30%, in 0.3 times , -1 order of magnitude|
|99.999%|49.351ms|45.173ms|worth: on 4.178ms, on -8.47%, in 0.9 times |
|Requests, count|111948|1280125|less: -91.3% , in 0.1 times |
