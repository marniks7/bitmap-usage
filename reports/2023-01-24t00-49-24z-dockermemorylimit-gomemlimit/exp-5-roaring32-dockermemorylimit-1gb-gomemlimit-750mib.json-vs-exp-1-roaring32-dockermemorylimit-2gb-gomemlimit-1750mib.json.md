### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|377µs|worth: on 32µs, on -7.82%, in 0.9 times |
|90%|829µs|751µs|worth: on 78µs, on -9.41%, in 0.9 times |
|95%|978µs|873µs|worth: on 105µs, on -10.74%, in 0.9 times |
|97%|1.088ms|954µs|worth: on 134µs, on -12.32%, in 0.9 times , -1 order of magnitude|
|98%|1.202ms|1.014ms|worth: on 188µs, on -15.64%, in 0.8 times |
|99%|2.158ms|1.126ms|worth: on 1.032ms, on -47.82%, in 0.5 times |
|99.999%|32.233ms|43.02ms|better: on 10.787ms, on 33.47%, in 1.3 times |
|Requests, count|1351536|1475585|less: -8.4% , in 0.9 times |
