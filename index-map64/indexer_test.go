package indexmap64

import (
	cache64 "bitmap-usage/cache64"
	model64 "bitmap-usage/model64"
	"github.com/rs/zerolog"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestMapIndexService_IndexPrices(t *testing.T) {
	type fields struct {
		L                                        zerolog.Logger
		Index                                    map[string][]*model64.PriceCondition
		OfferingsPriceImpactingCharsOptimization map[string][]string
	}
	type args struct {
		catalog *cache64.Catalog
	}

	//given
	pc1 := &model64.PriceCondition{OfferingID: "offering1", GroupId: "group1", Spec: "MRC",
		Currency: "USD", Chars: []string{"test1", "test2"}}
	pc2 := &model64.PriceCondition{OfferingID: "offering1", GroupId: "group2", Spec: "MRC",
		Currency: "USD", Chars: []string{"test1", "test2"}}

	pc3 := &model64.PriceCondition{OfferingID: "offering2", GroupId: "group1", Spec: "MRC",
		Currency: "USD", Chars: []string{"test1", "test2"}}
	pc4 := &model64.PriceCondition{OfferingID: "offering2", GroupId: "group2", Spec: "MRC",
		Currency: "USD", Chars: []string{"test1", "test2"}}

	tests := []struct {
		name     string
		expected fields
		args     args
	}{
		{name: "findPrice_GroupedByOffering_One",
			args:     args{catalog: &cache64.Catalog{PriceConditions: []*model64.PriceCondition{pc1, pc2}}},
			expected: fields{Index: map[string][]*model64.PriceCondition{"offering1": {pc1, pc2}}},
		},
		{name: "findPrice_GroupedByOffering_Two",
			args: args{catalog: &cache64.Catalog{PriceConditions: []*model64.PriceCondition{pc1, pc2, pc3, pc4}}},
			expected: fields{Index: map[string][]*model64.PriceCondition{"offering1": {pc1, pc2},
				"offering2": {pc3, pc4}}},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			s := &MapIndexService{
				L: tt.expected.L,
			}
			s.IndexPrices(tt.args.catalog)
			assert.Equal(t, tt.expected.Index, s.Index)
		})
	}
}
