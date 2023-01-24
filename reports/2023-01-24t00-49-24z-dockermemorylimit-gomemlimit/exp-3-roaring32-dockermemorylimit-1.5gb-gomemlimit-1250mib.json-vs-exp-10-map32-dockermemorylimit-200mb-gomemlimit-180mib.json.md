### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|5.048ms|better: on 4.649ms, on 1165.16%, in 12.7 times , 1 order of magnitude|
|90%|796µs|11.405ms|better: on 10.609ms, on 1332.79%, in 14.3 times , 2 order of magnitude|
|95%|930µs|13.544ms|better: on 12.614ms, on 1356.34%, in 14.6 times , 2 order of magnitude|
|97%|1.018ms|14.846ms|better: on 13.828ms, on 1358.35%, in 14.6 times , 1 order of magnitude|
|98%|1.085ms|15.813ms|better: on 14.728ms, on 1357.42%, in 14.6 times , 1 order of magnitude|
|99%|1.23ms|17.471ms|better: on 16.241ms, on 1320.41%, in 14.2 times , 1 order of magnitude|
|99.999%|58.327ms|49.351ms|worth: on 8.976ms, on -15.39%, in 0.8 times |
|Requests, count|1390640|111948|more: 1142.2% , in 12.4 times |
