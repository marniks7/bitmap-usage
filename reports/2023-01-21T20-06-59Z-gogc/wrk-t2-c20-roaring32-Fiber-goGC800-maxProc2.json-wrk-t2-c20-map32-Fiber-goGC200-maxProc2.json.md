### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|3.572ms|better: on 3.309ms, on 1258.17%, in 13.6 times , 1 order of magnitude|
|90%|537µs|7.055ms|better: on 6.518ms, on 1213.78%, in 13.1 times , 1 order of magnitude|
|95%|619µs|8.162ms|better: on 7.543ms, on 1218.58%, in 13.2 times , 1 order of magnitude|
|97%|679µs|8.682ms|better: on 8.003ms, on 1178.65%, in 12.8 times , 1 order of magnitude|
|98%|760µs|9.031ms|better: on 8.271ms, on 1088.29%, in 11.9 times , 1 order of magnitude|
|99%|997µs|9.464ms|better: on 8.467ms, on 849.25%, in 9.5 times , 1 order of magnitude|
|99.999%|10.692ms|11.692ms|better: on 1ms, on 9.35%, in 1.1 times |
|Requests, count|2152710|163501|more: 1216.6% , in 13.2 times |
