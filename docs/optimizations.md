# Optimizations

## Applied
|Name|Description|Status|
|---|---|---|
|Bitmap|Bitmap usage itself is optimization compare to map usage|Done|
|GC|Bitmap creates high pressure on GC, especially for 9X percentiles|GOGC=1000 used. 2021.07.16: after issue fix GC pressure drops, so GOGC can be decreased|
|Templates. Map|This is optimization for map based on the data - allows to stop iteration earlier.|[Optimize](../index-map/optimization.go)|
|Fiber usage|Standard go http server is not that performant|[Fiber](https://github.com/gofiber/fiber) makes huge difference| 
|Order of bitmap operations|Start from bitmap with smallest cardinality, join smallest|[OptimizeBuildStats](../index-roaring/optimization.go). Next level - `Database Optimizer Statistics`|

## Test

|Name|Description|Status|
|---|---|---|
|Bulk. Stream. Unmarshal input data|Test|
|Bulk. Stream. Marshal output data|Test|
|Bulk. Gzip input|Test|
|Bulk. Gzip output|Test|
|Bulk. Concurrency Level|Test|
|Bulk. Long-Live Goroutines|Test: for bulk cases to avoid goroutine creation. Can be used global or pool per call|
|Bulk. Group|There are a lot of cases when the data for bulk is the same. Is it possible somehow to group it?|
|GC|Tune|
|Protobuf instead of json|[Bench. Grpc-protobuf vs http-json](https://github.com/plutov/benchmark-grpc-protobuf-vs-http-json)|
|Json codec libraries|Test|
|LRU|for Prices in case of bitmaps usage|
|Store intermediate bitmaps|Find the way to identify the best way from performance\memory perspective|
|Defragmentation for bitmaps|During updates bitmaps may become 'fragmented'. Test the influence of that|
|Map - default prices reordering|This is based on previous optimization for `templates`. It is known if request will target specific price or default. Reorder and place default in the beginning|
|Avoid price marshaling|We can try to store bytes directly to avoid marshaling|
|Database Optimizer Statistics|Research & implement Oracle's Optimizer|Primitive version in [OptimizeBuildStats](../index-roaring/optimization.go)|
|GPU|Research GPU usage|It looks like too much for such a small data size and has sense to test it only with other data|
|New hardware|Test on more powerful CPU||
|SIMD and simple bitset|Test https://github.com/kelindar/bitmap||
|Go generate code|Examples https://banzaicloud.com/blog/generating-go-code/|Whenever required|
|Shared code. Sync pool| |Whenever required, like json encoder\decoder, etc|