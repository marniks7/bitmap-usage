### Difference Report
Case1: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.751ms|399µs|worth: on 3.352ms, on -89.36%, in 0.1 times , -1 order of magnitude|
|90%|7.383ms|796µs|worth: on 6.587ms, on -89.22%, in 0.1 times , -1 order of magnitude|
|95%|8.545ms|930µs|worth: on 7.615ms, on -89.12%, in 0.1 times , -1 order of magnitude|
|97%|9.127ms|1.018ms|worth: on 8.109ms, on -88.85%, in 0.1 times |
|98%|9.496ms|1.085ms|worth: on 8.411ms, on -88.57%, in 0.1 times |
|99%|9.936ms|1.23ms|worth: on 8.706ms, on -87.62%, in 0.1 times |
|99.999%|51.45ms|58.327ms|better: on 6.877ms, on 13.37%, in 1.1 times |
|Requests, count|156741|1390640|less: -88.7% , in 0.1 times |
