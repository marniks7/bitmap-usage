### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|577µs|better: on 163µs, on 39.37%, in 1.4 times |
|90%|848µs|2.32ms|better: on 1.472ms, on 173.58%, in 2.7 times , 1 order of magnitude|
|95%|1.005ms|3.324ms|better: on 2.319ms, on 230.75%, in 3.3 times |
|97%|1.13ms|4.121ms|better: on 2.991ms, on 264.69%, in 3.6 times |
|98%|1.303ms|4.768ms|better: on 3.465ms, on 265.92%, in 3.7 times |
|99%|2.733ms|5.818ms|better: on 3.085ms, on 112.88%, in 2.1 times |
|99.999%|62.218ms|34.963ms|worth: on 27.255ms, on -43.81%, in 0.6 times |
|Requests, count|1331229|851255|more: 56.4% , in 1.6 times |
