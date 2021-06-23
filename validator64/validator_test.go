package validator64

import (
	cache64 "bitmap-usage/cache64"
	model64 "bitmap-usage/model64"
	"testing"
)

func TestValidate(t *testing.T) {
	type args struct {
		catalog *cache64.Catalog
	}
	pc1 := &model64.PriceCondition{OfferingID: "offering1", GroupId: "GroupId", Spec: "MRC",
		Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}}

	pcGroup := &model64.PriceCondition{OfferingID: "offering1", GroupId: "GroupId2", Spec: "MRC",
		Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}}

	pcSpec := &model64.PriceCondition{OfferingID: "offering1", GroupId: "GroupId", Spec: "MRC2",
		Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}}

	pcChar := &model64.PriceCondition{OfferingID: "offering1", GroupId: "GroupId", Spec: "MRC",
		Chars: []string{"char1", "char3"}, Values: []string{"value1", "value2"}}

	pcValue := &model64.PriceCondition{OfferingID: "offering1", GroupId: "GroupId", Spec: "MRC",
		Chars: []string{"char1", "char2"}, Values: []string{"value1", "value3"}}

	pcCharValueOrder := &model64.PriceCondition{OfferingID: "offering1", GroupId: "GroupId", Spec: "MRC",
		Chars: []string{"char2", "char1"}, Values: []string{"value2", "value1"}}

	pcOffering := &model64.PriceCondition{OfferingID: "offering2", GroupId: "GroupId", Spec: "MRC",
		Chars: []string{"char1", "char2"}, Values: []string{"value1", "value2"}}

	tests := []struct {
		name    string
		args    args
		wantErr bool
	}{
		{name: "One price",
			args:    args{catalog: &cache64.Catalog{PriceConditions: []*model64.PriceCondition{pc1}}},
			wantErr: false,
		},
		{name: "Two prices, not unique",
			args:    args{catalog: &cache64.Catalog{PriceConditions: []*model64.PriceCondition{pc1, pc1}}},
			wantErr: true,
		},
		{name: "Two prices, unique offering",
			args:    args{catalog: &cache64.Catalog{PriceConditions: []*model64.PriceCondition{pc1, pcOffering}}},
			wantErr: false,
		},
		{name: "Two prices, unique group",
			args:    args{catalog: &cache64.Catalog{PriceConditions: []*model64.PriceCondition{pc1, pcGroup}}},
			wantErr: false,
		},
		{name: "Two prices, unique spec",
			args:    args{catalog: &cache64.Catalog{PriceConditions: []*model64.PriceCondition{pc1, pcSpec}}},
			wantErr: false,
		},
		{name: "Two prices, unique char",
			args:    args{catalog: &cache64.Catalog{PriceConditions: []*model64.PriceCondition{pc1, pcChar}}},
			wantErr: false,
		},
		{name: "Two prices, unique char value",
			args:    args{catalog: &cache64.Catalog{PriceConditions: []*model64.PriceCondition{pc1, pcValue}}},
			wantErr: false,
		},
		{name: "Two prices, not unique char value order",
			args:    args{catalog: &cache64.Catalog{PriceConditions: []*model64.PriceCondition{pc1, pcCharValueOrder}}},
			wantErr: true,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if err := Validate(tt.args.catalog); (err != nil) != tt.wantErr {
				t.Errorf("Validate() error = %v, wantErr %v", err, tt.wantErr)
			}
		})
	}
}
