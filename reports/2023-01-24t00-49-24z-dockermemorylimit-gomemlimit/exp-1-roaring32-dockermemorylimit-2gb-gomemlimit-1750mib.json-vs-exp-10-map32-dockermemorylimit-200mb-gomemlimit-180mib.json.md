### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|5.048ms|better: on 4.671ms, on 1238.99%, in 13.4 times , 1 order of magnitude|
|90%|751µs|11.405ms|better: on 10.654ms, on 1418.64%, in 15.2 times , 2 order of magnitude|
|95%|873µs|13.544ms|better: on 12.671ms, on 1451.43%, in 15.5 times , 2 order of magnitude|
|97%|954µs|14.846ms|better: on 13.892ms, on 1456.18%, in 15.6 times , 2 order of magnitude|
|98%|1.014ms|15.813ms|better: on 14.799ms, on 1459.47%, in 15.6 times , 1 order of magnitude|
|99%|1.126ms|17.471ms|better: on 16.345ms, on 1451.60%, in 15.5 times , 1 order of magnitude|
|99.999%|43.02ms|49.351ms|better: on 6.331ms, on 14.72%, in 1.1 times |
|Requests, count|1475585|111948|more: 1218.1% , in 13.2 times |
