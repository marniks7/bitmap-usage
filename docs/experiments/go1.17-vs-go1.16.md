# Compare go 1.17.6 vs go 1.16.15

* Case1 - go v1.17.6
* Case2 - go v1.16.15

## Bitmap roaring. 2 threads, 20 connections. Difference Report
| Percentile      | Case1    | Case2    | Case1 vs Case2                              |
|-----------------|----------|----------|---------------------------------------------|
| 50%             | 225µs    | 246µs    | better: on 21µs, on 9.33%, in 1.1 times     |
| 90%             | 452µs    | 495µs    | better: on 43µs, on 9.51%, in 1.1 times     |
| 95%             | 520µs    | 570µs    | better: on 50µs, on 9.62%, in 1.1 times     |
| 97%             | 561µs    | 623µs    | better: on 62µs, on 11.05%, in 1.1 times    |
| 98%             | 610µs    | 698µs    | better: on 88µs, on 14.43%, in 1.1 times    |
| 99%             | 897µs    | 967µs    | better: on 70µs, on 7.80%, in 1.1 times     |
| 99.999%         | 12.857ms | 16.131ms | better: on 3.274ms, on 25.46%, in 1.3 times |
| Requests, count | 2539937  | 2320529  | more: 9.5% , in 1.1 times                   |


There is 9% benefit in go1.17.6 compare to go 1.16. This is a bit higher than expected [5%](https://go.dev/blog/go1.17)

### Map. 2 threads, 20 connections. Difference Report
| Percentile      | Case1    | Case2    | Case1 vs Case2                          |
|-----------------|----------|----------|-----------------------------------------|
| 50%             | 3.451ms  | 3.505ms  | better: on 54µs, on 1.56%, in 1.0 times |
| 90%             | 6.956ms  | 6.933ms  | worth: on 23µs, on -0.33%, in 1.0 times |
| 95%             | 8.051ms  | 8.026ms  | worth: on 25µs, on -0.31%, in 1.0 times |
| 97%             | 8.553ms  | 8.561ms  | better: on 8µs, on 0.09%, in 1.0 times  |
| 98%             | 8.882ms  | 8.79ms   | worth: on 92µs, on -1.04%, in 1.0 times |
| 99%             | 9.286ms  | 9.288ms  | better: on 2µs, on 0.02%, in 1.0 times  |
| 99.999%         | 12.925ms | 12.989ms | better: on 64µs, on 0.50%, in 1.0 times |
| Requests, count | 167047   | 165648   | more: 0.8% , in 1.0 times               |

For map there is no difference

### Bitmap Kelindar. 2 threads, 20 connections. Difference Report

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|359µs|378µs|better: on 19µs, on 5.29%, in 1.1 times |
|90%|716µs|754µs|better: on 38µs, on 5.31%, in 1.1 times |
|95%|821µs|865µs|better: on 44µs, on 5.36%, in 1.1 times |
|97%|879µs|926µs|better: on 47µs, on 5.35%, in 1.1 times |
|98%|917µs|967µs|better: on 50µs, on 5.45%, in 1.1 times |
|99%|979µs|1.031ms|better: on 52µs, on 5.31%, in 1.1 times , 1 order of magnitude|
|99.999%|16.995ms|18.582ms|better: on 1.587ms, on 9.34%, in 1.1 times |
|Requests, count|1602148|1522957|more: 5.2% , in 1.1 times |

There is 5% benefit in go1.17.6 compare to go 1.16, as expected [5%](https://go.dev/blog/go1.17)