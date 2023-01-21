### Difference Report
Case1: wrk-t2-c20-roaring64.json
Case2: wrk-t2-c20-map32.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|398µs|3.612ms|better: on 3.214ms, on 807.54%, in 9.1 times , 1 order of magnitude|
|90%|791µs|7.083ms|better: on 6.292ms, on 795.45%, in 9.0 times , 1 order of magnitude|
|95%|908µs|8.195ms|better: on 7.287ms, on 802.53%, in 9.0 times , 1 order of magnitude|
|97%|978µs|8.728ms|better: on 7.75ms, on 792.43%, in 8.9 times , 1 order of magnitude|
|98%|1.046ms|9.073ms|better: on 8.027ms, on 767.40%, in 8.7 times |
|99%|1.261ms|9.534ms|better: on 8.273ms, on 656.07%, in 7.6 times |
|99.999%|10.364ms|15.321ms|better: on 4.957ms, on 47.83%, in 1.5 times |
|Requests, count|1454732|162471|more: 795.4% , in 9.0 times |
