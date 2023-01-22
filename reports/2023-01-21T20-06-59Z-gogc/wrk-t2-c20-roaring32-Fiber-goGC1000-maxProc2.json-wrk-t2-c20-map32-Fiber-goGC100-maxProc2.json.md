### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|3.54ms|better: on 3.287ms, on 1299.21%, in 14.0 times , 1 order of magnitude|
|90%|509µs|7.023ms|better: on 6.514ms, on 1279.76%, in 13.8 times , 1 order of magnitude|
|95%|585µs|8.12ms|better: on 7.535ms, on 1288.03%, in 13.9 times , 1 order of magnitude|
|97%|637µs|8.643ms|better: on 8.006ms, on 1256.83%, in 13.6 times , 1 order of magnitude|
|98%|692µs|9.005ms|better: on 8.313ms, on 1201.30%, in 13.0 times , 1 order of magnitude|
|99%|863µs|9.442ms|better: on 8.579ms, on 994.09%, in 10.9 times , 1 order of magnitude|
|99.999%|9.59ms|18.167ms|better: on 8.577ms, on 89.44%, in 1.9 times , 1 order of magnitude|
|Requests, count|2250457|164757|more: 1265.9% , in 13.7 times |
