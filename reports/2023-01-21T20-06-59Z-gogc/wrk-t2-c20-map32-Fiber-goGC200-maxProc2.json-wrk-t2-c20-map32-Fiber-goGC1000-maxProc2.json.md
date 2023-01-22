### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.572ms|3.581ms|better: on 9µs, on 0.25%, in 1.0 times |
|90%|7.055ms|7.072ms|better: on 17µs, on 0.24%, in 1.0 times |
|95%|8.162ms|8.168ms|better: on 6µs, on 0.07%, in 1.0 times |
|97%|8.682ms|8.693ms|better: on 11µs, on 0.13%, in 1.0 times |
|98%|9.031ms|9.083ms|better: on 52µs, on 0.58%, in 1.0 times |
|99%|9.464ms|9.496ms|better: on 32µs, on 0.34%, in 1.0 times |
|99.999%|11.692ms|14.528ms|better: on 2.836ms, on 24.26%, in 1.2 times |
|Requests, count|163501|163640|less: -0.1% , in 1.0 times |
