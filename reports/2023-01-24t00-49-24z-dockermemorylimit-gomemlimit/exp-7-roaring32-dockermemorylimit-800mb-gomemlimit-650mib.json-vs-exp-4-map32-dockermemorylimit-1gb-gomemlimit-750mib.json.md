### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|3.639ms|better: on 3.225ms, on 778.99%, in 8.8 times , 1 order of magnitude|
|90%|848µs|7.119ms|better: on 6.271ms, on 739.50%, in 8.4 times , 1 order of magnitude|
|95%|1.005ms|8.239ms|better: on 7.234ms, on 719.80%, in 8.2 times |
|97%|1.13ms|8.773ms|better: on 7.643ms, on 676.37%, in 7.8 times |
|98%|1.303ms|9.099ms|better: on 7.796ms, on 598.31%, in 7.0 times |
|99%|2.733ms|9.597ms|better: on 6.864ms, on 251.15%, in 3.5 times |
|99.999%|62.218ms|52.769ms|worth: on 9.449ms, on -15.19%, in 0.8 times |
|Requests, count|1331229|160945|more: 727.1% , in 8.3 times |
