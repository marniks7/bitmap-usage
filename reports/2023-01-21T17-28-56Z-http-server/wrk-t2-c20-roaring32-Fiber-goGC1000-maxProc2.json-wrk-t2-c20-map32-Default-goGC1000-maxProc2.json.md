### Difference Report
Case1: wrk-t2-c20-roaring32-Fiber-goGC1000-maxProc2.json
Case2: wrk-t2-c20-map32-Default-goGC1000-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|254µs|3.891ms|better: on 3.637ms, on 1431.89%, in 15.3 times , 1 order of magnitude|
|90%|516µs|7.703ms|better: on 7.187ms, on 1392.83%, in 14.9 times , 1 order of magnitude|
|95%|597µs|8.88ms|better: on 8.283ms, on 1387.44%, in 14.9 times , 1 order of magnitude|
|97%|661µs|9.467ms|better: on 8.806ms, on 1332.22%, in 14.3 times , 1 order of magnitude|
|98%|736µs|9.945ms|better: on 9.209ms, on 1251.22%, in 13.5 times , 1 order of magnitude|
|99%|930µs|10.744ms|better: on 9.814ms, on 1055.27%, in 11.6 times , 2 order of magnitude|
|99.999%|10.253ms|16.616ms|better: on 6.363ms, on 62.06%, in 1.6 times |
|Requests, count|2224434|151482|more: 1368.4% , in 14.7 times |
