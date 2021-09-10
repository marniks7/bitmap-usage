# Status

* 2021/08/21:
  Project is still there, comes with updates and improvements
* 2021/06/23:
There are a lot of (too much) ideas around testing, benchmarking, improvements, functionality, this might be finished, might be not.
Who knows :)

## Bitmap implementations
|Name|External Link|Description|Status|
|---|---|---|---|
|[Roaring 32-bit](../index-roaring)|[roaring](https://github.com/RoaringBitmap/roaring)|This is the primary goal of this repo to test it|Fully supported|
|[Roaring 64-bit](../index-roaring64)|[roaring-64](https://github.com/RoaringBitmap/roaring/tree/master/roaring64)|Added for comparison to sroar and Pilosa|Occasionally supported|
|[Sroar](../index-sroar)|[Sroar](https://github.com/dgraph-io/sroar)|Second impression - huge degradation compared to `Roaring-64` bitmaps, but they promises and optimize only `FastOr` operation|Occasionally supported|
|[Kelindar Bitmap](../index-kelindar)|[SIMD Bitmap Kelindar](https://github.com/kelindar/bitmap)|Second impression - degradation compared to `Roaring-32` bitmaps, but not that huge with `sync.Pool` usage. Order of magnitude better then `map`|Occasionally supported|
|[Kelindar Column](../index-kelindar-column)|[Kelindar Column](https://github.com/kelindar/column)|Second impression - degradation compared to `Roaring-32` bitmaps, but it offers much more functionality, like transactions. Depends on the cases it has sense to try|Occasionally supported|
|[Bits and Blooms](../index-bits-and-blooms)|[Bits and Blooms](https://github.com/bits-and-blooms/bitset)|Degradation compared to `Roaring-32` bitmaps, and 2-3 times slower then Kelindar bitmaps|Occasionally supported|
|Pilosa|[Pilosa](https://github.com/pilosa/pilosa)|64 bit bitmaps|not yet implemented|

## Map implementation
|Name|Description|Status|
|---|---|---|
|[Map 32-bit](../index-map)|Used for comparison with bitmaps|Fully supported|
|[Map 64-bit](../index-map64)|Added for comparison with `Roaring-64` \ `sroar` \ `Pilosa` |Occasionally supported|

## Other
Bulk-mode not finished from performance perspective