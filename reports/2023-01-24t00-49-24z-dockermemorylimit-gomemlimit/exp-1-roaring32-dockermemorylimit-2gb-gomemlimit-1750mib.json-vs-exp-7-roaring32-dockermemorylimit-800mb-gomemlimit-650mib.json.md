### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|414µs|better: on 37µs, on 9.81%, in 1.1 times |
|90%|751µs|848µs|better: on 97µs, on 12.92%, in 1.1 times |
|95%|873µs|1.005ms|better: on 132µs, on 15.12%, in 1.2 times , 1 order of magnitude|
|97%|954µs|1.13ms|better: on 176µs, on 18.45%, in 1.2 times , 1 order of magnitude|
|98%|1.014ms|1.303ms|better: on 289µs, on 28.50%, in 1.3 times |
|99%|1.126ms|2.733ms|better: on 1.607ms, on 142.72%, in 2.4 times |
|99.999%|43.02ms|62.218ms|better: on 19.198ms, on 44.63%, in 1.4 times |
|Requests, count|1475585|1331229|more: 10.8% , in 1.1 times |
