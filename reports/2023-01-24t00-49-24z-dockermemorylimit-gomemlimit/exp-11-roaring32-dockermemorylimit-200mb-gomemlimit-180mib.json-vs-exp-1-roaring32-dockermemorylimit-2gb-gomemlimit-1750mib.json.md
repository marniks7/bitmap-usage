### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|377µs|worth: on 200µs, on -34.66%, in 0.7 times |
|90%|2.32ms|751µs|worth: on 1.569ms, on -67.63%, in 0.3 times , -1 order of magnitude|
|95%|3.324ms|873µs|worth: on 2.451ms, on -73.74%, in 0.3 times , -1 order of magnitude|
|97%|4.121ms|954µs|worth: on 3.167ms, on -76.85%, in 0.2 times , -1 order of magnitude|
|98%|4.768ms|1.014ms|worth: on 3.754ms, on -78.73%, in 0.2 times |
|99%|5.818ms|1.126ms|worth: on 4.692ms, on -80.65%, in 0.2 times |
|99.999%|34.963ms|43.02ms|better: on 8.057ms, on 23.04%, in 1.2 times |
|Requests, count|851255|1475585|less: -42.3% , in 0.6 times |
