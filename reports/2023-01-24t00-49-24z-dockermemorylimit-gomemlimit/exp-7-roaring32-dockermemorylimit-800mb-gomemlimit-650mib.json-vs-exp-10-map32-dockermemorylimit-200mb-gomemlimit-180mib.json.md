### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|5.048ms|better: on 4.634ms, on 1119.32%, in 12.2 times , 1 order of magnitude|
|90%|848µs|11.405ms|better: on 10.557ms, on 1244.93%, in 13.4 times , 2 order of magnitude|
|95%|1.005ms|13.544ms|better: on 12.539ms, on 1247.66%, in 13.5 times , 1 order of magnitude|
|97%|1.13ms|14.846ms|better: on 13.716ms, on 1213.81%, in 13.1 times , 1 order of magnitude|
|98%|1.303ms|15.813ms|better: on 14.51ms, on 1113.58%, in 12.1 times , 1 order of magnitude|
|99%|2.733ms|17.471ms|better: on 14.738ms, on 539.26%, in 6.4 times , 1 order of magnitude|
|99.999%|62.218ms|49.351ms|worth: on 12.867ms, on -20.68%, in 0.8 times |
|Requests, count|1331229|111948|more: 1089.1% , in 11.9 times |
