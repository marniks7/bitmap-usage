### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|3.54ms|better: on 6µs, on 0.17%, in 1.0 times |
|90%|7.001ms|7.023ms|better: on 22µs, on 0.31%, in 1.0 times |
|95%|8.092ms|8.12ms|better: on 28µs, on 0.35%, in 1.0 times |
|97%|8.618ms|8.643ms|better: on 25µs, on 0.29%, in 1.0 times |
|98%|8.953ms|9.005ms|better: on 52µs, on 0.58%, in 1.0 times |
|99%|9.388ms|9.442ms|better: on 54µs, on 0.58%, in 1.0 times |
|99.999%|11.856ms|18.167ms|better: on 6.311ms, on 53.23%, in 1.5 times |
|Requests, count|164883|164757|more: 0.1% , in 1.0 times |
