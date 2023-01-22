### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|3.549ms|better: on 15µs, on 0.42%, in 1.0 times |
|90%|7.001ms|6.985ms|worth: on 16µs, on -0.23%, in 1.0 times |
|95%|8.092ms|8.091ms|worth: on 1µs, on -0.01%, in 1.0 times |
|97%|8.618ms|8.621ms|better: on 3µs, on 0.03%, in 1.0 times |
|98%|8.953ms|8.93ms|worth: on 23µs, on -0.26%, in 1.0 times |
|99%|9.388ms|9.398ms|better: on 10µs, on 0.11%, in 1.0 times |
|99.999%|11.856ms|11.742ms|worth: on 114µs, on -0.96%, in 1.0 times |
|Requests, count|164883|164298|more: 0.4% , in 1.0 times |
