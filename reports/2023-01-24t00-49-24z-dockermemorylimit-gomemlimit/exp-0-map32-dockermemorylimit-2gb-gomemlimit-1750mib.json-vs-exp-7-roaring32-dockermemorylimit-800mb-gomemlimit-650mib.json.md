### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|414µs|worth: on 3.276ms, on -88.78%, in 0.1 times , -1 order of magnitude|
|90%|7.254ms|848µs|worth: on 6.406ms, on -88.31%, in 0.1 times , -1 order of magnitude|
|95%|8.396ms|1.005ms|worth: on 7.391ms, on -88.03%, in 0.1 times |
|97%|8.975ms|1.13ms|worth: on 7.845ms, on -87.41%, in 0.1 times |
|98%|9.347ms|1.303ms|worth: on 8.044ms, on -86.06%, in 0.1 times |
|99%|9.772ms|2.733ms|worth: on 7.039ms, on -72.03%, in 0.3 times |
|99.999%|49.717ms|62.218ms|better: on 12.501ms, on 25.14%, in 1.3 times |
|Requests, count|159419|1331229|less: -88.0% , in 0.1 times |
