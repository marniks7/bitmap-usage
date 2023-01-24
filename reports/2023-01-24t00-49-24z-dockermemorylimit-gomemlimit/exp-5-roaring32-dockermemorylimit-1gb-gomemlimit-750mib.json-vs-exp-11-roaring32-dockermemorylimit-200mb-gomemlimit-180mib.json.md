### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|577µs|better: on 168µs, on 41.08%, in 1.4 times |
|90%|829µs|2.32ms|better: on 1.491ms, on 179.86%, in 2.8 times , 1 order of magnitude|
|95%|978µs|3.324ms|better: on 2.346ms, on 239.88%, in 3.4 times , 1 order of magnitude|
|97%|1.088ms|4.121ms|better: on 3.033ms, on 278.77%, in 3.8 times |
|98%|1.202ms|4.768ms|better: on 3.566ms, on 296.67%, in 4.0 times |
|99%|2.158ms|5.818ms|better: on 3.66ms, on 169.60%, in 2.7 times |
|99.999%|32.233ms|34.963ms|better: on 2.73ms, on 8.47%, in 1.1 times |
|Requests, count|1351536|851255|more: 58.8% , in 1.6 times |
