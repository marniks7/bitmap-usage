### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|414µs|worth: on 3.306ms, on -88.87%, in 0.1 times , -1 order of magnitude|
|90%|7.25ms|848µs|worth: on 6.402ms, on -88.30%, in 0.1 times , -1 order of magnitude|
|95%|8.386ms|1.005ms|worth: on 7.381ms, on -88.02%, in 0.1 times |
|97%|8.938ms|1.13ms|worth: on 7.808ms, on -87.36%, in 0.1 times |
|98%|9.334ms|1.303ms|worth: on 8.031ms, on -86.04%, in 0.1 times |
|99%|9.808ms|2.733ms|worth: on 7.075ms, on -72.13%, in 0.3 times |
|99.999%|65.501ms|62.218ms|worth: on 3.283ms, on -5.01%, in 0.9 times |
|Requests, count|158549|1331229|less: -88.1% , in 0.1 times |
