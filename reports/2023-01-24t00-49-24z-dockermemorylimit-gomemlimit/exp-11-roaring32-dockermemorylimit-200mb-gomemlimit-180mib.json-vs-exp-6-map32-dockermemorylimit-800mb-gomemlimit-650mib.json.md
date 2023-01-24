### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|3.72ms|better: on 3.143ms, on 544.71%, in 6.4 times , 1 order of magnitude|
|90%|2.32ms|7.25ms|better: on 4.93ms, on 212.50%, in 3.1 times |
|95%|3.324ms|8.386ms|better: on 5.062ms, on 152.29%, in 2.5 times |
|97%|4.121ms|8.938ms|better: on 4.817ms, on 116.89%, in 2.2 times |
|98%|4.768ms|9.334ms|better: on 4.566ms, on 95.76%, in 2.0 times |
|99%|5.818ms|9.808ms|better: on 3.99ms, on 68.58%, in 1.7 times |
|99.999%|34.963ms|65.501ms|better: on 30.538ms, on 87.34%, in 1.9 times |
|Requests, count|851255|158549|more: 436.9% , in 5.4 times |
