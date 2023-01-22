### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.572ms|263µs|worth: on 3.309ms, on -92.64%, in 0.1 times , -1 order of magnitude|
|90%|7.055ms|537µs|worth: on 6.518ms, on -92.39%, in 0.1 times , -1 order of magnitude|
|95%|8.162ms|619µs|worth: on 7.543ms, on -92.42%, in 0.1 times , -1 order of magnitude|
|97%|8.682ms|679µs|worth: on 8.003ms, on -92.18%, in 0.1 times , -1 order of magnitude|
|98%|9.031ms|760µs|worth: on 8.271ms, on -91.58%, in 0.1 times , -1 order of magnitude|
|99%|9.464ms|997µs|worth: on 8.467ms, on -89.47%, in 0.1 times , -1 order of magnitude|
|99.999%|11.692ms|10.692ms|worth: on 1ms, on -8.55%, in 0.9 times |
|Requests, count|163501|2152710|less: -92.4% , in 0.1 times |
