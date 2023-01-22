### Difference Report
Case1: wrk-t2-c20-map32.json
Case2: wrk-t2-c20-roaring32.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.612ms|252µs|worth: on 3.36ms, on -93.02%, in 0.1 times , -1 order of magnitude|
|90%|7.083ms|510µs|worth: on 6.573ms, on -92.80%, in 0.1 times , -1 order of magnitude|
|95%|8.195ms|588µs|worth: on 7.607ms, on -92.82%, in 0.1 times , -1 order of magnitude|
|97%|8.728ms|646µs|worth: on 8.082ms, on -92.60%, in 0.1 times , -1 order of magnitude|
|98%|9.073ms|711µs|worth: on 8.362ms, on -92.16%, in 0.1 times , -1 order of magnitude|
|99%|9.534ms|911µs|worth: on 8.623ms, on -90.44%, in 0.1 times , -1 order of magnitude|
|99.999%|15.321ms|10.241ms|worth: on 5.08ms, on -33.16%, in 0.7 times |
|Requests, count|162471|2244242|less: -92.8% , in 0.1 times |
