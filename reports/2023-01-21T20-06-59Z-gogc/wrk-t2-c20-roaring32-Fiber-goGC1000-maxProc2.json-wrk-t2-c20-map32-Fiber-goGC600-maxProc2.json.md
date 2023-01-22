### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|253µs|3.559ms|better: on 3.306ms, on 1306.72%, in 14.1 times , 1 order of magnitude|
|90%|509µs|6.981ms|better: on 6.472ms, on 1271.51%, in 13.7 times , 1 order of magnitude|
|95%|585µs|8.082ms|better: on 7.497ms, on 1281.54%, in 13.8 times , 1 order of magnitude|
|97%|637µs|8.606ms|better: on 7.969ms, on 1251.02%, in 13.5 times , 1 order of magnitude|
|98%|692µs|8.921ms|better: on 8.229ms, on 1189.16%, in 12.9 times , 1 order of magnitude|
|99%|863µs|9.376ms|better: on 8.513ms, on 986.44%, in 10.9 times , 1 order of magnitude|
|99.999%|9.59ms|11.642ms|better: on 2.052ms, on 21.40%, in 1.2 times , 1 order of magnitude|
|Requests, count|2250457|164690|more: 1266.5% , in 13.7 times |
