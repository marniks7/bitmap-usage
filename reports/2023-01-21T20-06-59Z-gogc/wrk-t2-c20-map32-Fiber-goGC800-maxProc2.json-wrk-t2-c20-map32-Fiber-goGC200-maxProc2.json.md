### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|3.572ms|better: on 38µs, on 1.08%, in 1.0 times |
|90%|7.001ms|7.055ms|better: on 54µs, on 0.77%, in 1.0 times |
|95%|8.092ms|8.162ms|better: on 70µs, on 0.87%, in 1.0 times |
|97%|8.618ms|8.682ms|better: on 64µs, on 0.74%, in 1.0 times |
|98%|8.953ms|9.031ms|better: on 78µs, on 0.87%, in 1.0 times |
|99%|9.388ms|9.464ms|better: on 76µs, on 0.81%, in 1.0 times |
|99.999%|11.856ms|11.692ms|worth: on 164µs, on -1.38%, in 1.0 times |
|Requests, count|164883|163501|more: 0.8% , in 1.0 times |
