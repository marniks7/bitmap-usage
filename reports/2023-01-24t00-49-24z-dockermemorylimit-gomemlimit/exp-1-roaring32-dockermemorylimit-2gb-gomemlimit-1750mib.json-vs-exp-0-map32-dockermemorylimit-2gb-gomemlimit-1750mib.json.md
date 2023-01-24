### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|3.69ms|better: on 3.313ms, on 878.78%, in 9.8 times , 1 order of magnitude|
|90%|751µs|7.254ms|better: on 6.503ms, on 865.91%, in 9.7 times , 1 order of magnitude|
|95%|873µs|8.396ms|better: on 7.523ms, on 861.74%, in 9.6 times , 1 order of magnitude|
|97%|954µs|8.975ms|better: on 8.021ms, on 840.78%, in 9.4 times , 1 order of magnitude|
|98%|1.014ms|9.347ms|better: on 8.333ms, on 821.79%, in 9.2 times |
|99%|1.126ms|9.772ms|better: on 8.646ms, on 767.85%, in 8.7 times |
|99.999%|43.02ms|49.717ms|better: on 6.697ms, on 15.57%, in 1.2 times |
|Requests, count|1475585|159419|more: 825.6% , in 9.3 times |
