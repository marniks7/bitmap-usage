### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|399µs|worth: on 10µs, on -2.44%, in 1.0 times |
|90%|829µs|796µs|worth: on 33µs, on -3.98%, in 1.0 times |
|95%|978µs|930µs|worth: on 48µs, on -4.91%, in 1.0 times |
|97%|1.088ms|1.018ms|worth: on 70µs, on -6.43%, in 0.9 times |
|98%|1.202ms|1.085ms|worth: on 117µs, on -9.73%, in 0.9 times |
|99%|2.158ms|1.23ms|worth: on 928µs, on -43.00%, in 0.6 times |
|99.999%|32.233ms|58.327ms|better: on 26.094ms, on 80.95%, in 1.8 times |
|Requests, count|1351536|1390640|less: -2.8% , in 1.0 times |
