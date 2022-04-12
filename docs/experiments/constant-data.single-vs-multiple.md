# Constant Data. Single request vs Multiple requests

* Case 1 - single request
* Case 2 - multiple requests (randomly selected from 3000 requests)

### Map32. Difference Report

Huge difference (`40%` - `119%`)

| Percentile      | Case1    | Case2    | Case1 vs Case2                                                     |
|-----------------|----------|----------|--------------------------------------------------------------------|
| 50%             | 1.851ms  | 4.072ms  | better: on 2.221ms, on 119.99%, in 2.2 times                       |
| 90%             | 4.061ms  | 8.816ms  | better: on 4.755ms, on 117.09%, in 2.2 times                       |
| 95%             | 5.453ms  | 10.67ms  | better: on 5.217ms, on 95.67%, in 2.0 times , 1 order of magnitude |
| 97%             | 7.323ms  | 12.442ms | better: on 5.119ms, on 69.90%, in 1.7 times , 1 order of magnitude |
| 98%             | 8.939ms  | 13.852ms | better: on 4.913ms, on 54.96%, in 1.5 times , 1 order of magnitude |
| 99%             | 11.759ms | 16.346ms | better: on 4.587ms, on 39.01%, in 1.4 times                        |
| 99.999%         | 40.734ms | 40.901ms | better: on 167µs, on 0.41%, in 1.0 times                           |
| Requests, count | 307139   | 140073   | more: 119.3% , in 2.2 times                                        |

### Roaring32. Difference Report

No difference. This is strange as well. Bitmap(s) size is very small, and it might be cached in RAM\CPU, as well as
results of operations

| Percentile      | Case1    | Case2    | Case1 vs Case2                             |
|-----------------|----------|----------|--------------------------------------------|
| 50%             | 217µs    | 223µs    | better: on 6µs, on 2.76%, in 1.0 times     |
| 90%             | 435µs    | 453µs    | better: on 18µs, on 4.14%, in 1.0 times    |
| 95%             | 498µs    | 522µs    | better: on 24µs, on 4.82%, in 1.0 times    |
| 97%             | 547µs    | 565µs    | better: on 18µs, on 3.29%, in 1.0 times    |
| 98%             | 609µs    | 614µs    | better: on 5µs, on 0.82%, in 1.0 times     |
| 99%             | 853µs    | 849µs    | worth: on 4µs, on -0.47%, in 1.0 times     |
| 99.999%         | 12.848ms | 13.884ms | better: on 1.036ms, on 8.06%, in 1.1 times |
| Requests, count | 2683890  | 2526206  | more: 6.2% , in 1.1 times                  |

## Conclusion

Difference for case1 vs case2 is very huge, multiple requests is a MUST for real testing.