### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|399µs|worth: on 3.321ms, on -89.27%, in 0.1 times , -1 order of magnitude|
|90%|7.25ms|796µs|worth: on 6.454ms, on -89.02%, in 0.1 times , -1 order of magnitude|
|95%|8.386ms|930µs|worth: on 7.456ms, on -88.91%, in 0.1 times , -1 order of magnitude|
|97%|8.938ms|1.018ms|worth: on 7.92ms, on -88.61%, in 0.1 times |
|98%|9.334ms|1.085ms|worth: on 8.249ms, on -88.38%, in 0.1 times |
|99%|9.808ms|1.23ms|worth: on 8.578ms, on -87.46%, in 0.1 times |
|99.999%|65.501ms|58.327ms|worth: on 7.174ms, on -10.95%, in 0.9 times |
|Requests, count|158549|1390640|less: -88.6% , in 0.1 times |
