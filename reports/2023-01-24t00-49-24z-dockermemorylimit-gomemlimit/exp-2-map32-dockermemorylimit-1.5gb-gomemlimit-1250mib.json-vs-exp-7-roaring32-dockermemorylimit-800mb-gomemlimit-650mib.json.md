### Difference Report
Case1: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.715ms|414µs|worth: on 3.301ms, on -88.86%, in 0.1 times , -1 order of magnitude|
|90%|7.27ms|848µs|worth: on 6.422ms, on -88.34%, in 0.1 times , -1 order of magnitude|
|95%|8.413ms|1.005ms|worth: on 7.408ms, on -88.05%, in 0.1 times |
|97%|8.967ms|1.13ms|worth: on 7.837ms, on -87.40%, in 0.1 times |
|98%|9.35ms|1.303ms|worth: on 8.047ms, on -86.06%, in 0.1 times |
|99%|9.799ms|2.733ms|worth: on 7.066ms, on -72.11%, in 0.3 times |
|99.999%|38.249ms|62.218ms|better: on 23.969ms, on 62.67%, in 1.6 times |
|Requests, count|158459|1331229|less: -88.1% , in 0.1 times |
