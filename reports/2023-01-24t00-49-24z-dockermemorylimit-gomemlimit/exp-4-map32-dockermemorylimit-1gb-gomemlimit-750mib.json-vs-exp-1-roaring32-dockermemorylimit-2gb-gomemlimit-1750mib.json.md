### Difference Report
Case1: exp-4-map32-dockermemorylimit-1gb-gomemlimit-750mib.json
Case2: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.639ms|377µs|worth: on 3.262ms, on -89.64%, in 0.1 times , -1 order of magnitude|
|90%|7.119ms|751µs|worth: on 6.368ms, on -89.45%, in 0.1 times , -1 order of magnitude|
|95%|8.239ms|873µs|worth: on 7.366ms, on -89.40%, in 0.1 times , -1 order of magnitude|
|97%|8.773ms|954µs|worth: on 7.819ms, on -89.13%, in 0.1 times , -1 order of magnitude|
|98%|9.099ms|1.014ms|worth: on 8.085ms, on -88.86%, in 0.1 times |
|99%|9.597ms|1.126ms|worth: on 8.471ms, on -88.27%, in 0.1 times |
|99.999%|52.769ms|43.02ms|worth: on 9.749ms, on -18.47%, in 0.8 times |
|Requests, count|160945|1475585|less: -89.1% , in 0.1 times |
