# Optimizations

## Applied
|Name|Description|
|---|---|
|Bitmap|Bitmap usage itself is optimization compare to map usage|
|GC|Bitmap creates high pressure on GC. Now used GOGC=1000, otherwise there is huge performance degradation for 9X % percentiles|
|Templates|This is optimization for map based on the data - allows to stop iteration earlier.

## Test

|Name|Description|
|---|---|
|Bulk. Stream. Unmarshal input data|Test|
|Bulk. Stream. Marshal output data|Test|
|Bulk. Gzip input|Test|
|Bulk. Gzip output|Test|
|Bulk. Concurrency Level|Test|
|Bulk. Long-Live Goroutines|For bulk cases to avoid goroutine creation. Can be used global or pool per call|
|Bulk. Group|There are a lot of cases when the data for bulk is the same. Is it possible somehow to group it?|
|GC|Tune|
|Protobuf instead of json|Json marshal and unmarshal is slow, check protobuf|
|Json codec libraries|Test|
|LRU|for Prices in case of bitmaps usage|
|Store intermediate bitmaps|Find the way to identify the best way from performance\memory perspective| 
|Defragmentation for bitmaps|During updates bitmaps may become 'fragmented'. Test the influence of that|
|Map - default prices reordering|This is based on previous optimization for `templates`. It is known if request will target specific price or default. Reorder and place default in the beginning|
|Order of bitmap operations|Start from bitmap with smallest cardinality|