### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.54ms|3.572ms|better: on 32µs, on 0.90%, in 1.0 times |
|90%|7.023ms|7.055ms|better: on 32µs, on 0.46%, in 1.0 times |
|95%|8.12ms|8.162ms|better: on 42µs, on 0.52%, in 1.0 times |
|97%|8.643ms|8.682ms|better: on 39µs, on 0.45%, in 1.0 times |
|98%|9.005ms|9.031ms|better: on 26µs, on 0.29%, in 1.0 times |
|99%|9.442ms|9.464ms|better: on 22µs, on 0.23%, in 1.0 times |
|99.999%|18.167ms|11.692ms|worth: on 6.475ms, on -35.64%, in 0.6 times |
|Requests, count|164757|163501|more: 0.8% , in 1.0 times |
