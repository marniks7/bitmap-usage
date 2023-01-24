### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|3.69ms|better: on 3.113ms, on 539.51%, in 6.4 times , 1 order of magnitude|
|90%|2.32ms|7.254ms|better: on 4.934ms, on 212.67%, in 3.1 times |
|95%|3.324ms|8.396ms|better: on 5.072ms, on 152.59%, in 2.5 times |
|97%|4.121ms|8.975ms|better: on 4.854ms, on 117.79%, in 2.2 times |
|98%|4.768ms|9.347ms|better: on 4.579ms, on 96.04%, in 2.0 times |
|99%|5.818ms|9.772ms|better: on 3.954ms, on 67.96%, in 1.7 times |
|99.999%|34.963ms|49.717ms|better: on 14.754ms, on 42.20%, in 1.4 times |
|Requests, count|851255|159419|more: 434.0% , in 5.3 times |
