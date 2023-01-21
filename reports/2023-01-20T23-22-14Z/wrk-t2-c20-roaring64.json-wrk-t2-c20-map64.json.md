### Difference Report
Case1: wrk-t2-c20-roaring64.json
Case2: wrk-t2-c20-map64.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|398µs|3.608ms|better: on 3.21ms, on 806.53%, in 9.1 times , 1 order of magnitude|
|90%|791µs|7.119ms|better: on 6.328ms, on 800.00%, in 9.0 times , 1 order of magnitude|
|95%|908µs|8.249ms|better: on 7.341ms, on 808.48%, in 9.1 times , 1 order of magnitude|
|97%|978µs|8.792ms|better: on 7.814ms, on 798.98%, in 9.0 times , 1 order of magnitude|
|98%|1.046ms|9.092ms|better: on 8.046ms, on 769.22%, in 8.7 times |
|99%|1.261ms|9.566ms|better: on 8.305ms, on 658.60%, in 7.6 times |
|99.999%|10.364ms|13.308ms|better: on 2.944ms, on 28.41%, in 1.3 times |
|Requests, count|1454732|161548|more: 800.5% , in 9.0 times |
