### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|3.72ms|better: on 3.343ms, on 886.74%, in 9.9 times , 1 order of magnitude|
|90%|751µs|7.25ms|better: on 6.499ms, on 865.38%, in 9.7 times , 1 order of magnitude|
|95%|873µs|8.386ms|better: on 7.513ms, on 860.60%, in 9.6 times , 1 order of magnitude|
|97%|954µs|8.938ms|better: on 7.984ms, on 836.90%, in 9.4 times , 1 order of magnitude|
|98%|1.014ms|9.334ms|better: on 8.32ms, on 820.51%, in 9.2 times |
|99%|1.126ms|9.808ms|better: on 8.682ms, on 771.05%, in 8.7 times |
|99.999%|43.02ms|65.501ms|better: on 22.481ms, on 52.26%, in 1.5 times |
|Requests, count|1475585|158549|more: 830.7% , in 9.3 times |
