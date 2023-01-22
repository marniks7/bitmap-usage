### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.54ms|3.559ms|better: on 19µs, on 0.54%, in 1.0 times |
|90%|7.023ms|6.981ms|worth: on 42µs, on -0.60%, in 1.0 times |
|95%|8.12ms|8.082ms|worth: on 38µs, on -0.47%, in 1.0 times |
|97%|8.643ms|8.606ms|worth: on 37µs, on -0.43%, in 1.0 times |
|98%|9.005ms|8.921ms|worth: on 84µs, on -0.93%, in 1.0 times |
|99%|9.442ms|9.376ms|worth: on 66µs, on -0.70%, in 1.0 times |
|99.999%|18.167ms|11.642ms|worth: on 6.525ms, on -35.92%, in 0.6 times |
|Requests, count|164757|164690|more: 0.0% , in 1.0 times |
