### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|577µs|worth: on 3.062ms, on -84.14%, in 0.2 times , -1 order of magnitude|
|90%|7.119ms|2.32ms|worth: on 4.799ms, on -67.41%, in 0.3 times |
|95%|8.239ms|3.324ms|worth: on 4.915ms, on -59.66%, in 0.4 times |
|97%|8.773ms|4.121ms|worth: on 4.652ms, on -53.03%, in 0.5 times |
|98%|9.099ms|4.768ms|worth: on 4.331ms, on -47.60%, in 0.5 times |
|99%|9.597ms|5.818ms|worth: on 3.779ms, on -39.38%, in 0.6 times |
|99.999%|52.769ms|34.963ms|worth: on 17.806ms, on -33.74%, in 0.7 times |
|Requests, count|160945|851255|less: -81.1% , in 0.2 times |
