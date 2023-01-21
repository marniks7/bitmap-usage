### Difference Report
Case1: wrk-t2-c20-roaring32-Default-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Default-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|374µs|3.891ms|better: on 3.517ms, on 940.37%, in 10.4 times , 1 order of magnitude|
|90%|761µs|7.703ms|better: on 6.942ms, on 912.22%, in 10.1 times , 1 order of magnitude|
|95%|880µs|8.88ms|better: on 8ms, on 909.09%, in 10.1 times , 1 order of magnitude|
|97%|980µs|9.467ms|better: on 8.487ms, on 866.02%, in 9.7 times , 1 order of magnitude|
|98%|1.08ms|9.945ms|better: on 8.865ms, on 820.83%, in 9.2 times |
|99%|1.293ms|10.744ms|better: on 9.451ms, on 730.94%, in 8.3 times , 1 order of magnitude|
|99.999%|11.04ms|16.616ms|better: on 5.576ms, on 50.51%, in 1.5 times |
|Requests, count|1521742|151482|more: 904.6% , in 10.0 times |
