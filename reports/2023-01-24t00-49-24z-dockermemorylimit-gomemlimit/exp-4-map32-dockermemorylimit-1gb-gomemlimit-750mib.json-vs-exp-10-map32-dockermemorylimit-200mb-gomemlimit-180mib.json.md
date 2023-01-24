### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|5.048ms|better: on 1.409ms, on 38.72%, in 1.4 times |
|90%|7.119ms|11.405ms|better: on 4.286ms, on 60.21%, in 1.6 times , 1 order of magnitude|
|95%|8.239ms|13.544ms|better: on 5.305ms, on 64.39%, in 1.6 times , 1 order of magnitude|
|97%|8.773ms|14.846ms|better: on 6.073ms, on 69.22%, in 1.7 times , 1 order of magnitude|
|98%|9.099ms|15.813ms|better: on 6.714ms, on 73.79%, in 1.7 times , 1 order of magnitude|
|99%|9.597ms|17.471ms|better: on 7.874ms, on 82.05%, in 1.8 times , 1 order of magnitude|
|99.999%|52.769ms|49.351ms|worth: on 3.418ms, on -6.48%, in 0.9 times |
|Requests, count|160945|111948|more: 43.8% , in 1.4 times |
