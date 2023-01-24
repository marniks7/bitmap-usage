### Difference Report
Case1: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json
Case2: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|577µs|399µs|worth: on 178µs, on -30.85%, in 0.7 times |
|90%|2.32ms|796µs|worth: on 1.524ms, on -65.69%, in 0.3 times , -1 order of magnitude|
|95%|3.324ms|930µs|worth: on 2.394ms, on -72.02%, in 0.3 times , -1 order of magnitude|
|97%|4.121ms|1.018ms|worth: on 3.103ms, on -75.30%, in 0.2 times |
|98%|4.768ms|1.085ms|worth: on 3.683ms, on -77.24%, in 0.2 times |
|99%|5.818ms|1.23ms|worth: on 4.588ms, on -78.86%, in 0.2 times |
|99.999%|34.963ms|58.327ms|better: on 23.364ms, on 66.82%, in 1.7 times |
|Requests, count|851255|1390640|less: -38.8% , in 0.6 times |
