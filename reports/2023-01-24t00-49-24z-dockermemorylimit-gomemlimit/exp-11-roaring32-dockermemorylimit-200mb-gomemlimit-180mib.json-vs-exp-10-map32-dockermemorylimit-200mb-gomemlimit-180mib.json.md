### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|5.048ms|better: on 4.471ms, on 774.87%, in 8.7 times , 1 order of magnitude|
|90%|2.32ms|11.405ms|better: on 9.085ms, on 391.59%, in 4.9 times , 1 order of magnitude|
|95%|3.324ms|13.544ms|better: on 10.22ms, on 307.46%, in 4.1 times , 1 order of magnitude|
|97%|4.121ms|14.846ms|better: on 10.725ms, on 260.25%, in 3.6 times , 1 order of magnitude|
|98%|4.768ms|15.813ms|better: on 11.045ms, on 231.65%, in 3.3 times , 1 order of magnitude|
|99%|5.818ms|17.471ms|better: on 11.653ms, on 200.29%, in 3.0 times , 1 order of magnitude|
|99.999%|34.963ms|49.351ms|better: on 14.388ms, on 41.15%, in 1.4 times |
|Requests, count|851255|111948|more: 660.4% , in 7.6 times |
