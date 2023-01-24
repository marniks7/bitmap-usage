### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|3.751ms|better: on 3.352ms, on 840.10%, in 9.4 times , 1 order of magnitude|
|90%|796µs|7.383ms|better: on 6.587ms, on 827.51%, in 9.3 times , 1 order of magnitude|
|95%|930µs|8.545ms|better: on 7.615ms, on 818.82%, in 9.2 times , 1 order of magnitude|
|97%|1.018ms|9.127ms|better: on 8.109ms, on 796.56%, in 9.0 times |
|98%|1.085ms|9.496ms|better: on 8.411ms, on 775.21%, in 8.8 times |
|99%|1.23ms|9.936ms|better: on 8.706ms, on 707.80%, in 8.1 times |
|99.999%|58.327ms|51.45ms|worth: on 6.877ms, on -11.79%, in 0.9 times |
|Requests, count|1390640|156741|more: 787.2% , in 8.9 times |
