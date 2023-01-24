### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|577µs|worth: on 3.138ms, on -84.47%, in 0.2 times , -1 order of magnitude|
|90%|7.27ms|2.32ms|worth: on 4.95ms, on -68.09%, in 0.3 times |
|95%|8.413ms|3.324ms|worth: on 5.089ms, on -60.49%, in 0.4 times |
|97%|8.967ms|4.121ms|worth: on 4.846ms, on -54.04%, in 0.5 times |
|98%|9.35ms|4.768ms|worth: on 4.582ms, on -49.01%, in 0.5 times |
|99%|9.799ms|5.818ms|worth: on 3.981ms, on -40.63%, in 0.6 times |
|99.999%|38.249ms|34.963ms|worth: on 3.286ms, on -8.59%, in 0.9 times |
|Requests, count|158459|851255|less: -81.4% , in 0.2 times |
