### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.657ms|382µs|worth: on 3.275ms, on -89.55%, in 0.1 times , -1 order of magnitude|
|90%|7.184ms|760µs|worth: on 6.424ms, on -89.42%, in 0.1 times , -1 order of magnitude|
|95%|8.299ms|885µs|worth: on 7.414ms, on -89.34%, in 0.1 times , -1 order of magnitude|
|97%|8.886ms|969µs|worth: on 7.917ms, on -89.10%, in 0.1 times , -1 order of magnitude|
|98%|9.231ms|1.032ms|worth: on 8.199ms, on -88.82%, in 0.1 times |
|99%|9.682ms|1.163ms|worth: on 8.519ms, on -87.99%, in 0.1 times |
|99.999%|45.273ms|44.225ms|worth: on 1.048ms, on -2.31%, in 1.0 times |
|Requests, count|160835|1457261|less: -89.0% , in 0.1 times |
