### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|399µs|better: on 22µs, on 5.84%, in 1.1 times |
|90%|751µs|796µs|better: on 45µs, on 5.99%, in 1.1 times |
|95%|873µs|930µs|better: on 57µs, on 6.53%, in 1.1 times |
|97%|954µs|1.018ms|better: on 64µs, on 6.71%, in 1.1 times , 1 order of magnitude|
|98%|1.014ms|1.085ms|better: on 71µs, on 7.00%, in 1.1 times |
|99%|1.126ms|1.23ms|better: on 104µs, on 9.24%, in 1.1 times |
|99.999%|43.02ms|58.327ms|better: on 15.307ms, on 35.58%, in 1.4 times |
|Requests, count|1475585|1390640|more: 6.1% , in 1.1 times |
