package indexMap

import (
	"bitmap-usage/cache"
	"bitmap-usage/index-roaring"
	"bitmap-usage/model"
	"bitmap-usage/sample"
	"bitmap-usage/validator"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestFindPrice(t *testing.T) {
	//given
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	//when
	price, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	//then
	log.Info().Int("position", position).Msg("Found price on")
	assert.NoError(t, err)
	assert.NotNil(t, price)
}

func TestFindPrice_MultipleFound(t *testing.T) {
	//given
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	//when
	price, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"}})

	//then
	assert.Error(t, err)
	assert.ErrorIs(t, err, ErrUnableToFindPriceMoreThenOneNoDefault)
	assert.Nil(t, price)
	assert.Equal(t, -1, position)
}
func TestFindPrice_NotFoundChar(t *testing.T) {
	//given
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	//when
	price, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN2", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	//then
	assert.Error(t, err)
	assert.ErrorIs(t, err, ErrUnableToFindPrice)
	assert.Nil(t, price)
	assert.Equal(t, -1, position)
}

func TestFindPriceWhenOptimized(t *testing.T) {
	//given
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)
	err = validator.Validate(cs.Catalog)
	assert.NoError(t, err)
	quality, err := ind.Optimize(cs.Catalog)
	assert.NoError(t, err)
	assert.Equal(t, 100.00, quality)

	//when
	price, err, position := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	//then
	log.Info().Int("position", position).Msg("Found price on")
	assert.NoError(t, err)
	assert.NotNil(t, price)
}

func TestFindPriceCompareSearches(t *testing.T) {
	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
	err := sample.GenerateTestData5Chars5Offerings(cs)
	assert.NoError(t, err)

	ind := NewService(log.Logger)
	ind.IndexPrices(cs.Catalog)

	price, err, _ := ind.FindPriceBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	assert.NoError(t, err)
	assert.NotNil(t, price)

	priceMapIndex := cs.Catalog.Prices[price.ID]

	indBitmap := index_roaring.NewService(log.Logger)
	indBitmap.IndexPrices(cs.Catalog)

	priceBitmapIndex, err := indBitmap.FindPriceIndexBy("00d3a020-08c4-4c94-be0a-e29794756f9e", "Default", "MRC",
		[]model.CharValue{{"Term", "24"},
			{"B2B Traffic", "5GB"},
			{"B2B Bandwidth", "900Mbps"},
			{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
			{"Router", "Not Included"}})

	assert.NoError(t, err)
	assert.NotZero(t, priceBitmapIndex)

	priceId, err := indBitmap.FindPriceIdByIndex(priceBitmapIndex)
	priceBitmap := cs.Catalog.Prices[priceId]

	assert.Equal(t, priceBitmap, priceMapIndex)
}

//func TestMapIndexService_FindPriceBy(t *testing.T) {
//	cs := cache.NewCatalogService(log.Logger, cache.NewCatalog(log.Logger))
//	err := sample.GenerateTestData5Chars5Offerings(cs)
//	assert.NoError(t, err)
//
//	ind := NewService(log.Logger)
//	ind.IndexPrices(cs.Catalog)
//
//	type args struct {
//		offeringId string
//		groupId    string
//		specId     string
//		charValues []model.CharValue
//	}
//	tests := []struct {
//		name   string
//		fields *MapIndexService
//		args   args
//		want   *model.PriceCondition
//		want1  error
//		want2  int
//	}{
//		{
//			name:   "Find Price. Single price found",
//			fields: ind,
//			args: args{offeringId: "00d3a020-08c4-4c94-be0a-e29794756f9e", groupId: "Default",
//				specId: "MRC", charValues: []model.CharValue{{"Term", "24"},
//					{"B2B Traffic", "5GB"},
//					{"B2B Bandwidth", "900Mbps"},
//					{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
//					{"Router", "Not Included"}}},
//			want: &model.PriceCondition{OfferingID: "00d3a020-08c4-4c94-be0a-e29794756f9e",
//				GroupId: "Default", Spec: "MRC", Chars: []string{"Term",
//					"B2B Traffic", "VPN", "B2B Bandwidth", "Router"},
//				Values: []string{"24", "5GB", "900Mbps", "5739614e-6c52-402c-ba3a-534c51b3201a",
//					"Not Included"}},
//			want1: nil,
//			want2: 3824,
//		},
//	}
//	for _, tt := range tests {
//		t.Run(tt.name, func(t *testing.T) {
//			ind := &MapIndexService{
//				L:                   tt.fields.L,
//				Index:               tt.fields.Index,
//				OfferingToCharIndex: tt.fields.OfferingToCharIndex,
//			}
//			got, got1, got2 := ind.FindPriceBy(tt.args.offeringId, tt.args.groupId, tt.args.specId, tt.args.charValues)
//			assert.Equal(t, tt.want, got)
//			assert.Equal(t, tt.want1, got1)
//			assert.Equal(t, tt.want2, got2)
//		})
//	}
//}
