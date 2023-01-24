### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|3.715ms|better: on 3.138ms, on 543.85%, in 6.4 times , 1 order of magnitude|
|90%|2.32ms|7.27ms|better: on 4.95ms, on 213.36%, in 3.1 times |
|95%|3.324ms|8.413ms|better: on 5.089ms, on 153.10%, in 2.5 times |
|97%|4.121ms|8.967ms|better: on 4.846ms, on 117.59%, in 2.2 times |
|98%|4.768ms|9.35ms|better: on 4.582ms, on 96.10%, in 2.0 times |
|99%|5.818ms|9.799ms|better: on 3.981ms, on 68.43%, in 1.7 times |
|99.999%|34.963ms|38.249ms|better: on 3.286ms, on 9.40%, in 1.1 times |
|Requests, count|851255|158459|more: 437.2% , in 5.4 times |
