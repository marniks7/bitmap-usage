### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|3.751ms|better: on 3.174ms, on 550.09%, in 6.5 times , 1 order of magnitude|
|90%|2.32ms|7.383ms|better: on 5.063ms, on 218.23%, in 3.2 times |
|95%|3.324ms|8.545ms|better: on 5.221ms, on 157.07%, in 2.6 times |
|97%|4.121ms|9.127ms|better: on 5.006ms, on 121.48%, in 2.2 times |
|98%|4.768ms|9.496ms|better: on 4.728ms, on 99.16%, in 2.0 times |
|99%|5.818ms|9.936ms|better: on 4.118ms, on 70.78%, in 1.7 times |
|99.999%|34.963ms|51.45ms|better: on 16.487ms, on 47.16%, in 1.5 times |
|Requests, count|851255|156741|more: 443.1% , in 5.4 times |
