### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|414µs|worth: on 163µs, on -28.25%, in 0.7 times |
|90%|2.32ms|848µs|worth: on 1.472ms, on -63.45%, in 0.4 times , -1 order of magnitude|
|95%|3.324ms|1.005ms|worth: on 2.319ms, on -69.77%, in 0.3 times |
|97%|4.121ms|1.13ms|worth: on 2.991ms, on -72.58%, in 0.3 times |
|98%|4.768ms|1.303ms|worth: on 3.465ms, on -72.67%, in 0.3 times |
|99%|5.818ms|2.733ms|worth: on 3.085ms, on -53.03%, in 0.5 times |
|99.999%|34.963ms|62.218ms|better: on 27.255ms, on 77.95%, in 1.8 times |
|Requests, count|851255|1331229|less: -36.1% , in 0.6 times |
