### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|3.54ms|better: on 3.26ms, on 1164.29%, in 12.6 times , 1 order of magnitude|
|90%|605µs|7.023ms|better: on 6.418ms, on 1060.83%, in 11.6 times , 1 order of magnitude|
|95%|773µs|8.12ms|better: on 7.347ms, on 950.45%, in 10.5 times , 1 order of magnitude|
|97%|1.159ms|8.643ms|better: on 7.484ms, on 645.73%, in 7.5 times |
|98%|2.155ms|9.005ms|better: on 6.85ms, on 317.87%, in 4.2 times |
|99%|4.146ms|9.442ms|better: on 5.296ms, on 127.74%, in 2.3 times |
|99.999%|11.591ms|18.167ms|better: on 6.576ms, on 56.73%, in 1.6 times |
|Requests, count|1977373|164757|more: 1100.2% , in 12.0 times |
