### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|3.751ms|worth: on 1.297ms, on -25.69%, in 0.7 times |
|90%|11.405ms|7.383ms|worth: on 4.022ms, on -35.27%, in 0.6 times , -1 order of magnitude|
|95%|13.544ms|8.545ms|worth: on 4.999ms, on -36.91%, in 0.6 times , -1 order of magnitude|
|97%|14.846ms|9.127ms|worth: on 5.719ms, on -38.52%, in 0.6 times , -1 order of magnitude|
|98%|15.813ms|9.496ms|worth: on 6.317ms, on -39.95%, in 0.6 times , -1 order of magnitude|
|99%|17.471ms|9.936ms|worth: on 7.535ms, on -43.13%, in 0.6 times , -1 order of magnitude|
|99.999%|49.351ms|51.45ms|better: on 2.099ms, on 4.25%, in 1.0 times |
|Requests, count|111948|156741|less: -28.6% , in 0.7 times |
