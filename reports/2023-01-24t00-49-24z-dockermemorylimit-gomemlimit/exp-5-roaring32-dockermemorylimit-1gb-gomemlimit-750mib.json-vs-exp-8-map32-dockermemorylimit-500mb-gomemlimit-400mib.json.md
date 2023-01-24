### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|3.751ms|better: on 3.342ms, on 817.11%, in 9.2 times , 1 order of magnitude|
|90%|829µs|7.383ms|better: on 6.554ms, on 790.59%, in 8.9 times , 1 order of magnitude|
|95%|978µs|8.545ms|better: on 7.567ms, on 773.72%, in 8.7 times , 1 order of magnitude|
|97%|1.088ms|9.127ms|better: on 8.039ms, on 738.88%, in 8.4 times |
|98%|1.202ms|9.496ms|better: on 8.294ms, on 690.02%, in 7.9 times |
|99%|2.158ms|9.936ms|better: on 7.778ms, on 360.43%, in 4.6 times |
|99.999%|32.233ms|51.45ms|better: on 19.217ms, on 59.62%, in 1.6 times |
|Requests, count|1351536|156741|more: 762.3% , in 8.6 times |
