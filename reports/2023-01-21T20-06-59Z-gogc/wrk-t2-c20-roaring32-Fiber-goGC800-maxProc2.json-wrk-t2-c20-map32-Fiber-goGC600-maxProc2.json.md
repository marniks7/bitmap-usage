### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|3.559ms|better: on 3.296ms, on 1253.23%, in 13.5 times , 1 order of magnitude|
|90%|537µs|6.981ms|better: on 6.444ms, on 1200.00%, in 13.0 times , 1 order of magnitude|
|95%|619µs|8.082ms|better: on 7.463ms, on 1205.65%, in 13.1 times , 1 order of magnitude|
|97%|679µs|8.606ms|better: on 7.927ms, on 1167.45%, in 12.7 times , 1 order of magnitude|
|98%|760µs|8.921ms|better: on 8.161ms, on 1073.82%, in 11.7 times , 1 order of magnitude|
|99%|997µs|9.376ms|better: on 8.379ms, on 840.42%, in 9.4 times , 1 order of magnitude|
|99.999%|10.692ms|11.642ms|better: on 950µs, on 8.89%, in 1.1 times |
|Requests, count|2152710|164690|more: 1207.1% , in 13.1 times |
