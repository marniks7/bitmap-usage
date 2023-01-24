### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|5.048ms|better: on 1.328ms, on 35.70%, in 1.4 times |
|90%|7.25ms|11.405ms|better: on 4.155ms, on 57.31%, in 1.6 times , 1 order of magnitude|
|95%|8.386ms|13.544ms|better: on 5.158ms, on 61.51%, in 1.6 times , 1 order of magnitude|
|97%|8.938ms|14.846ms|better: on 5.908ms, on 66.10%, in 1.7 times , 1 order of magnitude|
|98%|9.334ms|15.813ms|better: on 6.479ms, on 69.41%, in 1.7 times , 1 order of magnitude|
|99%|9.808ms|17.471ms|better: on 7.663ms, on 78.13%, in 1.8 times , 1 order of magnitude|
|99.999%|65.501ms|49.351ms|worth: on 16.15ms, on -24.66%, in 0.8 times |
|Requests, count|158549|111948|more: 41.6% , in 1.4 times |
