### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|288µs|better: on 15µs, on 5.49%, in 1.1 times |
|90%|567µs|676µs|better: on 109µs, on 19.22%, in 1.2 times |
|95%|664µs|1.182ms|better: on 518µs, on 78.01%, in 1.8 times , 1 order of magnitude|
|97%|802µs|2.563ms|better: on 1.761ms, on 219.58%, in 3.2 times , 1 order of magnitude|
|98%|1.05ms|3.749ms|better: on 2.699ms, on 257.05%, in 3.6 times |
|99%|2.817ms|5.576ms|better: on 2.759ms, on 97.94%, in 2.0 times |
|99.999%|11.435ms|11.676ms|better: on 241µs, on 2.11%, in 1.0 times |
|Requests, count|2063784|1884912|more: 9.5% , in 1.1 times |
