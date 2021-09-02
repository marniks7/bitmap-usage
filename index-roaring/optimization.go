package indexroaring

type OptimizationType int

const (
	BitmapStructure    OptimizationType = iota + 1 // BitmapStructure = 1
	OptimizerStatistic                             // OptimizerStatistic = 2
)

// BitmapOptimizerStatistic is simple analog of database's Optimizer Statistic
type BitmapOptimizerStatistic struct {
	OfferingStatistic  map[string]uint64
	SpecStatistic      map[string]uint64
	GroupStatistic     map[string]uint64
	DefaultStatistic   uint64
	CharValueStatistic map[string]map[string]uint64
}

func (s *BitmapIndexService) RunOptimize() error {
	err := s.RunOptimizeBitmapsInternalStructure()
	if err != nil {
		return err
	}
	_, err = s.RunOptimizeBasedOnStats()
	return err
}

// RunOptimizeBasedOnStats the idea of this optimization is Database Optimizer Statistics.
// First selection - find bitmap with the smallest cardinality
// First join - make sure that result of join between first bitmap and second
//		will give the smallest cardinality
// This second criteria is partially true, because performance depends on roaring container type as well
//
// This is v1 alpha - it assumes that join smallest with smallest will give the best results.
//
// Example based on restaurants:
// 1) Michelin 3-star restaurants
// 2) Location - Europe, North America, South America...
// 3) Price
//
// Approach:
// 1) Michelin 3-star: will give 132 restaurants in the world, so this first criteria is absolute leader
// 2) Price: depends on the input data, there might be few very expensive restaurants (so, it could be better than Michelin criteria)
// 3) Location: in case if it is South America - there are no Michelin (0). So it is our best first join
//	If Europe or North America - it depends on other criterias.
func (s *BitmapIndexService) RunOptimizeBasedOnStats() (*BitmapOptimizerStatistic, error) {
	offeringStatistic := make(map[string]uint64)
	for k, v := range s.Index.OfferingIdToIndex {
		offeringStatistic[k] = s.Index.OfferingBitmaps[v].GetCardinality()
	}

	specStatistic := make(map[string]uint64)
	for k, v := range s.Index.SpecIdToIndex {
		specStatistic[k] = s.Index.SpecBitmaps[v].GetCardinality()
	}

	groupStatistic := make(map[string]uint64)
	for k, v := range s.Index.GroupIdIndex {
		groupStatistic[k] = s.Index.GroupBitmaps[v].GetCardinality()
	}

	charValueStatistic := make(map[string]map[string]uint64)
	for k, v := range s.Index.CharsToValuesIndex {
		charValueStatistic[k] = make(map[string]uint64, len(v))
		for a, c := range v {
			charValueStatistic[k][a] = s.Index.CharValuesBitmaps[c].GetCardinality()
		}
	}

	defaultStatistic := s.Index.DefaultBitmaps.GetCardinality()

	b := &BitmapOptimizerStatistic{OfferingStatistic: offeringStatistic,
		SpecStatistic:      specStatistic,
		GroupStatistic:     groupStatistic,
		CharValueStatistic: charValueStatistic, DefaultStatistic: defaultStatistic}
	s.Index.StatisticOptimizer = b
	return b, nil
}

// RunOptimizeBitmapsInternalStructure change internal roaring bitmap containers to whatever is better for memory.
// In most cases it means faster access bitmap operations
//
// However it is not always true, that is why check benchmarks and\or add more
// Make sure there are fewer allocations, otherwise it can cave huge impact on real testing with memory constraints
func (s *BitmapIndexService) RunOptimizeBitmapsInternalStructure() error {
	for _, sb := range s.Index.SpecBitmaps {
		sb.RunOptimize()
	}
	for _, sb := range s.Index.OfferingBitmaps {
		sb.RunOptimize()
	}
	for _, sb := range s.Index.GroupBitmaps {
		sb.RunOptimize()
	}
	for _, sb := range s.Index.CharValuesBitmaps {
		sb.RunOptimize()
	}
	s.Index.DefaultBitmaps.RunOptimize()
	return nil
}
