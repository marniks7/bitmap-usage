### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|399µs|worth: on 3.24ms, on -89.04%, in 0.1 times , -1 order of magnitude|
|90%|7.119ms|796µs|worth: on 6.323ms, on -88.82%, in 0.1 times , -1 order of magnitude|
|95%|8.239ms|930µs|worth: on 7.309ms, on -88.71%, in 0.1 times , -1 order of magnitude|
|97%|8.773ms|1.018ms|worth: on 7.755ms, on -88.40%, in 0.1 times |
|98%|9.099ms|1.085ms|worth: on 8.014ms, on -88.08%, in 0.1 times |
|99%|9.597ms|1.23ms|worth: on 8.367ms, on -87.18%, in 0.1 times |
|99.999%|52.769ms|58.327ms|better: on 5.558ms, on 10.53%, in 1.1 times |
|Requests, count|160945|1390640|less: -88.4% , in 0.1 times |
