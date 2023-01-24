### Difference Report
Case1: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|377µs|3.639ms|better: on 3.262ms, on 865.25%, in 9.7 times , 1 order of magnitude|
|90%|751µs|7.119ms|better: on 6.368ms, on 847.94%, in 9.5 times , 1 order of magnitude|
|95%|873µs|8.239ms|better: on 7.366ms, on 843.76%, in 9.4 times , 1 order of magnitude|
|97%|954µs|8.773ms|better: on 7.819ms, on 819.60%, in 9.2 times , 1 order of magnitude|
|98%|1.014ms|9.099ms|better: on 8.085ms, on 797.34%, in 9.0 times |
|99%|1.126ms|9.597ms|better: on 8.471ms, on 752.31%, in 8.5 times |
|99.999%|43.02ms|52.769ms|better: on 9.749ms, on 22.66%, in 1.2 times |
|Requests, count|1475585|160945|more: 816.8% , in 9.2 times |
