### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.534ms|288µs|worth: on 3.246ms, on -91.85%, in 0.1 times , -1 order of magnitude|
|90%|7.001ms|676µs|worth: on 6.325ms, on -90.34%, in 0.1 times , -1 order of magnitude|
|95%|8.092ms|1.182ms|worth: on 6.91ms, on -85.39%, in 0.1 times |
|97%|8.618ms|2.563ms|worth: on 6.055ms, on -70.26%, in 0.3 times |
|98%|8.953ms|3.749ms|worth: on 5.204ms, on -58.13%, in 0.4 times |
|99%|9.388ms|5.576ms|worth: on 3.812ms, on -40.61%, in 0.6 times |
|99.999%|11.856ms|11.676ms|worth: on 180µs, on -1.52%, in 1.0 times |
|Requests, count|164883|1884912|less: -91.3% , in 0.1 times |
