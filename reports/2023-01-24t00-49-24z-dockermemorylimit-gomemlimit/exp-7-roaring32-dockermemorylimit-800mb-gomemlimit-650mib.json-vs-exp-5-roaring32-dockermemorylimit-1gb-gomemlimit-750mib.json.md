### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|409µs|worth: on 5µs, on -1.21%, in 1.0 times |
|90%|848µs|829µs|worth: on 19µs, on -2.24%, in 1.0 times |
|95%|1.005ms|978µs|worth: on 27µs, on -2.69%, in 1.0 times , -1 order of magnitude|
|97%|1.13ms|1.088ms|worth: on 42µs, on -3.72%, in 1.0 times |
|98%|1.303ms|1.202ms|worth: on 101µs, on -7.75%, in 0.9 times |
|99%|2.733ms|2.158ms|worth: on 575µs, on -21.04%, in 0.8 times |
|99.999%|62.218ms|32.233ms|worth: on 29.985ms, on -48.19%, in 0.5 times |
|Requests, count|1331229|1351536|less: -1.5% , in 1.0 times |
