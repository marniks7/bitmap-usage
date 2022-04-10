package indexroaring64

import (
	"bitmap-usage/benchmark/500k-large-groups/sample64"
	"bitmap-usage/cache64"
	"bitmap-usage/model64"
	"encoding/json"
	"github.com/stretchr/testify/assert"
	"os"
	"strconv"
	"strings"
	"testing"
)

func TestFindPriceId(t *testing.T) {
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	sampleService := sample64.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	ind := NewService()
	ind.IndexPrices(cs.Catalog)

	//f, err := os.Create("cpu.pprof")
	//if err != nil {
	//	assert.NoError(t, err)
	//}
	//defer f.Close() // error handling omitted for example
	//if err := pprof.StartCPUProfile(f); err != nil {
	//	assert.NoError(t, err)
	//}
	//defer pprof.StopCPUProfile()

	//for i := 0; i < 100000 ; i++ {
	priceIndex, err := ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "group2", "NRC",
		[]model64.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	assert.NoError(t, err)
	assert.NotZero(t, priceIndex)
	//}

	//f, err := os.Create("mem.pprof")
	//if err != nil {
	//	assert.NoError(t, err)
	//}
	//defer f.Close() // error handling omitted for example
	//runtime.GC() // get up-to-date statistics
	//if err := pprof.WriteHeapProfile(f); err != nil {
	//	assert.NoError(t, err)
	//}

	assert.NoError(t, err)
}

func TestFindPriceIdWithTraceInfo(t *testing.T) {
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	sampleService := sample64.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	ind := NewService()
	ind.IndexPrices(cs.Catalog)

	priceIndex, err, actual := ind.FindPriceIndexByWithTraceInfo("00d3a020-08c4-4c94-be0a-e29794756f9e", "group2", "NRC",
		[]model64.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	assert.NoError(t, err)
	assert.NotZero(t, priceIndex)

	assert.NoError(t, err)
	file, err := os.ReadFile("search-stats_test.json")
	assert.NoError(t, err)
	var expected BitmapSearchStatistic
	err = json.Unmarshal(file, &expected)
	assert.NoError(t, err)
	//marshal, err := json.MarshalIndent(actual, "", "   ")
	//assert.NoError(t, err)
	//err = os.WriteFile("search-stats_test.json", marshal, os.ModePerm)
	//assert.NoError(t, err)
	assert.Equal(t, expected, *actual)
}

func TestFindPrice(t *testing.T) {
	cs := cache64.NewCatalogService(cache64.NewCatalog())
	sampleService := sample64.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	ind := NewService()
	ind.IndexPrices(cs.Catalog)
	cs.GeneratePricesByConditions()

	priceIndex, err := ind.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "group2", "NRC",
		[]model64.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})
	assert.NoError(t, err)
	assert.NotZero(t, priceIndex)

	priceId, err := ind.FindPriceIdByIndex(priceIndex)
	assert.NoError(t, err)

	price := cs.Catalog.Prices[priceId]
	assert.NotNil(t, price)
}

func TestBitMapIndexService_Optimized_Structured_And_Stats(t *testing.T) {
	err := os.Setenv("TEST_OPTIMIZED", strconv.Itoa(int(BitmapStructure))+","+strconv.Itoa(int(OptimizerStatistic)))
	assert.NoError(t, err)
	defer func() {
		err := os.Unsetenv("TEST_OPTIMIZED")
		assert.NoError(t, err)
	}()
	TestFindPriceBy(t)
}

func TestBitMapIndexService_Optimized_Structure(t *testing.T) {
	err := os.Setenv("TEST_OPTIMIZED", strconv.Itoa(int(BitmapStructure)))
	assert.NoError(t, err)
	defer func() {
		err := os.Unsetenv("TEST_OPTIMIZED")
		assert.NoError(t, err)
	}()
	TestFindPriceBy(t)
}

func TestBitMapIndexService_Optimized_Statistic(t *testing.T) {
	err := os.Setenv("TEST_OPTIMIZED", strconv.Itoa(int(OptimizerStatistic)))
	assert.NoError(t, err)
	defer func() {
		err := os.Unsetenv("TEST_OPTIMIZED")
		assert.NoError(t, err)
	}()
	TestFindPriceBy(t)
}

//goland:noinspection GoBoolExpressions
func TestFindPriceBy(t *testing.T) {
	optimized := retrieveOptimizationTypes(t)
	type fields struct {
		priceConditions []*model64.PriceCondition
		optimized       []OptimizationType
	}
	type args struct {
		offeringId string
		groupId    string
		specId     string
		charValues []model64.CharValue
	}

	type test struct {
		name   string
		fields fields
		args   args
		want   *model64.Price
		want1  error
		want2  int
	}
	tests := []test{
		{
			name: "Find Price",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group1",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}}},
			want:  &model64.Price{Id: "id1", Spec: "spec1", Value: 100.00, Currency: "USD"},
			want1: nil,
			want2: 1,
		},
		{
			name: "Find Price. Not found. Char",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group1",
				specId: "spec1", charValues: []model64.CharValue{{"char2", "value1"}}},
			want:  nil,
			want1: ErrUnableToFindPrice,
			want2: -1,
		},
		{
			name: "Find Price. Not found. Value",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group1",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value2"}}},
			want:  nil,
			want1: ErrUnableToFindPrice,
			want2: -1,
		},
		{
			name: "Find Price. Not found. Group",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group2",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}}},
			want:  nil,
			want1: ErrUnableToFindPrice,
			want2: -1,
		},
		{
			name: "Find Price. Not found. Spec",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group1",
				specId: "spec2", charValues: []model64.CharValue{{"char1", "value1"}}},
			want:  nil,
			want1: ErrUnableToFindPrice,
			want2: -1,
		},
		{
			name: "Find Price. Not found. Offering",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
			}, optimized: optimized},
			args: args{offeringId: "offering2", groupId: "group1",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}}},
			want:  nil,
			want1: ErrUnableToFindPrice,
			want2: -1,
		},
		{
			name: "Find Price. Two chars",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id2", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 120.00, Chars: []string{"char1", "char2"}, Values: []string{"value1", "value3"}},
				{ID: "id3", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 140.00, Chars: []string{"char1", "char3"}, Values: []string{"value1", "value3"}},
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group1",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}, {"char2", "value2"}}},
			want:  &model64.Price{Id: "id1", Spec: "spec1", Value: 100.00, Currency: "USD"},
			want1: nil,
			want2: 3,
		},
		{
			name: "Find Price. Two chars. Not Found Second Char Key",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group1",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}, {"char3", "value2"}}},
			want:  nil,
			want1: ErrUnableToFindPrice,
			want2: -1,
		},
		{
			name: "Find Price. Two chars. Not Found Second Value Key",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group1",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}, {"char2", "value3"}}},
			want:  nil,
			want1: ErrUnableToFindPrice,
			want2: -1,
		},
		{
			name: "Find Price. Single price found amount two",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
				{ID: "id2", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 120.00, Chars: []string{"char1"}, Values: []string{"value1"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group2",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}}},
			want:  &model64.Price{Id: "id2", Spec: "spec1", Value: 120.00, Currency: "USD"},
			want1: nil,
			want2: 2,
		},
		{
			name: "Find Price. Not Found. Value from different char",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1", "char2"}, Values: []string{"value2", "value1"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group1",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}}},
			want:  nil,
			want1: ErrUnableToFindPrice,
			want2: -1,
		},
		{
			name: "Find Price. Test position",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
				{ID: "id2", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 120.00, Chars: []string{"char1"}, Values: []string{"value1"}},
				{ID: "id3", OfferingID: "offering1", GroupId: "group3", Spec: "spec1",
					Currency: "USD", Value: 140.00, Chars: []string{"char1"}, Values: []string{"value1"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group2",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}}},
			want:  &model64.Price{Id: "id2", Spec: "spec1", Value: 120.00, Currency: "USD"},
			want1: nil,
			want2: 2,
		},
		{
			name: "Find Price. Multiple Prices found. Search without chars",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
				{ID: "id2", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 120.00, Chars: []string{"char1"}, Values: []string{"value1"}},
				{ID: "id3", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 140.00, Chars: []string{"char1"}, Values: []string{"value2"}},
			}, optimized: optimized},
			args:  args{offeringId: "offering1", groupId: "group2", specId: "spec1"},
			want:  nil,
			want1: ErrUnableToFindPriceMoreThenOneNoDefault,
			want2: -1,
		},
		{
			name: "Find Price. Multiple Prices found. Search with chars",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}},
				{ID: "id2", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 120.00, Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}},
				{ID: "id3", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 140.00, Chars: []string{"char1", "char2"}, Values: []string{"value1", "value4"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group2",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}}},
			want:  nil,
			want1: ErrUnableToFindPriceMoreThenOneNoDefault,
			want2: -1,
		},
		{
			name: "Find Price. Default found amount multiple prices",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
				{ID: "id2", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 120.00, Chars: []string{"char1"}, Values: []string{"value1"}, IsDefault: true},
				{ID: "id3", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 140.00, Chars: []string{"char1"}, Values: []string{"value2"}},
			}, optimized: optimized},
			args:  args{offeringId: "offering1", groupId: "group2", specId: "spec1"},
			want:  &model64.Price{Id: "id2", Spec: "spec1", Value: 120, Currency: "USD"},
			want1: nil,
			want2: 2,
		},
		{
			name: "Find Price. First default found amount multiple default prices",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}},
				{ID: "id2", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 120.00, Chars: []string{"char1"}, Values: []string{"value1"}, IsDefault: true},
				{ID: "id3", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 140.00, Chars: []string{"char1"}, Values: []string{"value2"}, IsDefault: true},
			}, optimized: optimized},
			args:  args{offeringId: "offering1", groupId: "group2", specId: "spec1"},
			want:  &model64.Price{Id: "id2", Spec: "spec1", Value: 120, Currency: "USD"},
			want1: nil,
			want2: 2,
		},
		{
			name: "Find Price. Non applicable default is skipped",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"}, IsDefault: true},
				{ID: "id2", OfferingID: "offering1", GroupId: "group2", Spec: "spec1",
					Currency: "USD", Value: 120.00, Chars: []string{"char1"}, Values: []string{"value1"}, IsDefault: true},
			}, optimized: optimized},
			args:  args{offeringId: "offering1", groupId: "group2", specId: "spec1"},
			want:  &model64.Price{Id: "id2", Spec: "spec1", Value: 120, Currency: "USD"},
			want1: nil,
			want2: 2,
		},
		{
			name: "Find Price. No prices found on last stage before default",
			fields: fields{priceConditions: []*model64.PriceCondition{
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1"}, Values: []string{"value1"},
					IsDefault: true},
				{ID: "id2", OfferingID: "offering1", GroupId: "group1", Spec: "spec2",
					Currency: "USD", Value: 120.00, Chars: []string{"char1"}, Values: []string{"value1"},
					IsDefault: true},
				{ID: "id3", OfferingID: "offering2", GroupId: "group1", Spec: "spec3",
					Currency: "USD", Value: 140.00, Chars: []string{"char1"}, Values: []string{"value1"},
					IsDefault: true},
			}, optimized: optimized},
			args:  args{offeringId: "offering1", groupId: "group1", specId: "spec3"},
			want:  nil,
			want1: ErrUnableToFindPrice,
			want2: -1,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			cs := cache64.NewCatalogService(cache64.NewCatalog())
			cs.Catalog.PriceConditions = tt.fields.priceConditions

			ind := NewService()
			ind.IndexPrices(cs.Catalog)

			cs.GeneratePricesByConditionsAndClear()
			for i := 0; i < len(tt.fields.optimized); i++ {
				if tt.fields.optimized[i] == BitmapStructure {
					err := ind.RunOptimizeBitmapsInternalStructure()
					assert.NoError(t, err)
				} else if tt.fields.optimized[i] == OptimizerStatistic {
					_, err := ind.RunOptimizeBasedOnStats()
					assert.NoError(t, err)
				}
			}
			got, got1 := ind.FindPriceIndexBy(tt.args.offeringId, tt.args.groupId, tt.args.specId, tt.args.charValues)
			// workaround to be able to copy-paste tests from index-map without changes
			if got1 == ErrUnableToFindCharId || got1 == ErrUnableToFindCharValue || got1 == ErrUnableToFindGroupId ||
				got1 == ErrUnableToFindOfferingId || got1 == ErrUnableToFindSpecId {
				got1 = ErrUnableToFindPrice
			}
			assert.Equal(t, tt.want1, got1)
			if tt.want == nil {
				assert.Zero(t, got)
			} else {
				id, _ := ind.FindPriceIdByIndex(got)
				price := cs.Catalog.Prices[id]
				assert.Equal(t, tt.want, price)
			}
		})
	}
}

func retrieveOptimizationTypes(t *testing.T) []OptimizationType {
	optimizedEnv := os.Getenv("TEST_OPTIMIZED")
	var optimized []OptimizationType = nil
	if optimizedEnv != "" {
		split := strings.Split(optimizedEnv, ",")
		optimized = make([]OptimizationType, len(split), len(split))
		for i := 0; i < len(split); i++ {
			atoi, err := strconv.Atoi(split[i])
			assert.NoError(t, err)
			optimized[i] = OptimizationType(atoi)
		}
	}
	return optimized
}
