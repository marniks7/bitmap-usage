### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|3.69ms|better: on 3.281ms, on 802.20%, in 9.0 times , 1 order of magnitude|
|90%|829µs|7.254ms|better: on 6.425ms, on 775.03%, in 8.8 times , 1 order of magnitude|
|95%|978µs|8.396ms|better: on 7.418ms, on 758.49%, in 8.6 times , 1 order of magnitude|
|97%|1.088ms|8.975ms|better: on 7.887ms, on 724.91%, in 8.2 times |
|98%|1.202ms|9.347ms|better: on 8.145ms, on 677.62%, in 7.8 times |
|99%|2.158ms|9.772ms|better: on 7.614ms, on 352.83%, in 4.5 times |
|99.999%|32.233ms|49.717ms|better: on 17.484ms, on 54.24%, in 1.5 times |
|Requests, count|1351536|159419|more: 747.8% , in 8.5 times |
