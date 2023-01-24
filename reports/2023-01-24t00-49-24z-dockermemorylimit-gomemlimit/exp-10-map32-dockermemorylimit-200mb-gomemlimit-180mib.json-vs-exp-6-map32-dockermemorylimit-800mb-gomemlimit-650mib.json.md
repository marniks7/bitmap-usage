### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|3.72ms|worth: on 1.328ms, on -26.31%, in 0.7 times |
|90%|11.405ms|7.25ms|worth: on 4.155ms, on -36.43%, in 0.6 times , -1 order of magnitude|
|95%|13.544ms|8.386ms|worth: on 5.158ms, on -38.08%, in 0.6 times , -1 order of magnitude|
|97%|14.846ms|8.938ms|worth: on 5.908ms, on -39.80%, in 0.6 times , -1 order of magnitude|
|98%|15.813ms|9.334ms|worth: on 6.479ms, on -40.97%, in 0.6 times , -1 order of magnitude|
|99%|17.471ms|9.808ms|worth: on 7.663ms, on -43.86%, in 0.6 times , -1 order of magnitude|
|99.999%|49.351ms|65.501ms|better: on 16.15ms, on 32.72%, in 1.3 times |
|Requests, count|111948|158549|less: -29.4% , in 0.7 times |
