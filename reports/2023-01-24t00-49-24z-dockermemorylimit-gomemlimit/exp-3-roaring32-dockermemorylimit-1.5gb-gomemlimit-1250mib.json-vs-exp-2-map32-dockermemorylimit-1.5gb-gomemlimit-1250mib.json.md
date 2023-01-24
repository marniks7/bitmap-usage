### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|3.715ms|better: on 3.316ms, on 831.08%, in 9.3 times , 1 order of magnitude|
|90%|796µs|7.27ms|better: on 6.474ms, on 813.32%, in 9.1 times , 1 order of magnitude|
|95%|930µs|8.413ms|better: on 7.483ms, on 804.62%, in 9.0 times , 1 order of magnitude|
|97%|1.018ms|8.967ms|better: on 7.949ms, on 780.84%, in 8.8 times |
|98%|1.085ms|9.35ms|better: on 8.265ms, on 761.75%, in 8.6 times |
|99%|1.23ms|9.799ms|better: on 8.569ms, on 696.67%, in 8.0 times |
|99.999%|58.327ms|38.249ms|worth: on 20.078ms, on -34.42%, in 0.7 times |
|Requests, count|1390640|158459|more: 777.6% , in 8.8 times |
