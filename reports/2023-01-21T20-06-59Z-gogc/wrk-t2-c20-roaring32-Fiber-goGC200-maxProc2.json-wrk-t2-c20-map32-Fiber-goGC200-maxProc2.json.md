### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|280µs|3.572ms|better: on 3.292ms, on 1175.71%, in 12.8 times , 1 order of magnitude|
|90%|605µs|7.055ms|better: on 6.45ms, on 1066.12%, in 11.7 times , 1 order of magnitude|
|95%|773µs|8.162ms|better: on 7.389ms, on 955.89%, in 10.6 times , 1 order of magnitude|
|97%|1.159ms|8.682ms|better: on 7.523ms, on 649.09%, in 7.5 times |
|98%|2.155ms|9.031ms|better: on 6.876ms, on 319.07%, in 4.2 times |
|99%|4.146ms|9.464ms|better: on 5.318ms, on 128.27%, in 2.3 times |
|99.999%|11.591ms|11.692ms|better: on 101µs, on 0.87%, in 1.0 times |
|Requests, count|1977373|163501|more: 1109.4% , in 12.1 times |
