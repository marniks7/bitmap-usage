### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|377µs|worth: on 37µs, on -8.94%, in 0.9 times |
|90%|848µs|751µs|worth: on 97µs, on -11.44%, in 0.9 times |
|95%|1.005ms|873µs|worth: on 132µs, on -13.13%, in 0.9 times , -1 order of magnitude|
|97%|1.13ms|954µs|worth: on 176µs, on -15.58%, in 0.8 times , -1 order of magnitude|
|98%|1.303ms|1.014ms|worth: on 289µs, on -22.18%, in 0.8 times |
|99%|2.733ms|1.126ms|worth: on 1.607ms, on -58.80%, in 0.4 times |
|99.999%|62.218ms|43.02ms|worth: on 19.198ms, on -30.86%, in 0.7 times |
|Requests, count|1331229|1475585|less: -9.8% , in 0.9 times |
