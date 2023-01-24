### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|3.639ms|better: on 3.23ms, on 789.73%, in 8.9 times , 1 order of magnitude|
|90%|829µs|7.119ms|better: on 6.29ms, on 758.75%, in 8.6 times , 1 order of magnitude|
|95%|978µs|8.239ms|better: on 7.261ms, on 742.43%, in 8.4 times , 1 order of magnitude|
|97%|1.088ms|8.773ms|better: on 7.685ms, on 706.34%, in 8.1 times |
|98%|1.202ms|9.099ms|better: on 7.897ms, on 656.99%, in 7.6 times |
|99%|2.158ms|9.597ms|better: on 7.439ms, on 344.72%, in 4.4 times |
|99.999%|32.233ms|52.769ms|better: on 20.536ms, on 63.71%, in 1.6 times |
|Requests, count|1351536|160945|more: 739.8% , in 8.4 times |
