### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC800-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|263µs|3.54ms|better: on 3.277ms, on 1246.01%, in 13.5 times , 1 order of magnitude|
|90%|537µs|7.023ms|better: on 6.486ms, on 1207.82%, in 13.1 times , 1 order of magnitude|
|95%|619µs|8.12ms|better: on 7.501ms, on 1211.79%, in 13.1 times , 1 order of magnitude|
|97%|679µs|8.643ms|better: on 7.964ms, on 1172.90%, in 12.7 times , 1 order of magnitude|
|98%|760µs|9.005ms|better: on 8.245ms, on 1084.87%, in 11.8 times , 1 order of magnitude|
|99%|997µs|9.442ms|better: on 8.445ms, on 847.04%, in 9.5 times , 1 order of magnitude|
|99.999%|10.692ms|18.167ms|better: on 7.475ms, on 69.91%, in 1.7 times |
|Requests, count|2152710|164757|more: 1206.6% , in 13.1 times |
