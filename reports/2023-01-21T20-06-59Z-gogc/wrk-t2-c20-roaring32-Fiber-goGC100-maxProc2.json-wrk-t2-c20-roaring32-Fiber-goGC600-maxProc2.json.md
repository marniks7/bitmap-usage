### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|267µs|worth: on 21µs, on -7.29%, in 0.9 times |
|90%|676µs|554µs|worth: on 122µs, on -18.05%, in 0.8 times |
|95%|1.182ms|646µs|worth: on 536µs, on -45.35%, in 0.5 times , -1 order of magnitude|
|97%|2.563ms|749µs|worth: on 1.814ms, on -70.78%, in 0.3 times , -1 order of magnitude|
|98%|3.749ms|886µs|worth: on 2.863ms, on -76.37%, in 0.2 times , -1 order of magnitude|
|99%|5.576ms|1.545ms|worth: on 4.031ms, on -72.29%, in 0.3 times |
|99.999%|11.676ms|13.086ms|better: on 1.41ms, on 12.08%, in 1.1 times |
|Requests, count|1884912|2098189|less: -10.2% , in 0.9 times |
