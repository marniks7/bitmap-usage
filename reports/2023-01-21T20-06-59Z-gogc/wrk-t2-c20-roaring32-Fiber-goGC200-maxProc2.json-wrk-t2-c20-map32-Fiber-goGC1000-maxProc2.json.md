### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|3.581ms|better: on 3.301ms, on 1178.93%, in 12.8 times , 1 order of magnitude|
|90%|605µs|7.072ms|better: on 6.467ms, on 1068.93%, in 11.7 times , 1 order of magnitude|
|95%|773µs|8.168ms|better: on 7.395ms, on 956.66%, in 10.6 times , 1 order of magnitude|
|97%|1.159ms|8.693ms|better: on 7.534ms, on 650.04%, in 7.5 times |
|98%|2.155ms|9.083ms|better: on 6.928ms, on 321.48%, in 4.2 times |
|99%|4.146ms|9.496ms|better: on 5.35ms, on 129.04%, in 2.3 times |
|99.999%|11.591ms|14.528ms|better: on 2.937ms, on 25.34%, in 1.3 times |
|Requests, count|1977373|163640|more: 1108.4% , in 12.1 times |
