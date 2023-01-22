### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|3.549ms|better: on 3.286ms, on 1249.43%, in 13.5 times , 1 order of magnitude|
|90%|537µs|6.985ms|better: on 6.448ms, on 1200.74%, in 13.0 times , 1 order of magnitude|
|95%|619µs|8.091ms|better: on 7.472ms, on 1207.11%, in 13.1 times , 1 order of magnitude|
|97%|679µs|8.621ms|better: on 7.942ms, on 1169.66%, in 12.7 times , 1 order of magnitude|
|98%|760µs|8.93ms|better: on 8.17ms, on 1075.00%, in 11.8 times , 1 order of magnitude|
|99%|997µs|9.398ms|better: on 8.401ms, on 842.63%, in 9.4 times , 1 order of magnitude|
|99.999%|10.692ms|11.742ms|better: on 1.05ms, on 9.82%, in 1.1 times |
|Requests, count|2152710|164298|more: 1210.2% , in 13.1 times |
