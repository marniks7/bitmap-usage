### Difference Report
Case1: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.751ms|414µs|worth: on 3.337ms, on -88.96%, in 0.1 times , -1 order of magnitude|
|90%|7.383ms|848µs|worth: on 6.535ms, on -88.51%, in 0.1 times , -1 order of magnitude|
|95%|8.545ms|1.005ms|worth: on 7.54ms, on -88.24%, in 0.1 times |
|97%|9.127ms|1.13ms|worth: on 7.997ms, on -87.62%, in 0.1 times |
|98%|9.496ms|1.303ms|worth: on 8.193ms, on -86.28%, in 0.1 times |
|99%|9.936ms|2.733ms|worth: on 7.203ms, on -72.49%, in 0.3 times |
|99.999%|51.45ms|62.218ms|better: on 10.768ms, on 20.93%, in 1.2 times |
|Requests, count|156741|1331229|less: -88.2% , in 0.1 times |
