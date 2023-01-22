### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.549ms|3.581ms|better: on 32µs, on 0.90%, in 1.0 times |
|90%|6.985ms|7.072ms|better: on 87µs, on 1.25%, in 1.0 times |
|95%|8.091ms|8.168ms|better: on 77µs, on 0.95%, in 1.0 times |
|97%|8.621ms|8.693ms|better: on 72µs, on 0.84%, in 1.0 times |
|98%|8.93ms|9.083ms|better: on 153µs, on 1.71%, in 1.0 times |
|99%|9.398ms|9.496ms|better: on 98µs, on 1.04%, in 1.0 times |
|99.999%|11.742ms|14.528ms|better: on 2.786ms, on 23.73%, in 1.2 times |
|Requests, count|164298|163640|more: 0.4% , in 1.0 times |
