### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|3.639ms|worth: on 1.409ms, on -27.91%, in 0.7 times |
|90%|11.405ms|7.119ms|worth: on 4.286ms, on -37.58%, in 0.6 times , -1 order of magnitude|
|95%|13.544ms|8.239ms|worth: on 5.305ms, on -39.17%, in 0.6 times , -1 order of magnitude|
|97%|14.846ms|8.773ms|worth: on 6.073ms, on -40.91%, in 0.6 times , -1 order of magnitude|
|98%|15.813ms|9.099ms|worth: on 6.714ms, on -42.46%, in 0.6 times , -1 order of magnitude|
|99%|17.471ms|9.597ms|worth: on 7.874ms, on -45.07%, in 0.5 times , -1 order of magnitude|
|99.999%|49.351ms|52.769ms|better: on 3.418ms, on 6.93%, in 1.1 times |
|Requests, count|111948|160945|less: -30.4% , in 0.7 times |
