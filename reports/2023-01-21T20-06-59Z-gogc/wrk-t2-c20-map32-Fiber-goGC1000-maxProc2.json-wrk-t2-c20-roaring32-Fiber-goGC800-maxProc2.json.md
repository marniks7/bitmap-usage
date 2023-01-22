### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.581ms|263µs|worth: on 3.318ms, on -92.66%, in 0.1 times , -1 order of magnitude|
|90%|7.072ms|537µs|worth: on 6.535ms, on -92.41%, in 0.1 times , -1 order of magnitude|
|95%|8.168ms|619µs|worth: on 7.549ms, on -92.42%, in 0.1 times , -1 order of magnitude|
|97%|8.693ms|679µs|worth: on 8.014ms, on -92.19%, in 0.1 times , -1 order of magnitude|
|98%|9.083ms|760µs|worth: on 8.323ms, on -91.63%, in 0.1 times , -1 order of magnitude|
|99%|9.496ms|997µs|worth: on 8.499ms, on -89.50%, in 0.1 times , -1 order of magnitude|
|99.999%|14.528ms|10.692ms|worth: on 3.836ms, on -26.40%, in 0.7 times |
|Requests, count|163640|2152710|less: -92.4% , in 0.1 times |
