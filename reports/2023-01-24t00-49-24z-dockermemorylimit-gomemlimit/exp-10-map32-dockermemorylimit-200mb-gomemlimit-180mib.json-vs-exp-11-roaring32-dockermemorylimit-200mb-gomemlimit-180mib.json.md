### Difference Report
Case1: exp-10-map32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|5.048ms|577µs|worth: on 4.471ms, on -88.57%, in 0.1 times , -1 order of magnitude|
|90%|11.405ms|2.32ms|worth: on 9.085ms, on -79.66%, in 0.2 times , -1 order of magnitude|
|95%|13.544ms|3.324ms|worth: on 10.22ms, on -75.46%, in 0.2 times , -1 order of magnitude|
|97%|14.846ms|4.121ms|worth: on 10.725ms, on -72.24%, in 0.3 times , -1 order of magnitude|
|98%|15.813ms|4.768ms|worth: on 11.045ms, on -69.85%, in 0.3 times , -1 order of magnitude|
|99%|17.471ms|5.818ms|worth: on 11.653ms, on -66.70%, in 0.3 times , -1 order of magnitude|
|99.999%|49.351ms|34.963ms|worth: on 14.388ms, on -29.15%, in 0.7 times |
|Requests, count|111948|851255|less: -86.8% , in 0.1 times |
