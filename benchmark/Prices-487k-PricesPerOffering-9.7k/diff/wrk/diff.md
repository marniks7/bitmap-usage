### Timing (high level)
* 1 connection (1 processor)
* [map latest](../../map/wrk/map-t1-c1.txt)
* [bitmap latest](../../bitmap/wrk/bitmap-t1-c1.txt)

|Case|Bitmap, ns|Map, ns|Bitmap benefit|
|---|---|---|---|
|50%|34000|395000|91.39% better, in 11.6 times better, 1 order of magnitude|
|90%|45000|541000|91.68% better, in 12.0 times better, 1 order of magnitude|
|95%|52000|647000|91.96% better, in 12.4 times better, 1 order of magnitude|
|97%|62000|747000|91.70% better, in 12.0 times better, 1 order of magnitude|
|98%|76000|848000|91.04% better, in 11.2 times better, 1 order of magnitude|
|99%|97000|1077000|90.99% better, in 11.1 times better, 2 order of magnitude|
|99.999%|7170000|9466000|24.26% better, in 1.3 times better|
|Requests|785931|70829|1009.6% more, in 11.1 times more|

### Timing (high level)
* 20 connections (2 processors)
* [map latest](../../map/wrk/map-t2-c20.txt)
* [bitmap latest](../../bitmap/wrk/bitmap-t2-c20.txt)

|Case|Bitmap, ns|Map, ns|Bitmap benefit|
|---|---|---|---|
|50%|270000|3299000|91.82% better, in 12.2 times better, 1 order of magnitude|
|90%|550000|6668000|91.75% better, in 12.1 times better, 1 order of magnitude|
|95%|635000|7694000|91.75% better, in 12.1 times better, 1 order of magnitude|
|97%|707000|8354000|91.54% better, in 11.8 times better, 1 order of magnitude|
|98%|781000|8968000|91.29% better, in 11.5 times better, 1 order of magnitude|
|99%|951000|10087000|90.57% better, in 10.6 times better, 2 order of magnitude|
|99.999%|20000000|21471000|6.85% better, in 1.1 times better|
|Requests|2138513|176831|1109.4% more, in 12.1 times more|
