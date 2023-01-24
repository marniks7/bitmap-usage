### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|3.69ms|worth: on 1.358ms, on -26.90%, in 0.7 times |
|90%|11.405ms|7.254ms|worth: on 4.151ms, on -36.40%, in 0.6 times , -1 order of magnitude|
|95%|13.544ms|8.396ms|worth: on 5.148ms, on -38.01%, in 0.6 times , -1 order of magnitude|
|97%|14.846ms|8.975ms|worth: on 5.871ms, on -39.55%, in 0.6 times , -1 order of magnitude|
|98%|15.813ms|9.347ms|worth: on 6.466ms, on -40.89%, in 0.6 times , -1 order of magnitude|
|99%|17.471ms|9.772ms|worth: on 7.699ms, on -44.07%, in 0.6 times , -1 order of magnitude|
|99.999%|49.351ms|49.717ms|better: on 366µs, on 0.74%, in 1.0 times |
|Requests, count|111948|159419|less: -29.8% , in 0.7 times |
