# Optimizations

## Test

|Name|Description|
|---|---|
|Bulk. Stream. Unmarshal input data|Test|
|Bulk. Stream. Marshal output data|Test|
|Bulk. Gzip input|Test|
|Bulk. Gzip output|Test|
|Bulk. Concurrency Level|Test|
|Bulk. Long-Live Goroutines|For bulk cases to avoid goroutine creation. Can be used global or pool per call|
|GC|Tune|
|Protobuf instead of json|Json marshal and unmarshal is slow, check protobuf|
|Json codec libraries|Test|
|LRU|for Prices in case of bitmaps usage|
|Store intermediate bitmaps|Find the way to identify the best way from performance\memory perspective| 

