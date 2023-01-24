### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|3.715ms|better: on 3.301ms, on 797.34%, in 9.0 times , 1 order of magnitude|
|90%|848µs|7.27ms|better: on 6.422ms, on 757.31%, in 8.6 times , 1 order of magnitude|
|95%|1.005ms|8.413ms|better: on 7.408ms, on 737.11%, in 8.4 times |
|97%|1.13ms|8.967ms|better: on 7.837ms, on 693.54%, in 7.9 times |
|98%|1.303ms|9.35ms|better: on 8.047ms, on 617.57%, in 7.2 times |
|99%|2.733ms|9.799ms|better: on 7.066ms, on 258.54%, in 3.6 times |
|99.999%|62.218ms|38.249ms|worth: on 23.969ms, on -38.52%, in 0.6 times |
|Requests, count|1331229|158459|more: 740.1% , in 8.4 times |
