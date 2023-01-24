### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|577µs|better: on 200µs, on 53.05%, in 1.5 times |
|90%|751µs|2.32ms|better: on 1.569ms, on 208.92%, in 3.1 times , 1 order of magnitude|
|95%|873µs|3.324ms|better: on 2.451ms, on 280.76%, in 3.8 times , 1 order of magnitude|
|97%|954µs|4.121ms|better: on 3.167ms, on 331.97%, in 4.3 times , 1 order of magnitude|
|98%|1.014ms|4.768ms|better: on 3.754ms, on 370.22%, in 4.7 times |
|99%|1.126ms|5.818ms|better: on 4.692ms, on 416.70%, in 5.2 times |
|99.999%|43.02ms|34.963ms|worth: on 8.057ms, on -18.73%, in 0.8 times |
|Requests, count|1475585|851255|more: 73.3% , in 1.7 times |
