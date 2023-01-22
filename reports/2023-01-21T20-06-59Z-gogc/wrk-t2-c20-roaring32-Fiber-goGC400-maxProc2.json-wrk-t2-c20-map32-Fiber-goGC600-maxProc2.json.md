### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC400-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|273µs|3.559ms|better: on 3.286ms, on 1203.66%, in 13.0 times , 1 order of magnitude|
|90%|567µs|6.981ms|better: on 6.414ms, on 1131.22%, in 12.3 times , 1 order of magnitude|
|95%|664µs|8.082ms|better: on 7.418ms, on 1117.17%, in 12.2 times , 1 order of magnitude|
|97%|802µs|8.606ms|better: on 7.804ms, on 973.07%, in 10.7 times , 1 order of magnitude|
|98%|1.05ms|8.921ms|better: on 7.871ms, on 749.62%, in 8.5 times |
|99%|2.817ms|9.376ms|better: on 6.559ms, on 232.84%, in 3.3 times |
|99.999%|11.435ms|11.642ms|better: on 207µs, on 1.81%, in 1.0 times |
|Requests, count|2063784|164690|more: 1153.1% , in 12.5 times |
