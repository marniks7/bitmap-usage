### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|427µs|worth: on 150µs, on -26.00%, in 0.7 times |
|90%|2.32ms|911µs|worth: on 1.409ms, on -60.73%, in 0.4 times , -1 order of magnitude|
|95%|3.324ms|1.132ms|worth: on 2.192ms, on -65.94%, in 0.3 times |
|97%|4.121ms|1.536ms|worth: on 2.585ms, on -62.73%, in 0.4 times |
|98%|4.768ms|2.47ms|worth: on 2.298ms, on -48.20%, in 0.5 times |
|99%|5.818ms|4.84ms|worth: on 978µs, on -16.81%, in 0.8 times |
|99.999%|34.963ms|45.173ms|better: on 10.21ms, on 29.20%, in 1.3 times |
|Requests, count|851255|1280125|less: -33.5% , in 0.7 times |
