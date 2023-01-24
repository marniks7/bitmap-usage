### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|5.048ms|better: on 4.639ms, on 1134.23%, in 12.3 times , 1 order of magnitude|
|90%|829µs|11.405ms|better: on 10.576ms, on 1275.75%, in 13.8 times , 2 order of magnitude|
|95%|978µs|13.544ms|better: on 12.566ms, on 1284.87%, in 13.8 times , 2 order of magnitude|
|97%|1.088ms|14.846ms|better: on 13.758ms, on 1264.52%, in 13.6 times , 1 order of magnitude|
|98%|1.202ms|15.813ms|better: on 14.611ms, on 1215.56%, in 13.2 times , 1 order of magnitude|
|99%|2.158ms|17.471ms|better: on 15.313ms, on 709.59%, in 8.1 times , 1 order of magnitude|
|99.999%|32.233ms|49.351ms|better: on 17.118ms, on 53.11%, in 1.5 times |
|Requests, count|1351536|111948|more: 1107.3% , in 12.1 times |
