package sample

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
	"errors"
	"github.com/google/uuid"
)

var CharPool = []string{"Term", "B2C Bandwidth",
	"B2B Bandwidth",
	"Connection Type", "Port Bandwidth",
	"VPN", "Antivirus",
	"Router", "B2C Traffic", "B2B Traffic", "Access Point Traffic"}

var ValuePool = map[string][]string{
	"Term":                 {"12", "18", "24", "36", "48", "60"},
	"B2C Traffic":          {"1GB", "2GB", "5GB", "10GB", "20GB"},
	"B2B Traffic":          {"1GB", "2GB", "5GB", "10GB", "20GB", "50GB", "100GB"},
	"Access Point Traffic": {"1GB", "2GB", "5GB", "10GB", "20GB", "50GB", "100GB"},
	"Router":               {"Included", "Not Included"},
	"Antivirus":            {"ab13daf1-d379-4905-b640-39f4fb1ffd3e", "0736996d-dc7b-45f4-a601-efd92ff23e98"},
	"VPN": {"ad796998-f1c7-4fcc-9a6b-1b33042fb375",
		"5739614e-6c52-402c-ba3a-534c51b3201a", "a2fe7f64-405b-44be-93e2-04b803373582",
		"170954ea-687d-42d2-9c04-7807845c66ee"},
	"Port Bandwidth": {"100Mbps",
		"50Mbps",
		"1Gbps"},
	"Connection Type": {"Local", "Remote", "Not applicable"},
	"B2C Bandwidth":   {"10 Mbps", "50Mbps", "100Mbps", "250Mbps", "500Mbps", "1Gbps"},
	"B2B Bandwidth": {
		"1Mbps",
		"5Mbps",
		"10Mbps",
		"20Mbps",
		"25Mbps",
		"30Mbps",
		"50Mbps",
		"75Mbps",
		"100Mbps",
		"125Mbps",
		"150Mbps",
		"175Mbps",
		"200Mbps",
		"250Mbps",
		"300Mbps",
		"350Mbps",
		"400Mbps",
		"450Mbps",
		"500Mbps",
		"550Mbps",
		"600Mbps",
		"650Mbps",
		"700Mbps",
		"750Mbps",
		"800Mbps",
		"850Mbps",
		"900Mbps",
		"950Mbps",
		"1Gbps"},
}

var UnableToFindValuesForChar = errors.New("unable to find values for Char")

func InitTestData(cs *cache.CatalogService) error {
	const OfferingsCnt = 50
	h := &Holder{
		prices: make([]*model.PriceConditions, 0, 100),
	}
	for i := 0; i < OfferingsCnt; i++ {
		var offeringId string
		if i == 5 {
			offeringId = "00d3a020-08c4-4c94-be0a-e29794756f9e"
		} else {
			offeringId = uuid.New().String()
		}

		chars := []string{"Term",
			"B2B Traffic", "VPN", "B2B Bandwidth", "Router"}
		cnt := 1
		for _, cc := range chars {
			if values, ok := ValuePool[cc]; ok {
				cnt *= len(values)
			} else {
				cs.L.Error().Str("char", cc).Msg("Unable to find values for Char")
				return UnableToFindValuesForChar
			}
		}
		//fmt.Println("Maximum Possible PriceConditions For Char Conditions", cnt)
		charCache := make([]string, len(chars))
		h.generatePrice(chars, charCache, 0, offeringId)
	}

	for key, v := range h.prices {
		v.IndexId = uint32(key)
	}
	cs.Catalog.PriceConditions = h.prices

	return nil
}

func (h *Holder) generatePrice(chars []string,
	priceValues []string, charIndex int, offering string) {
	ch := chars[charIndex]
	values := ValuePool[ch]
	for i := 0; i < len(values); i++ {
		priceValues[charIndex] = values[i]
		if charIndex != len(priceValues)-1 {
			h.generatePrice(chars, priceValues, charIndex+1, offering)
		} else {
			result := make([]string, len(chars))
			copy(result, priceValues)
			price := &model.PriceConditions{
				ID:         uuid.New().String(),
				IsDefault:  false,
				Spec:       "MRC",
				GroupId:    "Default",
				OfferingID: offering,
				Chars:      chars,
				Values:     result,
			}
			h.prices = append(h.prices, price)
		}

	}
}

type Holder struct {
	prices []*model.PriceConditions
}
