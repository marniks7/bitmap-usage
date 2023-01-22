### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.549ms|263µs|worth: on 3.286ms, on -92.59%, in 0.1 times , -1 order of magnitude|
|90%|6.985ms|537µs|worth: on 6.448ms, on -92.31%, in 0.1 times , -1 order of magnitude|
|95%|8.091ms|619µs|worth: on 7.472ms, on -92.35%, in 0.1 times , -1 order of magnitude|
|97%|8.621ms|679µs|worth: on 7.942ms, on -92.12%, in 0.1 times , -1 order of magnitude|
|98%|8.93ms|760µs|worth: on 8.17ms, on -91.49%, in 0.1 times , -1 order of magnitude|
|99%|9.398ms|997µs|worth: on 8.401ms, on -89.39%, in 0.1 times , -1 order of magnitude|
|99.999%|11.742ms|10.692ms|worth: on 1.05ms, on -8.94%, in 0.9 times |
|Requests, count|164298|2152710|less: -92.4% , in 0.1 times |
