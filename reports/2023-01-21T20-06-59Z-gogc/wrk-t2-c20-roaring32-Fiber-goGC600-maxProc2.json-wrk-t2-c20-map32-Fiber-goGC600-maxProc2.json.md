### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|3.559ms|better: on 3.292ms, on 1232.96%, in 13.3 times , 1 order of magnitude|
|90%|554µs|6.981ms|better: on 6.427ms, on 1160.11%, in 12.6 times , 1 order of magnitude|
|95%|646µs|8.082ms|better: on 7.436ms, on 1151.08%, in 12.5 times , 1 order of magnitude|
|97%|749µs|8.606ms|better: on 7.857ms, on 1049.00%, in 11.5 times , 1 order of magnitude|
|98%|886µs|8.921ms|better: on 8.035ms, on 906.88%, in 10.1 times , 1 order of magnitude|
|99%|1.545ms|9.376ms|better: on 7.831ms, on 506.86%, in 6.1 times |
|99.999%|13.086ms|11.642ms|worth: on 1.444ms, on -11.03%, in 0.9 times |
|Requests, count|2098189|164690|more: 1174.0% , in 12.7 times |
