### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC100-maxProc2.json
Case2: wrk-t2-c20-map32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|288µs|3.559ms|better: on 3.271ms, on 1135.76%, in 12.4 times , 1 order of magnitude|
|90%|676µs|6.981ms|better: on 6.305ms, on 932.69%, in 10.3 times , 1 order of magnitude|
|95%|1.182ms|8.082ms|better: on 6.9ms, on 583.76%, in 6.8 times |
|97%|2.563ms|8.606ms|better: on 6.043ms, on 235.78%, in 3.4 times |
|98%|3.749ms|8.921ms|better: on 5.172ms, on 137.96%, in 2.4 times |
|99%|5.576ms|9.376ms|better: on 3.8ms, on 68.15%, in 1.7 times |
|99.999%|11.676ms|11.642ms|worth: on 34µs, on -0.29%, in 1.0 times |
|Requests, count|1884912|164690|more: 1044.5% , in 11.4 times |
