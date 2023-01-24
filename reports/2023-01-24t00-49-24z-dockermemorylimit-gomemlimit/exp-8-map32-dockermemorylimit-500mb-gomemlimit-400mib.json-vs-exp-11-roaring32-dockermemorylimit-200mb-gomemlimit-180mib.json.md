### Difference Report
Case1: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.751ms|577µs|worth: on 3.174ms, on -84.62%, in 0.2 times , -1 order of magnitude|
|90%|7.383ms|2.32ms|worth: on 5.063ms, on -68.58%, in 0.3 times |
|95%|8.545ms|3.324ms|worth: on 5.221ms, on -61.10%, in 0.4 times |
|97%|9.127ms|4.121ms|worth: on 5.006ms, on -54.85%, in 0.5 times |
|98%|9.496ms|4.768ms|worth: on 4.728ms, on -49.79%, in 0.5 times |
|99%|9.936ms|5.818ms|worth: on 4.118ms, on -41.45%, in 0.6 times |
|99.999%|51.45ms|34.963ms|worth: on 16.487ms, on -32.04%, in 0.7 times |
|Requests, count|156741|851255|less: -81.6% , in 0.2 times |
