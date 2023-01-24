### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-2-map32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|3.715ms|better: on 3.338ms, on 885.41%, in 9.9 times , 1 order of magnitude|
|90%|751µs|7.27ms|better: on 6.519ms, on 868.04%, in 9.7 times , 1 order of magnitude|
|95%|873µs|8.413ms|better: on 7.54ms, on 863.69%, in 9.6 times , 1 order of magnitude|
|97%|954µs|8.967ms|better: on 8.013ms, on 839.94%, in 9.4 times , 1 order of magnitude|
|98%|1.014ms|9.35ms|better: on 8.336ms, on 822.09%, in 9.2 times |
|99%|1.126ms|9.799ms|better: on 8.673ms, on 770.25%, in 8.7 times |
|99.999%|43.02ms|38.249ms|worth: on 4.771ms, on -11.09%, in 0.9 times |
|Requests, count|1475585|158459|more: 831.2% , in 9.3 times |
