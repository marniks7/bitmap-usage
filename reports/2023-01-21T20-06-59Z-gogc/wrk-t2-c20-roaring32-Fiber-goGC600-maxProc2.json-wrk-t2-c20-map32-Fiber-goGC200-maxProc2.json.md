### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|3.572ms|better: on 3.305ms, on 1237.83%, in 13.4 times , 1 order of magnitude|
|90%|554µs|7.055ms|better: on 6.501ms, on 1173.47%, in 12.7 times , 1 order of magnitude|
|95%|646µs|8.162ms|better: on 7.516ms, on 1163.47%, in 12.6 times , 1 order of magnitude|
|97%|749µs|8.682ms|better: on 7.933ms, on 1059.15%, in 11.6 times , 1 order of magnitude|
|98%|886µs|9.031ms|better: on 8.145ms, on 919.30%, in 10.2 times , 1 order of magnitude|
|99%|1.545ms|9.464ms|better: on 7.919ms, on 512.56%, in 6.1 times |
|99.999%|13.086ms|11.692ms|worth: on 1.394ms, on -10.65%, in 0.9 times |
|Requests, count|2098189|163501|more: 1183.3% , in 12.8 times |
