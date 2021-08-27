# Status

* 2021/06/23:
There are a lot of (too much) ideas around testing, benchmarking, improvements, functionality, this might be finished, might be not.
Who knows :)
* 2021/08/21:
Project is still there, comes with updates and improvements

## Bitmap implementations
|Name|Description|Status|
|---|---|---|
|[Roaring 32-bit](../index-roaring)|This is the primary goal of this repo to test it| Fully supported|
|[Roaring 64-bit](../index-roaring64)|Added for comparison to sroar and Pilosa|Occasionally supported|
|[Sroar](../index-sroar)|First impression - huge degradation compared to `Roaring-64` bitmaps|Occasionally supported|
|Pilosa|64 bit bitmaps|not yet implemented|

## Map implementation
|Name|Description|Status|
|---|---|---|
|[Map 32-bit](../index-map)|Used for comparison with bitmaps|Fully supported|
|[Map 64-bit](../index-map64)|Added for comparison with `Roaring-64` \ `sroar` \ `Pilosa` |Occasionally supported|

## Other
Bulk-mode not finished from performance perspective