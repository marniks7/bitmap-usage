### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.549ms|3.54ms|worth: on 9µs, on -0.25%, in 1.0 times |
|90%|6.985ms|7.023ms|better: on 38µs, on 0.54%, in 1.0 times |
|95%|8.091ms|8.12ms|better: on 29µs, on 0.36%, in 1.0 times |
|97%|8.621ms|8.643ms|better: on 22µs, on 0.26%, in 1.0 times |
|98%|8.93ms|9.005ms|better: on 75µs, on 0.84%, in 1.0 times |
|99%|9.398ms|9.442ms|better: on 44µs, on 0.47%, in 1.0 times |
|99.999%|11.742ms|18.167ms|better: on 6.425ms, on 54.72%, in 1.5 times |
|Requests, count|164298|164757|less: -0.3% , in 1.0 times |
