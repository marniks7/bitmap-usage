### Difference Report
Case1: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|427µs|409µs|worth: on 18µs, on -4.22%, in 1.0 times |
|90%|911µs|829µs|worth: on 82µs, on -9.00%, in 0.9 times |
|95%|1.132ms|978µs|worth: on 154µs, on -13.60%, in 0.9 times , -1 order of magnitude|
|97%|1.536ms|1.088ms|worth: on 448µs, on -29.17%, in 0.7 times |
|98%|2.47ms|1.202ms|worth: on 1.268ms, on -51.34%, in 0.5 times |
|99%|4.84ms|2.158ms|worth: on 2.682ms, on -55.41%, in 0.4 times |
|99.999%|45.173ms|32.233ms|worth: on 12.94ms, on -28.65%, in 0.7 times |
|Requests, count|1280125|1351536|less: -5.3% , in 0.9 times |
