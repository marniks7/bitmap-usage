### Difference Report
Case1: wrk-t2-c20-roaring64.json
Case2: wrk-t2-c20-roaring32.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|398µs|252µs|worth: on 146µs, on -36.68%, in 0.6 times |
|90%|791µs|510µs|worth: on 281µs, on -35.52%, in 0.6 times |
|95%|908µs|588µs|worth: on 320µs, on -35.24%, in 0.6 times |
|97%|978µs|646µs|worth: on 332µs, on -33.95%, in 0.7 times |
|98%|1.046ms|711µs|worth: on 335µs, on -32.03%, in 0.7 times , -1 order of magnitude|
|99%|1.261ms|911µs|worth: on 350µs, on -27.76%, in 0.7 times , -1 order of magnitude|
|99.999%|10.364ms|10.241ms|worth: on 123µs, on -1.19%, in 1.0 times |
|Requests, count|1454732|2244242|less: -35.2% , in 0.6 times |
