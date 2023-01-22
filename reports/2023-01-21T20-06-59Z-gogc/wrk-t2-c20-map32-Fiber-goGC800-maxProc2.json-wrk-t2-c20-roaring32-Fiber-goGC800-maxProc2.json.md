### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|263µs|worth: on 3.271ms, on -92.56%, in 0.1 times , -1 order of magnitude|
|90%|7.001ms|537µs|worth: on 6.464ms, on -92.33%, in 0.1 times , -1 order of magnitude|
|95%|8.092ms|619µs|worth: on 7.473ms, on -92.35%, in 0.1 times , -1 order of magnitude|
|97%|8.618ms|679µs|worth: on 7.939ms, on -92.12%, in 0.1 times , -1 order of magnitude|
|98%|8.953ms|760µs|worth: on 8.193ms, on -91.51%, in 0.1 times , -1 order of magnitude|
|99%|9.388ms|997µs|worth: on 8.391ms, on -89.38%, in 0.1 times , -1 order of magnitude|
|99.999%|11.856ms|10.692ms|worth: on 1.164ms, on -9.82%, in 0.9 times |
|Requests, count|164883|2152710|less: -92.3% , in 0.1 times |
