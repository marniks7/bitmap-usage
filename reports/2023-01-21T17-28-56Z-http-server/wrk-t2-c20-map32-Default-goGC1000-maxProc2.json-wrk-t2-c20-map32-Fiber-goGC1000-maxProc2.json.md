### Difference Report
Case1: wrk-t2-c20-map32-Default-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.891ms|3.791ms|worth: on 100µs, on -2.57%, in 1.0 times |
|90%|7.703ms|7.572ms|worth: on 131µs, on -1.70%, in 1.0 times |
|95%|8.88ms|8.707ms|worth: on 173µs, on -1.95%, in 1.0 times |
|97%|9.467ms|9.333ms|worth: on 134µs, on -1.42%, in 1.0 times |
|98%|9.945ms|9.732ms|worth: on 213µs, on -2.14%, in 1.0 times |
|99%|10.744ms|10.481ms|worth: on 263µs, on -2.45%, in 1.0 times |
|99.999%|16.616ms|24.058ms|better: on 7.442ms, on 44.79%, in 1.4 times |
|Requests, count|151482|155306|less: -2.5% , in 1.0 times |
