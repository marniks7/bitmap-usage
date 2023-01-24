### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|3.639ms|better: on 3.24ms, on 812.03%, in 9.1 times , 1 order of magnitude|
|90%|796µs|7.119ms|better: on 6.323ms, on 794.35%, in 8.9 times , 1 order of magnitude|
|95%|930µs|8.239ms|better: on 7.309ms, on 785.91%, in 8.9 times , 1 order of magnitude|
|97%|1.018ms|8.773ms|better: on 7.755ms, on 761.79%, in 8.6 times |
|98%|1.085ms|9.099ms|better: on 8.014ms, on 738.62%, in 8.4 times |
|99%|1.23ms|9.597ms|better: on 8.367ms, on 680.24%, in 7.8 times |
|99.999%|58.327ms|52.769ms|worth: on 5.558ms, on -9.53%, in 0.9 times |
|Requests, count|1390640|160945|more: 764.0% , in 8.6 times |
