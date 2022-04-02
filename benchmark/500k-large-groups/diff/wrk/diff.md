### Timing (high level)
* 1 connection (1 processor)
* [map latest](../../map/wrk/map-t1-c1.txt)
* [bitmap latest](../../bitmap/wrk/bitmap-t1-c1.txt)

|Case|Bitmap, ns|Map, ns|Bitmap benefit|
|---|---|---|---|
|50%|33000|238000|86.13% better, in 7.2 times better, 1 order of magnitude|
|90%|43000|291000|85.22% better, in 6.8 times better, 1 order of magnitude|
|95%|48000|312000|84.62% better, in 6.5 times better, 1 order of magnitude|
|97%|54000|334000|83.83% better, in 6.2 times better, 1 order of magnitude|
|98%|65000|352000|81.53% better, in 5.4 times better, 1 order of magnitude|
|99%|92000|384000|76.04% better, in 4.2 times better, 1 order of magnitude|
|99.999%|6957000|3504000|-98.54% worth, in 0.5 times worth|
|Requests|819125|124246|559.3% more, in 6.6 times more|

### Timing (high level)
* 20 connections (2 processors)
* [map latest](../../map/wrk/map-t2-c20.txt)
* [bitmap latest](../../bitmap/wrk/bitmap-t2-c20.txt)

|Case|Bitmap, ns|Map, ns|Bitmap benefit|
|---|---|---|---|
|50%|251000|2104000|88.07% better, in 8.4 times better, 1 order of magnitude|
|90%|513000|4402000|88.35% better, in 8.6 times better, 1 order of magnitude|
|95%|590000|5210000|88.68% better, in 8.8 times better, 1 order of magnitude|
|97%|651000|5908000|88.98% better, in 9.1 times better, 1 order of magnitude|
|98%|721000|6567000|89.02% better, in 9.1 times better, 1 order of magnitude|
|99%|967000|8384000|88.47% better, in 8.7 times better, 1 order of magnitude|
|99.999%|19614000|38047000|48.45% better, in 1.9 times better|
|Requests|2292894|273779|737.5% more, in 8.4 times more|
