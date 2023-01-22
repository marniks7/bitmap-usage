### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|3.572ms|better: on 3.299ms, on 1208.42%, in 13.1 times , 1 order of magnitude|
|90%|567µs|7.055ms|better: on 6.488ms, on 1144.27%, in 12.4 times , 1 order of magnitude|
|95%|664µs|8.162ms|better: on 7.498ms, on 1129.22%, in 12.3 times , 1 order of magnitude|
|97%|802µs|8.682ms|better: on 7.88ms, on 982.54%, in 10.8 times , 1 order of magnitude|
|98%|1.05ms|9.031ms|better: on 7.981ms, on 760.10%, in 8.6 times |
|99%|2.817ms|9.464ms|better: on 6.647ms, on 235.96%, in 3.4 times |
|99.999%|11.435ms|11.692ms|better: on 257µs, on 2.25%, in 1.0 times |
|Requests, count|2063784|163501|more: 1162.2% , in 12.6 times |
