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

var OfferingPool = []string{
	"a38e432c-3965-4c74-8251-aa640002d2b2",
	"b56d4089-2b29-4453-a2e3-5df95f4f093b",
	"3a83444a-2fbb-4e31-9c1c-a6e60be13a84",
	"cdf8e7f7-1483-426c-9963-dfc848a235d8",
	"00d3a020-08c4-4c94-be0a-e29794756f9e",
	"0957cf06-7ea3-46ac-a971-df4515f6b207",
	"5d4b8249-0415-467e-b34c-9e9b0f52ddf2",
	"f335c67e-42d7-419e-8e34-8787f6ede049",
	"a9a226ae-69ae-4bae-bfe0-448529f0b9f3",
	"a4f9fb39-e56b-403b-a892-07bf9a73540b",
	"a5ec1eb7-073f-4399-9071-ae4a40636f98",
	"1212717d-4650-4acd-9cd4-1e76896c9048",
	"163932ce-24af-4284-b58c-3d5221ee4442",
	"bb23aeba-dd18-4a83-92e7-fc60cc74051f",
	"2c2103f7-a4d4-4b4c-ad92-85f82c5646f6",
	"17fd7812-2c80-494f-8983-430a2800bdf3",
	"8f8030ed-6864-45bb-be8f-d291825a5db8",
	"6ea4e5f3-d747-4fa9-9b83-a88c2562cd0e",
	"c235e849-afd7-4f46-8dcd-90a0e611f925",
	"7575a5b1-eafd-47b8-9bd4-2b3e0bd0c4b6",
	"699c4b09-dab0-429b-a27b-b8b898744620",
	"2ebaa34c-6d81-43de-8047-ca16b1711b90",
	"aa7949f7-57ee-4496-af08-be9ed55ac486",
	"c28d3369-91cb-4e8a-8fc2-e0f8bab9ec96",
	"a6cae282-a564-4a1e-9bff-189743e9d8dd",
	"88bff6f1-effc-45d8-85f6-ffea7f6f8c3e",
	"7473d2d3-2b4e-47de-a054-94b3ce6293b7",
	"f5c56b5a-49de-4d50-bb66-12b685f562c6",
	"a4e12f41-3e99-4165-aba4-c242d583504b",
	"eecff436-e525-48d4-806b-cd42a8f40bce",
}

var UnableToFindValuesForChar = errors.New("unable to find values for Char")

func InitTestData(cs *cache.CatalogService) error {
	const OfferingsCnt = 50
	h := &Holder{
		prices: make([]*model.PriceConditions, 0, 100),
	}
	for i := 0; i < OfferingsCnt; i++ {
		var offeringId string
		if i < len(OfferingPool)-1 {
			offeringId = OfferingPool[i]
		} else {
			offeringId = uuid.NewString()
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
				ID:         uuid.NewString(),
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
