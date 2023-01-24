### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|377µs|worth: on 4.671ms, on -92.53%, in 0.1 times , -1 order of magnitude|
|90%|11.405ms|751µs|worth: on 10.654ms, on -93.42%, in 0.1 times , -2 order of magnitude|
|95%|13.544ms|873µs|worth: on 12.671ms, on -93.55%, in 0.1 times , -2 order of magnitude|
|97%|14.846ms|954µs|worth: on 13.892ms, on -93.57%, in 0.1 times , -2 order of magnitude|
|98%|15.813ms|1.014ms|worth: on 14.799ms, on -93.59%, in 0.1 times , -1 order of magnitude|
|99%|17.471ms|1.126ms|worth: on 16.345ms, on -93.56%, in 0.1 times , -1 order of magnitude|
|99.999%|49.351ms|43.02ms|worth: on 6.331ms, on -12.83%, in 0.9 times |
|Requests, count|111948|1475585|less: -92.4% , in 0.1 times |
