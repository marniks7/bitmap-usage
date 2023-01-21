### Difference Report
Case1: wrk-t2-c20-map64.json
Case2: wrk-t2-c20-roaring64.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.608ms|398µs|worth: on 3.21ms, on -88.97%, in 0.1 times , -1 order of magnitude|
|90%|7.119ms|791µs|worth: on 6.328ms, on -88.89%, in 0.1 times , -1 order of magnitude|
|95%|8.249ms|908µs|worth: on 7.341ms, on -88.99%, in 0.1 times , -1 order of magnitude|
|97%|8.792ms|978µs|worth: on 7.814ms, on -88.88%, in 0.1 times , -1 order of magnitude|
|98%|9.092ms|1.046ms|worth: on 8.046ms, on -88.50%, in 0.1 times |
|99%|9.566ms|1.261ms|worth: on 8.305ms, on -86.82%, in 0.1 times |
|99.999%|13.308ms|10.364ms|worth: on 2.944ms, on -22.12%, in 0.8 times |
|Requests, count|161548|1454732|less: -88.9% , in 0.1 times |
