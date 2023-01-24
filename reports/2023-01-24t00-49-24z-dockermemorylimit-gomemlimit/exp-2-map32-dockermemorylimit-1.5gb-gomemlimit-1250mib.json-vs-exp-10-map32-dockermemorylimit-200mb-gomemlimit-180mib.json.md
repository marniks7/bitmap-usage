### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|5.048ms|better: on 1.333ms, on 35.88%, in 1.4 times |
|90%|7.27ms|11.405ms|better: on 4.135ms, on 56.88%, in 1.6 times , 1 order of magnitude|
|95%|8.413ms|13.544ms|better: on 5.131ms, on 60.99%, in 1.6 times , 1 order of magnitude|
|97%|8.967ms|14.846ms|better: on 5.879ms, on 65.56%, in 1.7 times , 1 order of magnitude|
|98%|9.35ms|15.813ms|better: on 6.463ms, on 69.12%, in 1.7 times , 1 order of magnitude|
|99%|9.799ms|17.471ms|better: on 7.672ms, on 78.29%, in 1.8 times , 1 order of magnitude|
|99.999%|38.249ms|49.351ms|better: on 11.102ms, on 29.03%, in 1.3 times |
|Requests, count|158459|111948|more: 41.5% , in 1.4 times |
