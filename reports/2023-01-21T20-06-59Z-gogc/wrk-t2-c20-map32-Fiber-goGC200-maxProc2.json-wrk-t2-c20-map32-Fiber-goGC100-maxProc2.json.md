### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.572ms|3.54ms|worth: on 32µs, on -0.90%, in 1.0 times |
|90%|7.055ms|7.023ms|worth: on 32µs, on -0.45%, in 1.0 times |
|95%|8.162ms|8.12ms|worth: on 42µs, on -0.51%, in 1.0 times |
|97%|8.682ms|8.643ms|worth: on 39µs, on -0.45%, in 1.0 times |
|98%|9.031ms|9.005ms|worth: on 26µs, on -0.29%, in 1.0 times |
|99%|9.464ms|9.442ms|worth: on 22µs, on -0.23%, in 1.0 times |
|99.999%|11.692ms|18.167ms|better: on 6.475ms, on 55.38%, in 1.6 times |
|Requests, count|163501|164757|less: -0.8% , in 1.0 times |
