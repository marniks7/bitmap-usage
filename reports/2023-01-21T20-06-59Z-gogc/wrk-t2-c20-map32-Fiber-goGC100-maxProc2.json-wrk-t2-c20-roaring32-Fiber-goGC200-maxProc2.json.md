### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.54ms|280µs|worth: on 3.26ms, on -92.09%, in 0.1 times , -1 order of magnitude|
|90%|7.023ms|605µs|worth: on 6.418ms, on -91.39%, in 0.1 times , -1 order of magnitude|
|95%|8.12ms|773µs|worth: on 7.347ms, on -90.48%, in 0.1 times , -1 order of magnitude|
|97%|8.643ms|1.159ms|worth: on 7.484ms, on -86.59%, in 0.1 times |
|98%|9.005ms|2.155ms|worth: on 6.85ms, on -76.07%, in 0.2 times |
|99%|9.442ms|4.146ms|worth: on 5.296ms, on -56.09%, in 0.4 times |
|99.999%|18.167ms|11.591ms|worth: on 6.576ms, on -36.20%, in 0.6 times |
|Requests, count|164757|1977373|less: -91.7% , in 0.1 times |
