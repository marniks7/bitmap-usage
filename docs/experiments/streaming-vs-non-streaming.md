# Compare streaming vs non-streaming approaches

* Case1 - streaming accepts endless prices for calculation (3k objects). It unmarshal objects one-by-one and send them
  to business logic, after that it starts marshaling results one-by-one as well. Concurrent approach is used for all
  steps - unmarshal, business logic and marshal.
* Case2 - non-streaming approach accepts array of prices for calculation (3k objects as well) and unmarshal them all
  at-once, after that it calculates concurrently (in 2 goroutines, the same behavior as for Case1). When all data is
  ready - marshal all at-once.

## Difference Report

| Percentile      | Case1    | Case2    | Case1 vs Case2                              |
|-----------------|----------|----------|---------------------------------------------|
| 50%             | 16.44ms  | 22.392ms | better: on 5.952ms, on 36.20%, in 1.4 times |
| 90%             | 20.314ms | 25.468ms | better: on 5.154ms, on 25.37%, in 1.3 times |
| 95%             | 25.455ms | 29.298ms | better: on 3.843ms, on 15.10%, in 1.2 times |
| 97%             | 31.028ms | 31.815ms | better: on 787µs, on 2.54%, in 1.0 times    |
| 98%             | 38.185ms | 43.886ms | better: on 5.701ms, on 14.93%, in 1.1 times |
| 99%             | 42.074ms | 48.363ms | better: on 6.289ms, on 14.95%, in 1.1 times |
| 99.999%         | 49.281ms | 49.926ms | better: on 645µs, on 1.31%, in 1.0 times    |
| Requests, count | 560      | 422      | more: 32.7% , in 1.3 times                  |

## Conclusion

Streaming approach is absolute winner: Benefit is 14%-36%.

### Afterword

Take into consideration the following (but note, that it is NOT tested here)

* Client will benefit from streaming approach as well - it can start
    * accepting data earlier (especially in case of network delays)
    * start unmarshalling earlier
    * start logic execution earlier (if possible)