### Difference Report
Case1: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.751ms|5.048ms|better: on 1.297ms, on 34.58%, in 1.3 times |
|90%|7.383ms|11.405ms|better: on 4.022ms, on 54.48%, in 1.5 times , 1 order of magnitude|
|95%|8.545ms|13.544ms|better: on 4.999ms, on 58.50%, in 1.6 times , 1 order of magnitude|
|97%|9.127ms|14.846ms|better: on 5.719ms, on 62.66%, in 1.6 times , 1 order of magnitude|
|98%|9.496ms|15.813ms|better: on 6.317ms, on 66.52%, in 1.7 times , 1 order of magnitude|
|99%|9.936ms|17.471ms|better: on 7.535ms, on 75.84%, in 1.8 times , 1 order of magnitude|
|99.999%|51.45ms|49.351ms|worth: on 2.099ms, on -4.08%, in 1.0 times |
|Requests, count|156741|111948|more: 40.0% , in 1.4 times |
