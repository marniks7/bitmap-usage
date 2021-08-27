# Design & Research

## Into
Source system stores all prices. The task for this service - provide ability to find price.

This search depends on many conditions, like start date \ end date, offering, 
characteristics like Internet Bandwidth, Contract Term, etc., some grouping criterias.
This search is one of many other tasks we need to execute during typical flow.
All the tasks (including current one - find price) is synchronous from end-user perspective: 
it waits for the results right away.

## Requirements
## Functional
* Find price by conditions
* Few prices could be found in case when not all conditions known
* There is always one price when all conditions satisfied

### Condition Operations
* `equals`
* `not equals`
* `between`
* `in`
* `not in`

### Condition Data Types
* `string` (list value)
* `integer`
* `date` (YYYY.MM.DD HH)
  * Minutes support is a question

### Non-Functional Requirements
* The amount of prices is `<2M`.
* The amount of conditions `<20`
* The amount of prices per offering: `<20k`
* Time limitation `<10ms` for each search
* Time limitation for `3k` searches `<100ms`
  * Preferable to get `<10ms`
* Memory limitation: `<1 GB` for all prices in memory
  * `<500 byte` per price
* Requests\s is not specified. `2000/s ?`
  * It should be possible to run more instances of this service

## Design

The typical implementation of such search is simple iteration over the prices - `O(2M)` worst case.
To avoid such a terrible time complexity can be used `HashMap` by one of conditions.
The most promising condition for `HashMap` is `Offering`. This might not be the best one for all cases,
but best in common. It will be `O(20k)` worst case. It is very simple approach and might be enough 
to satisfy initial requirements. 
However, what about cases when user needs to calculate 3k searches in one request?
Parallel calculation might help, but is it possible to drop timing <100ms (when CPU is limited)?!
One option is to support keys with few conditions or dynamically 1 to n-conditions. Possible drawback is
blowing the memory.
That is when I discovered bitmaps and this entire repository is about comparing bitmaps and regular maps.

## Bitmaps v1 - test

All prices have their own ids ( `externalIds` ), which are strings, not integers. To be able to use them in bitmaps, 
it is required to create `internalId` with data types, like `uint8`, `uint16`, `uint32` or `uint64`,
and mapping `internalId -> externalId`, like `[]string`.

Each attribute-value combination is stored in separate bitmap. In request attribute-value might look like this
`Bandwidth equals 200Mbps`. `Bandwidth` and `200Mbps` here will be used to find `bitmap index` first and then
bitmap itself. As a result we need to maintain hashmap `map[string]uintX`, 
where count of values in such hashmap is `av` - amount of unique combinations attribute-value.
And perform `O(v)` calls to hashmap to find `bitmap index(es)`, 
where `v` is amount of values in request. As per requirement, `v < 20`. 
After that `O(v)` calls to find bitmaps from `[]*Bitmap`.
Next is bitmap operations for all bitmaps, like `equals` ~ `AND` between bitmaps.
The result is price's `internalId` . This is where `[]string` can be used to find price's `externalId`
It adds `O(1)`. By `externalId` use hashmap to get real price, which adds `O(1)`, like `map[string]*Price`.

`Time complexity`
  * `Time complexity = O(v) + O(v) + O(1) + O(1)`
  * This can be grouped by hashmap usage vs array usage `= O(v+1) + O(v+1)`
  * I would prefer to skip one `O(v+1)` cause it uses array for search with a constant time and no computations needed.
  * Result: `Time complexity = O(v+1)`

`Memory complexity = O(av) + O(n) + O(n)`,
  * `O(av)` is hashmap which covers attribute-value combinations to find `bitmap index`, `map[string]uintX`
  * First `O(n)` to store externalId by internalId `[]string`
  * Second `O(n)` to store `map[string]*Price`.

Notes:
* `map[string]uintX` should be created for each unique attribute or maintained `map[string]map[string]uintX`
  * `uintX` for each attribute can be different and this has sense 
     to support all options: `uint8`, `uint16`, `uint32` or `uint64` to save memory

## Bitmaps v2
It will add support for new condition operations and data types

TBD...

## Database Integration
### Attribute Index
It is possible to generate it ahead of indexer. For example, store in database. 
* Benefits
    * Stable
* Drawbacks
    * Bounded to that index in application. How bad is that?
  
Table: SpecToIndex

|id|external_id|
--- |--- |
|1|db108b38-04fa-41fd-a681-9e1ad3ae0fce|
|2|9ead77df-24d1-43e3-b39e-fdc806b7fc98|

### Global Attribute Index

|id|type|external_id|
--- |--- |--- |
|1|Spec|db108b38-04fa-41fd-a681-9e1ad3ae0fce|
|2|Spec|9ead77df-24d1-43e3-b39e-fdc806b7fc98|
|3|Group|c54a1b6e-03a6-469a-81b0-03ac77ce5d0|
|4|Default|true|
|5|Default|false|

from
```go
groupBitmaps      []*roaring.Bitmap
specBitmaps       []*roaring.Bitmap
offeringBitmaps   []*roaring.Bitmap
defaultBitmaps    *roaring.Bitmap
charBitmaps       []*roaring.Bitmap
charValuesBitmaps []*roaring.Bitmap
```

to 
```go
attributes []*roaring.Bitmap
```

### LRU Cache
Prices can use a lot of memory, to address that issue can be used LRU cache

### Ordering matters
For bitmaps important to order data to get the expected ones as close as possible.
It means that we need to sort indexId

## CRUD
CRUD - all operations should be supported and implemented, but there are some expectations that might be useful.
* Read (or search for price) - the most used operation
* Create - used operation
* Update - is for closing the date (end date). Other changes only for testing scenarios.
* Delete - only for testing scenarios.

### Improvement criterias (unordered)
1. Database Memory \ Disk Usage
1. Application Memory
1. Time to support & implement new requirements
1. Time to add/update/delete price in app (index)
1. Time to add/update/delete price in database
1. Scalability