### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|409µs|worth: on 3.281ms, on -88.92%, in 0.1 times , -1 order of magnitude|
|90%|7.254ms|829µs|worth: on 6.425ms, on -88.57%, in 0.1 times , -1 order of magnitude|
|95%|8.396ms|978µs|worth: on 7.418ms, on -88.35%, in 0.1 times , -1 order of magnitude|
|97%|8.975ms|1.088ms|worth: on 7.887ms, on -87.88%, in 0.1 times |
|98%|9.347ms|1.202ms|worth: on 8.145ms, on -87.14%, in 0.1 times |
|99%|9.772ms|2.158ms|worth: on 7.614ms, on -77.92%, in 0.2 times |
|99.999%|49.717ms|32.233ms|worth: on 17.484ms, on -35.17%, in 0.6 times |
|Requests, count|159419|1351536|less: -88.2% , in 0.1 times |
