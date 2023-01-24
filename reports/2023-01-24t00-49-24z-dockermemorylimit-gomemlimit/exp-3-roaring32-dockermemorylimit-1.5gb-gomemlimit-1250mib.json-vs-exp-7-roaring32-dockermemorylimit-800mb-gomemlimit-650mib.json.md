### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|414µs|better: on 15µs, on 3.76%, in 1.0 times |
|90%|796µs|848µs|better: on 52µs, on 6.53%, in 1.1 times |
|95%|930µs|1.005ms|better: on 75µs, on 8.06%, in 1.1 times , 1 order of magnitude|
|97%|1.018ms|1.13ms|better: on 112µs, on 11.00%, in 1.1 times |
|98%|1.085ms|1.303ms|better: on 218µs, on 20.09%, in 1.2 times |
|99%|1.23ms|2.733ms|better: on 1.503ms, on 122.20%, in 2.2 times |
|99.999%|58.327ms|62.218ms|better: on 3.891ms, on 6.67%, in 1.1 times |
|Requests, count|1390640|1331229|more: 4.5% , in 1.0 times |
