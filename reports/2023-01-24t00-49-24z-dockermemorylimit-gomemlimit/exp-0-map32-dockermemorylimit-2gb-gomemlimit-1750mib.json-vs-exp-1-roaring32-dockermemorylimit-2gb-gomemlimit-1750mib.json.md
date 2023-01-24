### Difference Report
Case1: exp-0-map32-dockermemorylimit-2gb-gomemlimit-1750mib.json
Case2: exp-1-roaring32-dockermemorylimit-2gb-gomemlimit-1750mib.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.69ms|377µs|worth: on 3.313ms, on -89.78%, in 0.1 times , -1 order of magnitude|
|90%|7.254ms|751µs|worth: on 6.503ms, on -89.65%, in 0.1 times , -1 order of magnitude|
|95%|8.396ms|873µs|worth: on 7.523ms, on -89.60%, in 0.1 times , -1 order of magnitude|
|97%|8.975ms|954µs|worth: on 8.021ms, on -89.37%, in 0.1 times , -1 order of magnitude|
|98%|9.347ms|1.014ms|worth: on 8.333ms, on -89.15%, in 0.1 times |
|99%|9.772ms|1.126ms|worth: on 8.646ms, on -88.48%, in 0.1 times |
|99.999%|49.717ms|43.02ms|worth: on 6.697ms, on -13.47%, in 0.9 times |
|Requests, count|159419|1475585|less: -89.2% , in 0.1 times |
