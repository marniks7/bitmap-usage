### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|3.715ms|worth: on 1.333ms, on -26.41%, in 0.7 times |
|90%|11.405ms|7.27ms|worth: on 4.135ms, on -36.26%, in 0.6 times , -1 order of magnitude|
|95%|13.544ms|8.413ms|worth: on 5.131ms, on -37.88%, in 0.6 times , -1 order of magnitude|
|97%|14.846ms|8.967ms|worth: on 5.879ms, on -39.60%, in 0.6 times , -1 order of magnitude|
|98%|15.813ms|9.35ms|worth: on 6.463ms, on -40.87%, in 0.6 times , -1 order of magnitude|
|99%|17.471ms|9.799ms|worth: on 7.672ms, on -43.91%, in 0.6 times , -1 order of magnitude|
|99.999%|49.351ms|38.249ms|worth: on 11.102ms, on -22.50%, in 0.8 times |
|Requests, count|111948|158459|less: -29.4% , in 0.7 times |
