### Difference Report
Case1: wrk-t2-c20-roaring32.json
Case2: wrk-t2-c20-roaring64.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|252µs|398µs|better: on 146µs, on 57.94%, in 1.6 times |
|90%|510µs|791µs|better: on 281µs, on 55.10%, in 1.6 times |
|95%|588µs|908µs|better: on 320µs, on 54.42%, in 1.5 times |
|97%|646µs|978µs|better: on 332µs, on 51.39%, in 1.5 times |
|98%|711µs|1.046ms|better: on 335µs, on 47.12%, in 1.5 times , 1 order of magnitude|
|99%|911µs|1.261ms|better: on 350µs, on 38.42%, in 1.4 times , 1 order of magnitude|
|99.999%|10.241ms|10.364ms|better: on 123µs, on 1.20%, in 1.0 times |
|Requests, count|2244242|1454732|more: 54.3% , in 1.5 times |
