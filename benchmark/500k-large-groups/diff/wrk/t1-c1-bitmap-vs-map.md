### Difference Report
Case1: benchmark/500k-large-groups/bitmap/wrk/json/bitmap-t1-c1.json
Case2: benchmark/500k-large-groups/map/wrk/json/map-t1-c1.json

|Percentile|Case1|Case2|Case1 vs Case2|
|---|---|---|---|
|50%|33µs|238µs|better: on 205µs, on 621.21%, in 7.2 times , 1 order of magnitude|
|90%|43µs|291µs|better: on 248µs, on 576.74%, in 6.8 times , 1 order of magnitude|
|95%|48µs|312µs|better: on 264µs, on 550.00%, in 6.5 times , 1 order of magnitude|
|97%|54µs|334µs|better: on 280µs, on 518.52%, in 6.2 times , 1 order of magnitude|
|98%|65µs|352µs|better: on 287µs, on 441.54%, in 5.4 times , 1 order of magnitude|
|99%|92µs|384µs|better: on 292µs, on 317.39%, in 4.2 times , 1 order of magnitude|
|99.999%|6.957ms|3.504ms|worth: on 3.453ms, on -49.63%, in 0.5 times |
|Requests, count|819125|124246|more: 559.3% , in 6.6 times |
