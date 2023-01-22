### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.559ms|263µs|worth: on 3.296ms, on -92.61%, in 0.1 times , -1 order of magnitude|
|90%|6.981ms|537µs|worth: on 6.444ms, on -92.31%, in 0.1 times , -1 order of magnitude|
|95%|8.082ms|619µs|worth: on 7.463ms, on -92.34%, in 0.1 times , -1 order of magnitude|
|97%|8.606ms|679µs|worth: on 7.927ms, on -92.11%, in 0.1 times , -1 order of magnitude|
|98%|8.921ms|760µs|worth: on 8.161ms, on -91.48%, in 0.1 times , -1 order of magnitude|
|99%|9.376ms|997µs|worth: on 8.379ms, on -89.37%, in 0.1 times , -1 order of magnitude|
|99.999%|11.642ms|10.692ms|worth: on 950µs, on -8.16%, in 0.9 times |
|Requests, count|164690|2152710|less: -92.3% , in 0.1 times |
