### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|409µs|better: on 32µs, on 8.49%, in 1.1 times |
|90%|751µs|829µs|better: on 78µs, on 10.39%, in 1.1 times |
|95%|873µs|978µs|better: on 105µs, on 12.03%, in 1.1 times |
|97%|954µs|1.088ms|better: on 134µs, on 14.05%, in 1.1 times , 1 order of magnitude|
|98%|1.014ms|1.202ms|better: on 188µs, on 18.54%, in 1.2 times |
|99%|1.126ms|2.158ms|better: on 1.032ms, on 91.65%, in 1.9 times |
|99.999%|43.02ms|32.233ms|worth: on 10.787ms, on -25.07%, in 0.7 times |
|Requests, count|1475585|1351536|more: 9.2% , in 1.1 times |
