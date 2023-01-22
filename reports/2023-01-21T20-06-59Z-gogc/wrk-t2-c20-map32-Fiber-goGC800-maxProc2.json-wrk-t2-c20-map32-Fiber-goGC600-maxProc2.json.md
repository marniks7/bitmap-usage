### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|3.559ms|better: on 25µs, on 0.71%, in 1.0 times |
|90%|7.001ms|6.981ms|worth: on 20µs, on -0.29%, in 1.0 times |
|95%|8.092ms|8.082ms|worth: on 10µs, on -0.12%, in 1.0 times |
|97%|8.618ms|8.606ms|worth: on 12µs, on -0.14%, in 1.0 times |
|98%|8.953ms|8.921ms|worth: on 32µs, on -0.36%, in 1.0 times |
|99%|9.388ms|9.376ms|worth: on 12µs, on -0.13%, in 1.0 times |
|99.999%|11.856ms|11.642ms|worth: on 214µs, on -1.80%, in 1.0 times |
|Requests, count|164883|164690|more: 0.1% , in 1.0 times |
