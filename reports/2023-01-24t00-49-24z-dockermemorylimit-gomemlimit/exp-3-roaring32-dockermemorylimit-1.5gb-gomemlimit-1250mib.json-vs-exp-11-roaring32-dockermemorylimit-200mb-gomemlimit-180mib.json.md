### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-11-roaring32-dockermemorylimit-200mb-gomemlimit-180mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|577µs|better: on 178µs, on 44.61%, in 1.4 times |
|90%|796µs|2.32ms|better: on 1.524ms, on 191.46%, in 2.9 times , 1 order of magnitude|
|95%|930µs|3.324ms|better: on 2.394ms, on 257.42%, in 3.6 times , 1 order of magnitude|
|97%|1.018ms|4.121ms|better: on 3.103ms, on 304.81%, in 4.0 times |
|98%|1.085ms|4.768ms|better: on 3.683ms, on 339.45%, in 4.4 times |
|99%|1.23ms|5.818ms|better: on 4.588ms, on 373.01%, in 4.7 times |
|99.999%|58.327ms|34.963ms|worth: on 23.364ms, on -40.06%, in 0.6 times |
|Requests, count|1390640|851255|more: 63.4% , in 1.6 times |
