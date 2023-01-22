### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.581ms|280µs|worth: on 3.301ms, on -92.18%, in 0.1 times , -1 order of magnitude|
|90%|7.072ms|605µs|worth: on 6.467ms, on -91.45%, in 0.1 times , -1 order of magnitude|
|95%|8.168ms|773µs|worth: on 7.395ms, on -90.54%, in 0.1 times , -1 order of magnitude|
|97%|8.693ms|1.159ms|worth: on 7.534ms, on -86.67%, in 0.1 times |
|98%|9.083ms|2.155ms|worth: on 6.928ms, on -76.27%, in 0.2 times |
|99%|9.496ms|4.146ms|worth: on 5.35ms, on -56.34%, in 0.4 times |
|99.999%|14.528ms|11.591ms|worth: on 2.937ms, on -20.22%, in 0.8 times |
|Requests, count|163640|1977373|less: -91.7% , in 0.1 times |
