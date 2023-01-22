### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.559ms|267µs|worth: on 3.292ms, on -92.50%, in 0.1 times , -1 order of magnitude|
|90%|6.981ms|554µs|worth: on 6.427ms, on -92.06%, in 0.1 times , -1 order of magnitude|
|95%|8.082ms|646µs|worth: on 7.436ms, on -92.01%, in 0.1 times , -1 order of magnitude|
|97%|8.606ms|749µs|worth: on 7.857ms, on -91.30%, in 0.1 times , -1 order of magnitude|
|98%|8.921ms|886µs|worth: on 8.035ms, on -90.07%, in 0.1 times , -1 order of magnitude|
|99%|9.376ms|1.545ms|worth: on 7.831ms, on -83.52%, in 0.2 times |
|99.999%|11.642ms|13.086ms|better: on 1.444ms, on 12.40%, in 1.1 times |
|Requests, count|164690|2098189|less: -92.2% , in 0.1 times |
