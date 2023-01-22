### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.559ms|280µs|worth: on 3.279ms, on -92.13%, in 0.1 times , -1 order of magnitude|
|90%|6.981ms|605µs|worth: on 6.376ms, on -91.33%, in 0.1 times , -1 order of magnitude|
|95%|8.082ms|773µs|worth: on 7.309ms, on -90.44%, in 0.1 times , -1 order of magnitude|
|97%|8.606ms|1.159ms|worth: on 7.447ms, on -86.53%, in 0.1 times |
|98%|8.921ms|2.155ms|worth: on 6.766ms, on -75.84%, in 0.2 times |
|99%|9.376ms|4.146ms|worth: on 5.23ms, on -55.78%, in 0.4 times |
|99.999%|11.642ms|11.591ms|worth: on 51µs, on -0.44%, in 1.0 times |
|Requests, count|164690|1977373|less: -91.7% , in 0.1 times |
