### Difference Report
Case1: exp-5-roaring32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|409µs|3.72ms|better: on 3.311ms, on 809.54%, in 9.1 times , 1 order of magnitude|
|90%|829µs|7.25ms|better: on 6.421ms, on 774.55%, in 8.7 times , 1 order of magnitude|
|95%|978µs|8.386ms|better: on 7.408ms, on 757.46%, in 8.6 times , 1 order of magnitude|
|97%|1.088ms|8.938ms|better: on 7.85ms, on 721.51%, in 8.2 times |
|98%|1.202ms|9.334ms|better: on 8.132ms, on 676.54%, in 7.8 times |
|99%|2.158ms|9.808ms|better: on 7.65ms, on 354.49%, in 4.5 times |
|99.999%|32.233ms|65.501ms|better: on 33.268ms, on 103.21%, in 2.0 times |
|Requests, count|1351536|158549|more: 752.4% , in 8.5 times |
