### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|382µs|3.657ms|better: on 3.275ms, on 857.33%, in 9.6 times , 1 order of magnitude|
|90%|760µs|7.184ms|better: on 6.424ms, on 845.26%, in 9.5 times , 1 order of magnitude|
|95%|885µs|8.299ms|better: on 7.414ms, on 837.74%, in 9.4 times , 1 order of magnitude|
|97%|969µs|8.886ms|better: on 7.917ms, on 817.03%, in 9.2 times , 1 order of magnitude|
|98%|1.032ms|9.231ms|better: on 8.199ms, on 794.48%, in 8.9 times |
|99%|1.163ms|9.682ms|better: on 8.519ms, on 732.50%, in 8.3 times |
|99.999%|44.225ms|45.273ms|better: on 1.048ms, on 2.37%, in 1.0 times |
|Requests, count|1457261|160835|more: 806.1% , in 9.1 times |
