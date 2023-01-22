### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.54ms|3.549ms|better: on 9µs, on 0.25%, in 1.0 times |
|90%|7.023ms|6.985ms|worth: on 38µs, on -0.54%, in 1.0 times |
|95%|8.12ms|8.091ms|worth: on 29µs, on -0.36%, in 1.0 times |
|97%|8.643ms|8.621ms|worth: on 22µs, on -0.25%, in 1.0 times |
|98%|9.005ms|8.93ms|worth: on 75µs, on -0.83%, in 1.0 times |
|99%|9.442ms|9.398ms|worth: on 44µs, on -0.47%, in 1.0 times |
|99.999%|18.167ms|11.742ms|worth: on 6.425ms, on -35.37%, in 0.6 times |
|Requests, count|164757|164298|more: 0.3% , in 1.0 times |
