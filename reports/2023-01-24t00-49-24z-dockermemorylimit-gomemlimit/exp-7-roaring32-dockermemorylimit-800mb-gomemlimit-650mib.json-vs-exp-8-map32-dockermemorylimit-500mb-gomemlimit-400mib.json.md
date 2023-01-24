### Difference Report
Case1: exp-7-roaring32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-8-map32-dockermemorylimit-500mb-gomemlimit-400mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|414µs|3.751ms|better: on 3.337ms, on 806.04%, in 9.1 times , 1 order of magnitude|
|90%|848µs|7.383ms|better: on 6.535ms, on 770.64%, in 8.7 times , 1 order of magnitude|
|95%|1.005ms|8.545ms|better: on 7.54ms, on 750.25%, in 8.5 times |
|97%|1.13ms|9.127ms|better: on 7.997ms, on 707.70%, in 8.1 times |
|98%|1.303ms|9.496ms|better: on 8.193ms, on 628.78%, in 7.3 times |
|99%|2.733ms|9.936ms|better: on 7.203ms, on 263.56%, in 3.6 times |
|99.999%|62.218ms|51.45ms|worth: on 10.768ms, on -17.31%, in 0.8 times |
|Requests, count|1331229|156741|more: 749.3% , in 8.5 times |
