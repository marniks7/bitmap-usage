### Timing (high level)
* 1 connection (1 processor)
* [map latest](../../map/wrk/map-t1-c1.txt)
* [bitmap latest](../../bitmap/wrk/bitmap-t1-c1.txt)

|Case|Bitmap, ns|Map, ns|Bitmap benefit|
|---|---|---|---|
|50%|34000|239000|85.77% better, in 7.0 times better, 1 order of magnitude|
|90%|40000|295000|86.44% better, in 7.4 times better, 1 order of magnitude|
|95%|43000|324000|86.73% better, in 7.5 times better, 1 order of magnitude|
|97%|47000|344000|86.34% better, in 7.3 times better, 1 order of magnitude|
|98%|54000|368000|85.33% better, in 6.8 times better, 1 order of magnitude|
|99%|88000|395000|77.72% better, in 4.5 times better, 1 order of magnitude|
|99.999%|7840000|5586000|-40.35% worth, in 0.7 times worth|
|Requests|828607|124128|567.5% more, in 6.7 times more|

### Timing (high level)
* 20 connections (2 processors)
* [map latest](../../map/wrk/map-t2-c20.txt)
* [bitmap latest](../../bitmap/wrk/bitmap-t2-c20.txt)

|Case|Bitmap, ns|Map, ns|Bitmap benefit|
|---|---|---|---|
|50%|240000|1780000|86.52% better, in 7.4 times better, 1 order of magnitude|
|90%|485000|3476000|86.05% better, in 7.2 times better, 1 order of magnitude|
|95%|555000|4008000|86.15% better, in 7.2 times better, 1 order of magnitude|
|97%|607000|4254000|85.73% better, in 7.0 times better, 1 order of magnitude|
|98%|662000|4427000|85.05% better, in 6.7 times better, 1 order of magnitude|
|99%|800000|4665000|82.85% better, in 5.8 times better, 1 order of magnitude|
|99.999%|18382000|10167000|-80.80% worth, in 0.6 times worth|
|Requests|2415621|333418|624.5% more, in 7.2 times more|
