### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.581ms|267µs|worth: on 3.314ms, on -92.54%, in 0.1 times , -1 order of magnitude|
|90%|7.072ms|554µs|worth: on 6.518ms, on -92.17%, in 0.1 times , -1 order of magnitude|
|95%|8.168ms|646µs|worth: on 7.522ms, on -92.09%, in 0.1 times , -1 order of magnitude|
|97%|8.693ms|749µs|worth: on 7.944ms, on -91.38%, in 0.1 times , -1 order of magnitude|
|98%|9.083ms|886µs|worth: on 8.197ms, on -90.25%, in 0.1 times , -1 order of magnitude|
|99%|9.496ms|1.545ms|worth: on 7.951ms, on -83.73%, in 0.2 times |
|99.999%|14.528ms|13.086ms|worth: on 1.442ms, on -9.93%, in 0.9 times |
|Requests, count|163640|2098189|less: -92.2% , in 0.1 times |
