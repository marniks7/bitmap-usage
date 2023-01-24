### Difference Report
Case1: exp-9-roaring32-dockermemorylimit-500mb-gomemlimit-400mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|427µs|577µs|better: on 150µs, on 35.13%, in 1.4 times |
|90%|911µs|2.32ms|better: on 1.409ms, on 154.67%, in 2.5 times , 1 order of magnitude|
|95%|1.132ms|3.324ms|better: on 2.192ms, on 193.64%, in 2.9 times |
|97%|1.536ms|4.121ms|better: on 2.585ms, on 168.29%, in 2.7 times |
|98%|2.47ms|4.768ms|better: on 2.298ms, on 93.04%, in 1.9 times |
|99%|4.84ms|5.818ms|better: on 978µs, on 20.21%, in 1.2 times |
|99.999%|45.173ms|34.963ms|worth: on 10.21ms, on -22.60%, in 0.8 times |
|Requests, count|1280125|851255|more: 50.4% , in 1.5 times |
