### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.54ms|288µs|worth: on 3.252ms, on -91.86%, in 0.1 times , -1 order of magnitude|
|90%|7.023ms|676µs|worth: on 6.347ms, on -90.37%, in 0.1 times , -1 order of magnitude|
|95%|8.12ms|1.182ms|worth: on 6.938ms, on -85.44%, in 0.1 times |
|97%|8.643ms|2.563ms|worth: on 6.08ms, on -70.35%, in 0.3 times |
|98%|9.005ms|3.749ms|worth: on 5.256ms, on -58.37%, in 0.4 times |
|99%|9.442ms|5.576ms|worth: on 3.866ms, on -40.94%, in 0.6 times |
|99.999%|18.167ms|11.676ms|worth: on 6.491ms, on -35.73%, in 0.6 times |
|Requests, count|164757|1884912|less: -91.3% , in 0.1 times |
