# Design & Research

## Pre-requisites
* All prices stored in another system
* There is small chance to influence the way how it is organized there

## Conditions
* `equals` - supported
* `not equals` - NOT supported (yet)
* `between` NOT supported (yet)
* `in` - NOT supported (yet)

## DataTypes
* string - supported
* integer - supported (as string and only for equals)
* date - NOT supported

## Limitations
* Amount of prices is limited to uint32 ~4.2billions

## Prices CRUD
CRUD - all operations should be supported and implemented, but there are some expectations that might be useful.
* Read (or search for price) - the most used operation
* Create - used operation
* Update - is for closing the date (end date). Other changes only for testing scenarios. 
* Delete - only for testing scenarios.

## Mapping

All attributes have their own Ids (externalIds), which are not integers. To be able to use it, it is required to create
internalId with types, like uint8, uint16 or uint32. As well, as mapping between an externalId and this internalId.
Whenever request comes - this mapping will be used to find internalId by externalId. InternalId will be
used to find related Bitmap.

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

### App: LRU Cache
Prices can use a lot of memory, to address that issue can be used LRU cache

### Ordering matters
For bitmaps important to order data to get the expected ones as close as possible.
It means that we need to sort indexId

### Improvement criterias (unordered)
1. Database Memory \ Disk Usage
1. Application Memory
1. Time to support & implement new requirements
1. Time to add/update/delete price in app (index)
1. Time to add/update/delete price in database
1. Scalability