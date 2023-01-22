### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|3.581ms|better: on 3.318ms, on 1261.60%, in 13.6 times , 1 order of magnitude|
|90%|537µs|7.072ms|better: on 6.535ms, on 1216.95%, in 13.2 times , 1 order of magnitude|
|95%|619µs|8.168ms|better: on 7.549ms, on 1219.55%, in 13.2 times , 1 order of magnitude|
|97%|679µs|8.693ms|better: on 8.014ms, on 1180.27%, in 12.8 times , 1 order of magnitude|
|98%|760µs|9.083ms|better: on 8.323ms, on 1095.13%, in 12.0 times , 1 order of magnitude|
|99%|997µs|9.496ms|better: on 8.499ms, on 852.46%, in 9.5 times , 1 order of magnitude|
|99.999%|10.692ms|14.528ms|better: on 3.836ms, on 35.88%, in 1.4 times |
|Requests, count|2152710|163640|more: 1215.5% , in 13.2 times |
