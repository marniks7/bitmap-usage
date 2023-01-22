### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|3.54ms|better: on 3.273ms, on 1225.84%, in 13.3 times , 1 order of magnitude|
|90%|554µs|7.023ms|better: on 6.469ms, on 1167.69%, in 12.7 times , 1 order of magnitude|
|95%|646µs|8.12ms|better: on 7.474ms, on 1156.97%, in 12.6 times , 1 order of magnitude|
|97%|749µs|8.643ms|better: on 7.894ms, on 1053.94%, in 11.5 times , 1 order of magnitude|
|98%|886µs|9.005ms|better: on 8.119ms, on 916.37%, in 10.2 times , 1 order of magnitude|
|99%|1.545ms|9.442ms|better: on 7.897ms, on 511.13%, in 6.1 times |
|99.999%|13.086ms|18.167ms|better: on 5.081ms, on 38.83%, in 1.4 times |
|Requests, count|2098189|164757|more: 1173.5% , in 12.7 times |
