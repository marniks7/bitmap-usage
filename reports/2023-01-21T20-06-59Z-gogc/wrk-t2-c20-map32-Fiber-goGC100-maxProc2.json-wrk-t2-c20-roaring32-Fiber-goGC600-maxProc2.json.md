### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.54ms|267µs|worth: on 3.273ms, on -92.46%, in 0.1 times , -1 order of magnitude|
|90%|7.023ms|554µs|worth: on 6.469ms, on -92.11%, in 0.1 times , -1 order of magnitude|
|95%|8.12ms|646µs|worth: on 7.474ms, on -92.04%, in 0.1 times , -1 order of magnitude|
|97%|8.643ms|749µs|worth: on 7.894ms, on -91.33%, in 0.1 times , -1 order of magnitude|
|98%|9.005ms|886µs|worth: on 8.119ms, on -90.16%, in 0.1 times , -1 order of magnitude|
|99%|9.442ms|1.545ms|worth: on 7.897ms, on -83.64%, in 0.2 times |
|99.999%|18.167ms|13.086ms|worth: on 5.081ms, on -27.97%, in 0.7 times |
|Requests, count|164757|2098189|less: -92.1% , in 0.1 times |
