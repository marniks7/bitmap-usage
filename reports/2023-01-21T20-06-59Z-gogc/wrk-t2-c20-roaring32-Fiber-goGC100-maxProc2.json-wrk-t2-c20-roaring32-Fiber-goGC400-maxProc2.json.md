### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|273µs|worth: on 15µs, on -5.21%, in 0.9 times |
|90%|676µs|567µs|worth: on 109µs, on -16.12%, in 0.8 times |
|95%|1.182ms|664µs|worth: on 518µs, on -43.82%, in 0.6 times , -1 order of magnitude|
|97%|2.563ms|802µs|worth: on 1.761ms, on -68.71%, in 0.3 times , -1 order of magnitude|
|98%|3.749ms|1.05ms|worth: on 2.699ms, on -71.99%, in 0.3 times |
|99%|5.576ms|2.817ms|worth: on 2.759ms, on -49.48%, in 0.5 times |
|99.999%|11.676ms|11.435ms|worth: on 241µs, on -2.06%, in 1.0 times |
|Requests, count|1884912|2063784|less: -8.7% , in 0.9 times |
