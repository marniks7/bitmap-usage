### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.54ms|3.581ms|better: on 41µs, on 1.16%, in 1.0 times |
|90%|7.023ms|7.072ms|better: on 49µs, on 0.70%, in 1.0 times |
|95%|8.12ms|8.168ms|better: on 48µs, on 0.59%, in 1.0 times |
|97%|8.643ms|8.693ms|better: on 50µs, on 0.58%, in 1.0 times |
|98%|9.005ms|9.083ms|better: on 78µs, on 0.87%, in 1.0 times |
|99%|9.442ms|9.496ms|better: on 54µs, on 0.57%, in 1.0 times |
|99.999%|18.167ms|14.528ms|worth: on 3.639ms, on -20.03%, in 0.8 times |
|Requests, count|164757|163640|more: 0.7% , in 1.0 times |
