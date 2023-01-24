### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|399µs|worth: on 3.291ms, on -89.19%, in 0.1 times , -1 order of magnitude|
|90%|7.254ms|796µs|worth: on 6.458ms, on -89.03%, in 0.1 times , -1 order of magnitude|
|95%|8.396ms|930µs|worth: on 7.466ms, on -88.92%, in 0.1 times , -1 order of magnitude|
|97%|8.975ms|1.018ms|worth: on 7.957ms, on -88.66%, in 0.1 times |
|98%|9.347ms|1.085ms|worth: on 8.262ms, on -88.39%, in 0.1 times |
|99%|9.772ms|1.23ms|worth: on 8.542ms, on -87.41%, in 0.1 times |
|99.999%|49.717ms|58.327ms|better: on 8.61ms, on 17.32%, in 1.2 times |
|Requests, count|159419|1390640|less: -88.5% , in 0.1 times |
