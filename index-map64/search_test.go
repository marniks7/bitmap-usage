package indexmap64

import (
	cache64 "bitmap-usage/cache64"
	model64 "bitmap-usage/model64"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"os"
	"strconv"
	"testing"
)

func TestMapIndexService_Optimized_FindPriceBy(t *testing.T) {
	err := os.Setenv("TEST_OPTIMIZED", "true")
	assert.NoError(t, err)
	defer func() {
		err := os.Unsetenv("TEST_OPTIMIZED")
		assert.NoError(t, err)
	}()
	TestMapIndexService_FindPriceBy(t)
}

func TestMapIndexService_FindPriceBy(t *testing.T) {
	optimized := false
	optimizedEnv := os.Getenv("TEST_OPTIMIZED")
	if optimizedEnv != "" {
		r, err := strconv.ParseBool(optimizedEnv)
		optimized = r
		assert.NoError(t, err)
	}
	type fields struct {
		priceConditions []*model64.PriceCondition
		optimized       bool
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
				{ID: "id1", OfferingID: "offering1", GroupId: "group1", Spec: "spec1",
					Currency: "USD", Value: 100.00, Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}},
			}, optimized: optimized},
			args: args{offeringId: "offering1", groupId: "group1",
				specId: "spec1", charValues: []model64.CharValue{{"char1", "value1"}, {"char2", "value2"}}},
			want:  &model64.Price{Id: "id1", Spec: "spec1", Value: 100.00, Currency: "USD"},
			want1: nil,
			want2: 1,
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
	}

	isAtLeastOneOptimized := false
	isAtLeastOneNonOptimized := false
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			cs := cache64.NewCatalogService(log.Logger, cache64.NewCatalog(log.Logger))
			cs.Catalog = cache64.NewCatalog(log.Logger)
			cs.Catalog.PriceConditions = tt.fields.priceConditions
			ind := NewService(log.Logger)
			ind.IndexPrices(cs.Catalog)
			if tt.fields.optimized {
				isAtLeastOneOptimized = true
				_, err := ind.Optimize(cs.Catalog)
				assert.NoError(t, err)
			} else {
				isAtLeastOneNonOptimized = true
			}
			if isAtLeastOneOptimized && isAtLeastOneNonOptimized {
				assert.FailNow(t, "Found non-optimized and optimized tests at the same run. Forgot to add 'optimized' field to test?")
			}

			got, got1, got2 := ind.FindPriceBy(tt.args.offeringId, tt.args.groupId, tt.args.specId, tt.args.charValues)
			assert.Equal(t, tt.want, got)
			assert.Equal(t, tt.want1, got1)
			assert.Equal(t, tt.want2, got2)
		})
	}
}
