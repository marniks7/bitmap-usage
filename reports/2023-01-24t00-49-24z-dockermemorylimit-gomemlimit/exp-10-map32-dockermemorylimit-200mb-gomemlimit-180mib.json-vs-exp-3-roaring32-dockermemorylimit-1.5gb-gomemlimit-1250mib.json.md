### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|399µs|worth: on 4.649ms, on -92.10%, in 0.1 times , -1 order of magnitude|
|90%|11.405ms|796µs|worth: on 10.609ms, on -93.02%, in 0.1 times , -2 order of magnitude|
|95%|13.544ms|930µs|worth: on 12.614ms, on -93.13%, in 0.1 times , -2 order of magnitude|
|97%|14.846ms|1.018ms|worth: on 13.828ms, on -93.14%, in 0.1 times , -1 order of magnitude|
|98%|15.813ms|1.085ms|worth: on 14.728ms, on -93.14%, in 0.1 times , -1 order of magnitude|
|99%|17.471ms|1.23ms|worth: on 16.241ms, on -92.96%, in 0.1 times , -1 order of magnitude|
|99.999%|49.351ms|58.327ms|better: on 8.976ms, on 18.19%, in 1.2 times |
|Requests, count|111948|1390640|less: -91.9% , in 0.1 times |
