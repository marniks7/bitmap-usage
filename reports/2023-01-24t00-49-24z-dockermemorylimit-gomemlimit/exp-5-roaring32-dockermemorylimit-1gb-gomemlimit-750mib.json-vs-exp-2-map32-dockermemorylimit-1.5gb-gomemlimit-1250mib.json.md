### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|3.715ms|better: on 3.306ms, on 808.31%, in 9.1 times , 1 order of magnitude|
|90%|829µs|7.27ms|better: on 6.441ms, on 776.96%, in 8.8 times , 1 order of magnitude|
|95%|978µs|8.413ms|better: on 7.435ms, on 760.22%, in 8.6 times , 1 order of magnitude|
|97%|1.088ms|8.967ms|better: on 7.879ms, on 724.17%, in 8.2 times |
|98%|1.202ms|9.35ms|better: on 8.148ms, on 677.87%, in 7.8 times |
|99%|2.158ms|9.799ms|better: on 7.641ms, on 354.08%, in 4.5 times |
|99.999%|32.233ms|38.249ms|better: on 6.016ms, on 18.66%, in 1.2 times |
|Requests, count|1351536|158459|more: 752.9% , in 8.5 times |
