### Timing (high level)
* 1 connection (1 processor)
* [map latest](../../map/wrk/map-t1-c1.txt)
* [bitmap latest](../../bitmap/wrk/bitmap-t1-c1.txt)

|Case|Bitmap, ns|Map, ns|Bitmap benefit|
|---|---|---|---|
|50%|35000|398000|91.21% better, in 11.4 times better, 1 order of magnitude|
|90%|45000|499000|90.98% better, in 11.1 times better, 1 order of magnitude|
|95%|50000|581000|91.39% better, in 11.6 times better, 1 order of magnitude|
|97%|58000|629000|90.78% better, in 10.8 times better, 1 order of magnitude|
|98%|71000|669000|89.39% better, in 9.4 times better, 1 order of magnitude|
|99%|96000|742000|87.06% better, in 7.7 times better, 1 order of magnitude|
|99.999%|8432000|3413000|-147.06% worth, in 0.4 times worth|
|Requests|776656|71628|984.3% more, in 10.8 times more|

### Timing (high level)
* 20 connections (2 processors)
* [map latest](../../map/wrk/map-t2-c20.txt)
* [bitmap latest](../../bitmap/wrk/bitmap-t2-c20.txt)

|Case|Bitmap, ns|Map, ns|Bitmap benefit|
|---|---|---|---|
|50%|265000|3372000|92.14% better, in 12.7 times better, 1 order of magnitude|
|90%|543000|6483000|91.62% better, in 11.9 times better, 1 order of magnitude|
|95%|627000|7467000|91.60% better, in 11.9 times better, 1 order of magnitude|
|97%|697000|8045000|91.34% better, in 11.5 times better, 1 order of magnitude|
|98%|766000|8448000|90.93% better, in 11.0 times better, 1 order of magnitude|
|99%|938000|9279000|89.89% better, in 9.9 times better, 1 order of magnitude|
|99.999%|19125000|24544000|22.08% better, in 1.3 times better|
|Requests|2162854|177380|1119.3% more, in 12.2 times more|
