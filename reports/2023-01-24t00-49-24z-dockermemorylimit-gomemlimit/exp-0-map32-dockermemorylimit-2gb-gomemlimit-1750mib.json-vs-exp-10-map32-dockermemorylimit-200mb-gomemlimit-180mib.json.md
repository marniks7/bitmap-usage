### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|5.048ms|better: on 1.358ms, on 36.80%, in 1.4 times |
|90%|7.254ms|11.405ms|better: on 4.151ms, on 57.22%, in 1.6 times , 1 order of magnitude|
|95%|8.396ms|13.544ms|better: on 5.148ms, on 61.31%, in 1.6 times , 1 order of magnitude|
|97%|8.975ms|14.846ms|better: on 5.871ms, on 65.42%, in 1.7 times , 1 order of magnitude|
|98%|9.347ms|15.813ms|better: on 6.466ms, on 69.18%, in 1.7 times , 1 order of magnitude|
|99%|9.772ms|17.471ms|better: on 7.699ms, on 78.79%, in 1.8 times , 1 order of magnitude|
|99.999%|49.717ms|49.351ms|worth: on 366µs, on -0.74%, in 1.0 times |
|Requests, count|159419|111948|more: 42.4% , in 1.4 times |
