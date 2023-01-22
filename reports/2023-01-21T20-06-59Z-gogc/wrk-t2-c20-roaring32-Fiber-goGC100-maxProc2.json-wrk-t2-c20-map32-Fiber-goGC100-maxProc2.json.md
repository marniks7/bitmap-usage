### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|3.54ms|better: on 3.252ms, on 1129.17%, in 12.3 times , 1 order of magnitude|
|90%|676µs|7.023ms|better: on 6.347ms, on 938.91%, in 10.4 times , 1 order of magnitude|
|95%|1.182ms|8.12ms|better: on 6.938ms, on 586.97%, in 6.9 times |
|97%|2.563ms|8.643ms|better: on 6.08ms, on 237.22%, in 3.4 times |
|98%|3.749ms|9.005ms|better: on 5.256ms, on 140.20%, in 2.4 times |
|99%|5.576ms|9.442ms|better: on 3.866ms, on 69.33%, in 1.7 times |
|99.999%|11.676ms|18.167ms|better: on 6.491ms, on 55.59%, in 1.6 times |
|Requests, count|1884912|164757|more: 1044.1% , in 11.4 times |
