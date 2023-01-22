### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.559ms|288µs|worth: on 3.271ms, on -91.91%, in 0.1 times , -1 order of magnitude|
|90%|6.981ms|676µs|worth: on 6.305ms, on -90.32%, in 0.1 times , -1 order of magnitude|
|95%|8.082ms|1.182ms|worth: on 6.9ms, on -85.37%, in 0.1 times |
|97%|8.606ms|2.563ms|worth: on 6.043ms, on -70.22%, in 0.3 times |
|98%|8.921ms|3.749ms|worth: on 5.172ms, on -57.98%, in 0.4 times |
|99%|9.376ms|5.576ms|worth: on 3.8ms, on -40.53%, in 0.6 times |
|99.999%|11.642ms|11.676ms|better: on 34µs, on 0.29%, in 1.0 times |
|Requests, count|164690|1884912|less: -91.3% , in 0.1 times |
