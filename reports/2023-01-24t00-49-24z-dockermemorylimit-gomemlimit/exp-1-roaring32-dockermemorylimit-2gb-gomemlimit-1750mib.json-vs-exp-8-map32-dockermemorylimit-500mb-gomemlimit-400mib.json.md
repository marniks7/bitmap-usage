### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|3.751ms|better: on 3.374ms, on 894.96%, in 9.9 times , 1 order of magnitude|
|90%|751µs|7.383ms|better: on 6.632ms, on 883.09%, in 9.8 times , 1 order of magnitude|
|95%|873µs|8.545ms|better: on 7.672ms, on 878.81%, in 9.8 times , 1 order of magnitude|
|97%|954µs|9.127ms|better: on 8.173ms, on 856.71%, in 9.6 times , 1 order of magnitude|
|98%|1.014ms|9.496ms|better: on 8.482ms, on 836.49%, in 9.4 times |
|99%|1.126ms|9.936ms|better: on 8.81ms, on 782.42%, in 8.8 times |
|99.999%|43.02ms|51.45ms|better: on 8.43ms, on 19.60%, in 1.2 times |
|Requests, count|1475585|156741|more: 841.4% , in 9.4 times |
