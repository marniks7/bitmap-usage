### Difference Report
Case1: wrk-t2-c20-map64.json
Case2: wrk-t2-c20-map32.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.608ms|3.612ms|better: on 4µs, on 0.11%, in 1.0 times |
|90%|7.119ms|7.083ms|worth: on 36µs, on -0.51%, in 1.0 times |
|95%|8.249ms|8.195ms|worth: on 54µs, on -0.65%, in 1.0 times |
|97%|8.792ms|8.728ms|worth: on 64µs, on -0.73%, in 1.0 times |
|98%|9.092ms|9.073ms|worth: on 19µs, on -0.21%, in 1.0 times |
|99%|9.566ms|9.534ms|worth: on 32µs, on -0.33%, in 1.0 times |
|99.999%|13.308ms|15.321ms|better: on 2.013ms, on 15.13%, in 1.2 times |
|Requests, count|161548|162471|less: -0.6% , in 1.0 times |
