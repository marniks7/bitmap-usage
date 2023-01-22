### Difference Report
Case1: wrk-t2-c20-roaring32.json
Case2: wrk-t2-c20-map32.json

| Percentile      | Case1    | Case2    | Case1 vs Case2                                                        |
|-----------------|----------|----------|-----------------------------------------------------------------------|
| 50%             | 252µs    | 3.612ms  | better: on 3.36ms, on 1333.33%, in 14.3 times , 1 order of magnitude  |
| 90%             | 510µs    | 7.083ms  | better: on 6.573ms, on 1288.82%, in 13.9 times , 1 order of magnitude |
| 95%             | 588µs    | 8.195ms  | better: on 7.607ms, on 1293.71%, in 13.9 times , 1 order of magnitude |
| 97%             | 646µs    | 8.728ms  | better: on 8.082ms, on 1251.08%, in 13.5 times , 1 order of magnitude |
| 98%             | 711µs    | 9.073ms  | better: on 8.362ms, on 1176.09%, in 12.8 times , 1 order of magnitude |
| 99%             | 911µs    | 9.534ms  | better: on 8.623ms, on 946.54%, in 10.5 times , 1 order of magnitude  |
| 99.999%         | 10.241ms | 15.321ms | better: on 5.08ms, on 49.60%, in 1.5 times                            |
| Requests, count | 2244242  | 162471   | more: 1281.3% , in 13.8 times                                         |
