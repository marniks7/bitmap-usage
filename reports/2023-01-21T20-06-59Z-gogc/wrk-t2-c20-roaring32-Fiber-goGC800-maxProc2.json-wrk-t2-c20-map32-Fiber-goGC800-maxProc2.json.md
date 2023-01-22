### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|3.534ms|better: on 3.271ms, on 1243.73%, in 13.4 times , 1 order of magnitude|
|90%|537µs|7.001ms|better: on 6.464ms, on 1203.72%, in 13.0 times , 1 order of magnitude|
|95%|619µs|8.092ms|better: on 7.473ms, on 1207.27%, in 13.1 times , 1 order of magnitude|
|97%|679µs|8.618ms|better: on 7.939ms, on 1169.22%, in 12.7 times , 1 order of magnitude|
|98%|760µs|8.953ms|better: on 8.193ms, on 1078.03%, in 11.8 times , 1 order of magnitude|
|99%|997µs|9.388ms|better: on 8.391ms, on 841.62%, in 9.4 times , 1 order of magnitude|
|99.999%|10.692ms|11.856ms|better: on 1.164ms, on 10.89%, in 1.1 times |
|Requests, count|2152710|164883|more: 1205.6% , in 13.1 times |
