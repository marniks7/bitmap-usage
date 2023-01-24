### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|577µs|worth: on 3.113ms, on -84.36%, in 0.2 times , -1 order of magnitude|
|90%|7.254ms|2.32ms|worth: on 4.934ms, on -68.02%, in 0.3 times |
|95%|8.396ms|3.324ms|worth: on 5.072ms, on -60.41%, in 0.4 times |
|97%|8.975ms|4.121ms|worth: on 4.854ms, on -54.08%, in 0.5 times |
|98%|9.347ms|4.768ms|worth: on 4.579ms, on -48.99%, in 0.5 times |
|99%|9.772ms|5.818ms|worth: on 3.954ms, on -40.46%, in 0.6 times |
|99.999%|49.717ms|34.963ms|worth: on 14.754ms, on -29.68%, in 0.7 times |
|Requests, count|159419|851255|less: -81.3% , in 0.2 times |
