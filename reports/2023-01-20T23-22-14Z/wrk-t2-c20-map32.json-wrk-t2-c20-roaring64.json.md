### Difference Report
Case1: wrk-t2-c20-map32.json
Case2: wrk-t2-c20-roaring64.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.612ms|398µs|worth: on 3.214ms, on -88.98%, in 0.1 times , -1 order of magnitude|
|90%|7.083ms|791µs|worth: on 6.292ms, on -88.83%, in 0.1 times , -1 order of magnitude|
|95%|8.195ms|908µs|worth: on 7.287ms, on -88.92%, in 0.1 times , -1 order of magnitude|
|97%|8.728ms|978µs|worth: on 7.75ms, on -88.79%, in 0.1 times , -1 order of magnitude|
|98%|9.073ms|1.046ms|worth: on 8.027ms, on -88.47%, in 0.1 times |
|99%|9.534ms|1.261ms|worth: on 8.273ms, on -86.77%, in 0.1 times |
|99.999%|15.321ms|10.364ms|worth: on 4.957ms, on -32.35%, in 0.7 times |
|Requests, count|162471|1454732|less: -88.8% , in 0.1 times |
