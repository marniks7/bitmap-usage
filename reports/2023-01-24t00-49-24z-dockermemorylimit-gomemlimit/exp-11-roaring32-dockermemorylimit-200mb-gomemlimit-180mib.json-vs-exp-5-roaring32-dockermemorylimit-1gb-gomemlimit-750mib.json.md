### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|409µs|worth: on 168µs, on -29.12%, in 0.7 times |
|90%|2.32ms|829µs|worth: on 1.491ms, on -64.27%, in 0.4 times , -1 order of magnitude|
|95%|3.324ms|978µs|worth: on 2.346ms, on -70.58%, in 0.3 times , -1 order of magnitude|
|97%|4.121ms|1.088ms|worth: on 3.033ms, on -73.60%, in 0.3 times |
|98%|4.768ms|1.202ms|worth: on 3.566ms, on -74.79%, in 0.3 times |
|99%|5.818ms|2.158ms|worth: on 3.66ms, on -62.91%, in 0.4 times |
|99.999%|34.963ms|32.233ms|worth: on 2.73ms, on -7.81%, in 0.9 times |
|Requests, count|851255|1351536|less: -37.0% , in 0.6 times |
