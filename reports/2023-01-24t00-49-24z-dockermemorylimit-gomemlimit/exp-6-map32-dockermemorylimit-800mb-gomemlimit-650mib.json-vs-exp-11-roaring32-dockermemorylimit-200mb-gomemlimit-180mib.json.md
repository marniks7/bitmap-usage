### Difference Report
Case1: exp-6-map32-dockermemorylimit-800mb-gomemlimit-650mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.72ms|577µs|worth: on 3.143ms, on -84.49%, in 0.2 times , -1 order of magnitude|
|90%|7.25ms|2.32ms|worth: on 4.93ms, on -68.00%, in 0.3 times |
|95%|8.386ms|3.324ms|worth: on 5.062ms, on -60.36%, in 0.4 times |
|97%|8.938ms|4.121ms|worth: on 4.817ms, on -53.89%, in 0.5 times |
|98%|9.334ms|4.768ms|worth: on 4.566ms, on -48.92%, in 0.5 times |
|99%|9.808ms|5.818ms|worth: on 3.99ms, on -40.68%, in 0.6 times |
|99.999%|65.501ms|34.963ms|worth: on 30.538ms, on -46.62%, in 0.5 times |
|Requests, count|158549|851255|less: -81.4% , in 0.2 times |
