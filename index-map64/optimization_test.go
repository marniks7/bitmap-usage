package indexmap64

import (
	cache64 "bitmap-usage/cache64"
	model64 "bitmap-usage/model64"
	"github.com/jinzhu/copier"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestMapIndexService_Optimize(t *testing.T) {
	type fields struct {
		Index               map[string][]*model64.PriceCondition
		OfferingToCharIndex map[string]map[string]uint16
	}
	type args struct {
		catalog *cache64.Catalog
	}

	//given
	pc1 := &model64.PriceCondition{OfferingID: "offering1", Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}}
	pc2 := &model64.PriceCondition{OfferingID: "offering1", Chars: []string{"char2", "char1"}, Values: []string{"value2", "value1"}}
	pc3 := &model64.PriceCondition{OfferingID: "offering1", Chars: []string{"char3"}, Values: []string{"value3"}}

	pc1Expected := &model64.PriceCondition{OfferingID: "offering1", Chars: []string{"char1", "char2", ""}, Values: []string{"value1", "value2", ""}}
	pc3Expected := &model64.PriceCondition{OfferingID: "offering1", Chars: []string{"", "", "char3"}, Values: []string{"", "", "value3"}}

	pc4 := &model64.PriceCondition{OfferingID: "offering2", Chars: []string{"char3", "char4"}, Values: []string{"value3", "value4"}}
	pc5 := &model64.PriceCondition{OfferingID: "offering2", Chars: []string{"char4", "char3"}, Values: []string{"value4", "value3"}}

	tests := []struct {
		name            string
		expected        fields
		args            args
		expectedCatalog args
		wantErr         bool
	}{
		{name: "Index is built. One price",
			expected: fields{OfferingToCharIndex: map[string]map[string]uint16{"offering1": {"char1": 0, "char2": 1}}},
			args:     args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1)}}},
		},
		{name: "Index is built. Two prices",
			expected: fields{OfferingToCharIndex: map[string]map[string]uint16{"offering1": {"char1": 0, "char2": 1}}},
			args:     args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1), Copy(pc2)}}},
		},
		{name: "Index is built. Not templates",
			expected: fields{OfferingToCharIndex: map[string]map[string]uint16{"offering1": {"char1": 0, "char2": 1, "char3": 2}}},
			args:     args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1), Copy(pc3)}}},
		},
		{name: "Catalog Chars and Values Reordered",
			expected:        fields{OfferingToCharIndex: map[string]map[string]uint16{"offering1": {"char1": 0, "char2": 1}}},
			args:            args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1), Copy(pc2)}}},
			expectedCatalog: args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1), Copy(pc1)}}},
		},
		{name: "Catalog Chars and Values Reordered. Not templates",
			expected:        fields{OfferingToCharIndex: map[string]map[string]uint16{"offering1": {"char1": 0, "char2": 1, "char3": 2}}},
			args:            args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1), Copy(pc2), Copy(pc3)}}},
			expectedCatalog: args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1Expected), Copy(pc1Expected), Copy(pc3Expected)}}},
		},
		{name: "Few Offerings. Index",
			expected: fields{OfferingToCharIndex: map[string]map[string]uint16{"offering1": {"char1": 0, "char2": 1, "char3": 2},
				"offering2": {"char3": 0, "char4": 1}}},
			args: args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1), Copy(pc2), Copy(pc3), Copy(pc4), Copy(pc5)}}},
			//expectedCatalog: args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1), Copy(pc1), Copy(pc1), Copy(pc4), Copy(pc4)}}},
		},
		{name: "Few Offerings. Catalog",
			args:            args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1), Copy(pc2), Copy(pc3), Copy(pc4), Copy(pc5)}}},
			expectedCatalog: args{&cache64.Catalog{PriceConditions: []*model64.PriceCondition{Copy(pc1Expected), Copy(pc1Expected), Copy(pc3Expected), Copy(pc4), Copy(pc4)}}},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			s := &MapIndexService{
				Index:               tt.expected.Index,
				OfferingToCharIndex: tt.expected.OfferingToCharIndex,
			}
			if _, err := s.Optimize(tt.args.catalog); (err != nil) != tt.wantErr {
				t.Errorf("Optimize() error = %v, wantErr %v", err, tt.wantErr)
			}
			if tt.expected.OfferingToCharIndex != nil {
				assert.Equal(t, tt.expected.OfferingToCharIndex, s.OfferingToCharIndex)
			}
			if tt.expectedCatalog.catalog != nil {
				assert.Equal(t, tt.expectedCatalog.catalog, tt.args.catalog)
			}
		})
	}
}

func Copy(condition *model64.PriceCondition) *model64.PriceCondition {
	var pc4 model64.PriceCondition
	err := copier.CopyWithOption(&pc4, &condition, copier.Option{IgnoreEmpty: true, DeepCopy: true})
	if err != nil {
		log.Err(err)
		return nil
	}
	return &pc4
}
