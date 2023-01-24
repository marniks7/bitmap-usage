### Difference Report
Case1: exp-3-roaring32-dockermemorylimit-1.5gb-gomemlimit-1250mib.json
Case2: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|399µs|3.69ms|better: on 3.291ms, on 824.81%, in 9.2 times , 1 order of magnitude|
|90%|796µs|7.254ms|better: on 6.458ms, on 811.31%, in 9.1 times , 1 order of magnitude|
|95%|930µs|8.396ms|better: on 7.466ms, on 802.80%, in 9.0 times , 1 order of magnitude|
|97%|1.018ms|8.975ms|better: on 7.957ms, on 781.63%, in 8.8 times |
|98%|1.085ms|9.347ms|better: on 8.262ms, on 761.47%, in 8.6 times |
|99%|1.23ms|9.772ms|better: on 8.542ms, on 694.47%, in 7.9 times |
|99.999%|58.327ms|49.717ms|worth: on 8.61ms, on -14.76%, in 0.9 times |
|Requests, count|1390640|159419|more: 772.3% , in 8.7 times |
