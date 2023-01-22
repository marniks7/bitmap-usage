### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Default-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.791ms|3.891ms|better: on 100µs, on 2.64%, in 1.0 times |
|90%|7.572ms|7.703ms|better: on 131µs, on 1.73%, in 1.0 times |
|95%|8.707ms|8.88ms|better: on 173µs, on 1.99%, in 1.0 times |
|97%|9.333ms|9.467ms|better: on 134µs, on 1.44%, in 1.0 times |
|98%|9.732ms|9.945ms|better: on 213µs, on 2.19%, in 1.0 times |
|99%|10.481ms|10.744ms|better: on 263µs, on 2.51%, in 1.0 times |
|99.999%|24.058ms|16.616ms|worth: on 7.442ms, on -30.93%, in 0.7 times |
|Requests, count|155306|151482|more: 2.5% , in 1.0 times |
