### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|3.581ms|better: on 3.314ms, on 1241.20%, in 13.4 times , 1 order of magnitude|
|90%|554µs|7.072ms|better: on 6.518ms, on 1176.53%, in 12.8 times , 1 order of magnitude|
|95%|646µs|8.168ms|better: on 7.522ms, on 1164.40%, in 12.6 times , 1 order of magnitude|
|97%|749µs|8.693ms|better: on 7.944ms, on 1060.61%, in 11.6 times , 1 order of magnitude|
|98%|886µs|9.083ms|better: on 8.197ms, on 925.17%, in 10.3 times , 1 order of magnitude|
|99%|1.545ms|9.496ms|better: on 7.951ms, on 514.63%, in 6.1 times |
|99.999%|13.086ms|14.528ms|better: on 1.442ms, on 11.02%, in 1.1 times |
|Requests, count|2098189|163640|more: 1182.2% , in 12.8 times |
