### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|288µs|better: on 35µs, on 13.83%, in 1.1 times |
|90%|509µs|676µs|better: on 167µs, on 32.81%, in 1.3 times |
|95%|585µs|1.182ms|better: on 597µs, on 102.05%, in 2.0 times , 1 order of magnitude|
|97%|637µs|2.563ms|better: on 1.926ms, on 302.35%, in 4.0 times , 1 order of magnitude|
|98%|692µs|3.749ms|better: on 3.057ms, on 441.76%, in 5.4 times , 1 order of magnitude|
|99%|863µs|5.576ms|better: on 4.713ms, on 546.12%, in 6.5 times , 1 order of magnitude|
|99.999%|9.59ms|11.676ms|better: on 2.086ms, on 21.75%, in 1.2 times , 1 order of magnitude|
|Requests, count|2250457|1884912|more: 19.4% , in 1.2 times |
