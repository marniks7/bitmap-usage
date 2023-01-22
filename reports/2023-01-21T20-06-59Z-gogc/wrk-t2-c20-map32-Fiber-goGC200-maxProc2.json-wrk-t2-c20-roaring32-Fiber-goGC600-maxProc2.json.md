### Difference Report
Case1: wrk-t2-c20-map32-Fiber-goGC200-maxProc2.json
Case2: wrk-t2-c20-roaring32-Fiber-goGC600-maxProc2.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|3.572ms|267µs|worth: on 3.305ms, on -92.53%, in 0.1 times , -1 order of magnitude|
|90%|7.055ms|554µs|worth: on 6.501ms, on -92.15%, in 0.1 times , -1 order of magnitude|
|95%|8.162ms|646µs|worth: on 7.516ms, on -92.09%, in 0.1 times , -1 order of magnitude|
|97%|8.682ms|749µs|worth: on 7.933ms, on -91.37%, in 0.1 times , -1 order of magnitude|
|98%|9.031ms|886µs|worth: on 8.145ms, on -90.19%, in 0.1 times , -1 order of magnitude|
|99%|9.464ms|1.545ms|worth: on 7.919ms, on -83.67%, in 0.2 times |
|99.999%|11.692ms|13.086ms|better: on 1.394ms, on 11.92%, in 1.1 times |
|Requests, count|163501|2098189|less: -92.2% , in 0.1 times |
