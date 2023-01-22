### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|3.581ms|better: on 47µs, on 1.33%, in 1.0 times |
|90%|7.001ms|7.072ms|better: on 71µs, on 1.01%, in 1.0 times |
|95%|8.092ms|8.168ms|better: on 76µs, on 0.94%, in 1.0 times |
|97%|8.618ms|8.693ms|better: on 75µs, on 0.87%, in 1.0 times |
|98%|8.953ms|9.083ms|better: on 130µs, on 1.45%, in 1.0 times |
|99%|9.388ms|9.496ms|better: on 108µs, on 1.15%, in 1.0 times |
|99.999%|11.856ms|14.528ms|better: on 2.672ms, on 22.54%, in 1.2 times |
|Requests, count|164883|163640|more: 0.8% , in 1.0 times |
