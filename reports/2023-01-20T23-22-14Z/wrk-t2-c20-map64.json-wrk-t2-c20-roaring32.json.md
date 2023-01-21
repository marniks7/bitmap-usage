### Difference Report
Case1: wrk-t2-c20-map64.json
Case2: wrk-t2-c20-roaring32.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.608ms|252µs|worth: on 3.356ms, on -93.02%, in 0.1 times , -1 order of magnitude|
|90%|7.119ms|510µs|worth: on 6.609ms, on -92.84%, in 0.1 times , -1 order of magnitude|
|95%|8.249ms|588µs|worth: on 7.661ms, on -92.87%, in 0.1 times , -1 order of magnitude|
|97%|8.792ms|646µs|worth: on 8.146ms, on -92.65%, in 0.1 times , -1 order of magnitude|
|98%|9.092ms|711µs|worth: on 8.381ms, on -92.18%, in 0.1 times , -1 order of magnitude|
|99%|9.566ms|911µs|worth: on 8.655ms, on -90.48%, in 0.1 times , -1 order of magnitude|
|99.999%|13.308ms|10.241ms|worth: on 3.067ms, on -23.05%, in 0.8 times |
|Requests, count|161548|2244242|less: -92.8% , in 0.1 times |
