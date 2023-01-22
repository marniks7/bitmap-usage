### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.549ms|3.534ms|worth: on 15µs, on -0.42%, in 1.0 times |
|90%|6.985ms|7.001ms|better: on 16µs, on 0.23%, in 1.0 times |
|95%|8.091ms|8.092ms|better: on 1µs, on 0.01%, in 1.0 times |
|97%|8.621ms|8.618ms|worth: on 3µs, on -0.03%, in 1.0 times |
|98%|8.93ms|8.953ms|better: on 23µs, on 0.26%, in 1.0 times |
|99%|9.398ms|9.388ms|worth: on 10µs, on -0.11%, in 1.0 times |
|99.999%|11.742ms|11.856ms|better: on 114µs, on 0.97%, in 1.0 times |
|Requests, count|164298|164883|less: -0.4% , in 1.0 times |
