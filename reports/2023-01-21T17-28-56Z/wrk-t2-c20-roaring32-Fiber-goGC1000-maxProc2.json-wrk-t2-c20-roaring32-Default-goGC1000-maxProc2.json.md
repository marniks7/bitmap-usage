### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Default-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|254µs|374µs|better: on 120µs, on 47.24%, in 1.5 times |
|90%|516µs|761µs|better: on 245µs, on 47.48%, in 1.5 times |
|95%|597µs|880µs|better: on 283µs, on 47.40%, in 1.5 times |
|97%|661µs|980µs|better: on 319µs, on 48.26%, in 1.5 times |
|98%|736µs|1.08ms|better: on 344µs, on 46.74%, in 1.5 times , 1 order of magnitude|
|99%|930µs|1.293ms|better: on 363µs, on 39.03%, in 1.4 times , 1 order of magnitude|
|99.999%|10.253ms|11.04ms|better: on 787µs, on 7.68%, in 1.1 times |
|Requests, count|2224434|1521742|more: 46.2% , in 1.5 times |
