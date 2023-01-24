### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|414µs|worth: on 3.225ms, on -88.62%, in 0.1 times , -1 order of magnitude|
|90%|7.119ms|848µs|worth: on 6.271ms, on -88.09%, in 0.1 times , -1 order of magnitude|
|95%|8.239ms|1.005ms|worth: on 7.234ms, on -87.80%, in 0.1 times |
|97%|8.773ms|1.13ms|worth: on 7.643ms, on -87.12%, in 0.1 times |
|98%|9.099ms|1.303ms|worth: on 7.796ms, on -85.68%, in 0.1 times |
|99%|9.597ms|2.733ms|worth: on 6.864ms, on -71.52%, in 0.3 times |
|99.999%|52.769ms|62.218ms|better: on 9.449ms, on 17.91%, in 1.2 times |
|Requests, count|160945|1331229|less: -87.9% , in 0.1 times |
