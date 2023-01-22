### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|267µs|288µs|better: on 21µs, on 7.87%, in 1.1 times |
|90%|554µs|676µs|better: on 122µs, on 22.02%, in 1.2 times |
|95%|646µs|1.182ms|better: on 536µs, on 82.97%, in 1.8 times , 1 order of magnitude|
|97%|749µs|2.563ms|better: on 1.814ms, on 242.19%, in 3.4 times , 1 order of magnitude|
|98%|886µs|3.749ms|better: on 2.863ms, on 323.14%, in 4.2 times , 1 order of magnitude|
|99%|1.545ms|5.576ms|better: on 4.031ms, on 260.91%, in 3.6 times |
|99.999%|13.086ms|11.676ms|worth: on 1.41ms, on -10.77%, in 0.9 times |
|Requests, count|2098189|1884912|more: 11.3% , in 1.1 times |
