### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|409µs|worth: on 4.639ms, on -91.90%, in 0.1 times , -1 order of magnitude|
|90%|11.405ms|829µs|worth: on 10.576ms, on -92.73%, in 0.1 times , -2 order of magnitude|
|95%|13.544ms|978µs|worth: on 12.566ms, on -92.78%, in 0.1 times , -2 order of magnitude|
|97%|14.846ms|1.088ms|worth: on 13.758ms, on -92.67%, in 0.1 times , -1 order of magnitude|
|98%|15.813ms|1.202ms|worth: on 14.611ms, on -92.40%, in 0.1 times , -1 order of magnitude|
|99%|17.471ms|2.158ms|worth: on 15.313ms, on -87.65%, in 0.1 times , -1 order of magnitude|
|99.999%|49.351ms|32.233ms|worth: on 17.118ms, on -34.69%, in 0.7 times |
|Requests, count|111948|1351536|less: -91.7% , in 0.1 times |
