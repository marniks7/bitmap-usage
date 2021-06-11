# Benchmark
## Results
|Case|Bitmap|Map|Benefit|
|---|---|---|---|
|FindPrice|18246 ns/op|207368 ns/op|~11 times less, 1 order of magnitude|
|FindPrice_MapOptimized|18246 ns/op|75852 ns/op|~4 times less|
|FindPrice_HTTPClientServer*|95266 ns/op|351127 ns/op|~3.7 times less|

## Notes. Search based on simple map index
1. **BenchmarkMapOfferingIndex_FindPrice_Conditions8_3824position**
   * Search doesn't depend on element position and requires iteration over all elements
1. **BenchmarkMapOfferingIndex_FindPrice_Conditions8_3824position_Optimized**
   * Search optimized based on data specifics, and this is when search stops on price position.
      Worst case scenario is the same as for non-optimized benchmark
1. **BenchmarkMapOfferingIndex_FindPrice_Conditions8_MultiplePricesErr_Optimized**
   * Search prices when not all conditions specified, so there are multiple prices found.
     This test shows (as expected) that such search requires iteration over all elements

### Notes. HTTP Client Server
Includes send request, read response, unmarshal and test library validations that no errors.
This adds 77020 ns/op for bitmap and 143759 ns/op for map index. Such difference in overhead is unclear, 
cause the code is the same. This benchmark requires deeper investigation to properly interpret results.