### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|409µs|better: on 10µs, on 2.51%, in 1.0 times |
|90%|796µs|829µs|better: on 33µs, on 4.15%, in 1.0 times |
|95%|930µs|978µs|better: on 48µs, on 5.16%, in 1.1 times |
|97%|1.018ms|1.088ms|better: on 70µs, on 6.88%, in 1.1 times |
|98%|1.085ms|1.202ms|better: on 117µs, on 10.78%, in 1.1 times |
|99%|1.23ms|2.158ms|better: on 928µs, on 75.45%, in 1.8 times |
|99.999%|58.327ms|32.233ms|worth: on 26.094ms, on -44.74%, in 0.6 times |
|Requests, count|1390640|1351536|more: 2.9% , in 1.0 times |
