### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|414µs|worth: on 4.634ms, on -91.80%, in 0.1 times , -1 order of magnitude|
|90%|11.405ms|848µs|worth: on 10.557ms, on -92.56%, in 0.1 times , -2 order of magnitude|
|95%|13.544ms|1.005ms|worth: on 12.539ms, on -92.58%, in 0.1 times , -1 order of magnitude|
|97%|14.846ms|1.13ms|worth: on 13.716ms, on -92.39%, in 0.1 times , -1 order of magnitude|
|98%|15.813ms|1.303ms|worth: on 14.51ms, on -91.76%, in 0.1 times , -1 order of magnitude|
|99%|17.471ms|2.733ms|worth: on 14.738ms, on -84.36%, in 0.2 times , -1 order of magnitude|
|99.999%|49.351ms|62.218ms|better: on 12.867ms, on 26.07%, in 1.3 times |
|Requests, count|111948|1331229|less: -91.6% , in 0.1 times |
