### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.549ms|3.559ms|better: on 10µs, on 0.28%, in 1.0 times |
|90%|6.985ms|6.981ms|worth: on 4µs, on -0.06%, in 1.0 times |
|95%|8.091ms|8.082ms|worth: on 9µs, on -0.11%, in 1.0 times |
|97%|8.621ms|8.606ms|worth: on 15µs, on -0.17%, in 1.0 times |
|98%|8.93ms|8.921ms|worth: on 9µs, on -0.10%, in 1.0 times |
|99%|9.398ms|9.376ms|worth: on 22µs, on -0.23%, in 1.0 times |
|99.999%|11.742ms|11.642ms|worth: on 100µs, on -0.85%, in 1.0 times |
|Requests, count|164298|164690|less: -0.2% , in 1.0 times |
