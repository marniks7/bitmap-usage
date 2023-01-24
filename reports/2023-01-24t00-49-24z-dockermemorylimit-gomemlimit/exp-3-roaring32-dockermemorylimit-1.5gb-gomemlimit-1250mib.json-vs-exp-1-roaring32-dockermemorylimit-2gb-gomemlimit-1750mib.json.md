### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|377µs|worth: on 22µs, on -5.51%, in 0.9 times |
|90%|796µs|751µs|worth: on 45µs, on -5.65%, in 0.9 times |
|95%|930µs|873µs|worth: on 57µs, on -6.13%, in 0.9 times |
|97%|1.018ms|954µs|worth: on 64µs, on -6.29%, in 0.9 times , -1 order of magnitude|
|98%|1.085ms|1.014ms|worth: on 71µs, on -6.54%, in 0.9 times |
|99%|1.23ms|1.126ms|worth: on 104µs, on -8.46%, in 0.9 times |
|99.999%|58.327ms|43.02ms|worth: on 15.307ms, on -26.24%, in 0.7 times |
|Requests, count|1390640|1475585|less: -5.8% , in 0.9 times |
