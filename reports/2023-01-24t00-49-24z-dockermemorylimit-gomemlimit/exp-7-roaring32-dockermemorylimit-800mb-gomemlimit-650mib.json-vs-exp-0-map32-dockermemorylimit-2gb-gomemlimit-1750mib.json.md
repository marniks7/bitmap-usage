### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|3.69ms|better: on 3.276ms, on 791.30%, in 8.9 times , 1 order of magnitude|
|90%|848µs|7.254ms|better: on 6.406ms, on 755.42%, in 8.6 times , 1 order of magnitude|
|95%|1.005ms|8.396ms|better: on 7.391ms, on 735.42%, in 8.4 times |
|97%|1.13ms|8.975ms|better: on 7.845ms, on 694.25%, in 7.9 times |
|98%|1.303ms|9.347ms|better: on 8.044ms, on 617.34%, in 7.2 times |
|99%|2.733ms|9.772ms|better: on 7.039ms, on 257.56%, in 3.6 times |
|99.999%|62.218ms|49.717ms|worth: on 12.501ms, on -20.09%, in 0.8 times |
|Requests, count|1331229|159419|more: 735.1% , in 8.4 times |
