### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|3.639ms|better: on 3.062ms, on 530.68%, in 6.3 times , 1 order of magnitude|
|90%|2.32ms|7.119ms|better: on 4.799ms, on 206.85%, in 3.1 times |
|95%|3.324ms|8.239ms|better: on 4.915ms, on 147.86%, in 2.5 times |
|97%|4.121ms|8.773ms|better: on 4.652ms, on 112.89%, in 2.1 times |
|98%|4.768ms|9.099ms|better: on 4.331ms, on 90.83%, in 1.9 times |
|99%|5.818ms|9.597ms|better: on 3.779ms, on 64.95%, in 1.6 times |
|99.999%|34.963ms|52.769ms|better: on 17.806ms, on 50.93%, in 1.5 times |
|Requests, count|851255|160945|more: 428.9% , in 5.3 times |
