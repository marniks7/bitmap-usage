### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|399µs|worth: on 15µs, on -3.62%, in 1.0 times |
|90%|848µs|796µs|worth: on 52µs, on -6.13%, in 0.9 times |
|95%|1.005ms|930µs|worth: on 75µs, on -7.46%, in 0.9 times , -1 order of magnitude|
|97%|1.13ms|1.018ms|worth: on 112µs, on -9.91%, in 0.9 times |
|98%|1.303ms|1.085ms|worth: on 218µs, on -16.73%, in 0.8 times |
|99%|2.733ms|1.23ms|worth: on 1.503ms, on -54.99%, in 0.5 times |
|99.999%|62.218ms|58.327ms|worth: on 3.891ms, on -6.25%, in 0.9 times |
|Requests, count|1331229|1390640|less: -4.3% , in 1.0 times |
