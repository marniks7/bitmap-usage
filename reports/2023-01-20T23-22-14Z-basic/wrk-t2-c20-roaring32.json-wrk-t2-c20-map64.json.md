### Difference Report
Case1: wrk-t2-c20-roaring32.json
Case2: wrk-t2-c20-map64.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|252µs|3.608ms|better: on 3.356ms, on 1331.75%, in 14.3 times , 1 order of magnitude|
|90%|510µs|7.119ms|better: on 6.609ms, on 1295.88%, in 14.0 times , 1 order of magnitude|
|95%|588µs|8.249ms|better: on 7.661ms, on 1302.89%, in 14.0 times , 1 order of magnitude|
|97%|646µs|8.792ms|better: on 8.146ms, on 1260.99%, in 13.6 times , 1 order of magnitude|
|98%|711µs|9.092ms|better: on 8.381ms, on 1178.76%, in 12.8 times , 1 order of magnitude|
|99%|911µs|9.566ms|better: on 8.655ms, on 950.05%, in 10.5 times , 1 order of magnitude|
|99.999%|10.241ms|13.308ms|better: on 3.067ms, on 29.95%, in 1.3 times |
|Requests, count|2244242|161548|more: 1289.2% , in 13.9 times |
