### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.559ms|3.581ms|better: on 22µs, on 0.62%, in 1.0 times |
|90%|6.981ms|7.072ms|better: on 91µs, on 1.30%, in 1.0 times |
|95%|8.082ms|8.168ms|better: on 86µs, on 1.06%, in 1.0 times |
|97%|8.606ms|8.693ms|better: on 87µs, on 1.01%, in 1.0 times |
|98%|8.921ms|9.083ms|better: on 162µs, on 1.82%, in 1.0 times |
|99%|9.376ms|9.496ms|better: on 120µs, on 1.28%, in 1.0 times |
|99.999%|11.642ms|14.528ms|better: on 2.886ms, on 24.79%, in 1.2 times |
|Requests, count|164690|163640|more: 0.6% , in 1.0 times |
