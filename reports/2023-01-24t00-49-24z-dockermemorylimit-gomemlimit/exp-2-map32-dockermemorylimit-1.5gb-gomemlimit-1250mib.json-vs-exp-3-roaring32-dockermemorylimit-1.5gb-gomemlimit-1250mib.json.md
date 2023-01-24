### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|399µs|worth: on 3.316ms, on -89.26%, in 0.1 times , -1 order of magnitude|
|90%|7.27ms|796µs|worth: on 6.474ms, on -89.05%, in 0.1 times , -1 order of magnitude|
|95%|8.413ms|930µs|worth: on 7.483ms, on -88.95%, in 0.1 times , -1 order of magnitude|
|97%|8.967ms|1.018ms|worth: on 7.949ms, on -88.65%, in 0.1 times |
|98%|9.35ms|1.085ms|worth: on 8.265ms, on -88.40%, in 0.1 times |
|99%|9.799ms|1.23ms|worth: on 8.569ms, on -87.45%, in 0.1 times |
|99.999%|38.249ms|58.327ms|better: on 20.078ms, on 52.49%, in 1.5 times |
|Requests, count|158459|1390640|less: -88.6% , in 0.1 times |
