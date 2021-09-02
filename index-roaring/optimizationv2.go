package indexroaring

// BitmapOptimizerStatistic is simple analog of database's Optimizer Statistic
type BitmapOptimizerStatisticV2 struct {
	KeyValueStatistic map[string]map[string]uint64
}

func (s *Holder) RunOptimize() error {
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
func (s *Holder) RunOptimizeBasedOnStats() (*BitmapOptimizerStatisticV2, error) {
	stats := make(map[string]map[string]uint64, len(s.FieldsMetadata))
	for k, v := range s.FieldsMetadata {
		stats[k] = make(map[string]uint64, len(v.Values))
		for k2, v2 := range v.Values {
			row := s.Index.Rows[v2]
			if row != nil {
				stats[k][k2] = row.segments[0].bitmap.GetCardinality()
			}
		}
	}

	s.StatisticOptimizer = &BitmapOptimizerStatisticV2{KeyValueStatistic: stats}
	return s.StatisticOptimizer, nil
}

// RunOptimizeBitmapsInternalStructure change internal roaring bitmap containers to whatever is better for memory.
// In most cases it means faster access bitmap operations
//
// However it is not always true, that is why check benchmarks and\or add more
// Make sure there are fewer allocations, otherwise it can cave huge impact on real testing with memory constraints
func (s *Holder) RunOptimizeBitmapsInternalStructure() error {
	for _, sb := range s.Index.Rows {
		sb.segments[0].bitmap.RunOptimize()
	}
	return nil
}
