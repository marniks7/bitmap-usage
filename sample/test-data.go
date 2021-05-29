package sample

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
	"errors"
	"github.com/google/uuid"
	"time"
)

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
	"92d005e7-b8e3-4631-ad25-b0e8d6fb5aef",
	"b694c4a9-345f-4d07-a37e-eabebd2195b8",
	"26296cab-a3de-4104-a458-2a548c8973bd",
	"afab959f-7366-4859-a152-7a46fd53c0df",
	"e27b07ee-3a2c-41e9-86e1-932c804b6c07",
	"5995c13b-82f5-4daf-aa4b-a77a735243e7",
	"970a4374-e158-4758-b9cd-817980ff67b0",
	"5aafedcd-f3a9-4987-af24-5fa49ee0861a",
	"314b2348-4db6-44ce-98d0-6388a2d202c9",
	"e720cca1-567e-4710-8097-9b655cc42e8b",
	"2557c91e-a3e7-4c15-9cf0-f44e3c133d0e",
	"c6e9a5dc-821c-4899-b069-7191fa781498",
	"61e9c254-f164-472f-bd9f-1b0bdc91b6b9",
	"85dc39cd-52dc-49fa-9d00-051a1ff15cd6",
	"67ebe8f2-a17b-44a7-a6e1-3b3ceb86e723",
	"144f119b-1f4c-4f06-a7cf-aa6e9e73c67a",
	"45dd65ee-74db-42ba-9ddc-ec31b496e9d4",
	"136c984f-2465-4608-9d6f-abc44e317c28",
	"072d595b-4256-402e-b717-3a8df1b2dfe6",
	"87f4da45-9eb9-4b58-91aa-c2ca00e7bb9e",
	"c33b3fdd-135b-4eae-9c02-c95205cb77f1",
	"7672ca4b-2ca3-4281-afee-caee5f7841be",
	"e7b54090-c015-4f55-a17d-d14761f30ca2",
	"bbda69e5-e785-4e9f-a80e-cafcd58b7baa",
	"373e9b13-f51b-4413-90dd-576738c95183",
	"209e517a-d450-4a91-90c9-adc661a83e41",
	"c6dc88cf-4dd7-4d60-a97f-d73e331cbaf4",
	"6161b4ba-f153-4473-a508-66743bc40742",
	"545bc005-f710-4676-89c3-80cb23df67b6",
	"69ff38fb-e4a9-480b-bb94-b6e701ea72fd",
}

var UnableToFindValuesForChar = errors.New("unable to find values for Char")

func GenerateTestData(cs *cache.CatalogService) error {
	const OfferingsCnt = 50
	h := &Holder{
		prices: make([]*model.PriceConditions, 0, 100),
	}
	chars := []string{"Term",
		"B2B Traffic", "VPN", "B2B Bandwidth", "Router"}
	for i := 0; i < OfferingsCnt; i++ {
		var offeringId string
		if i < len(OfferingPool)-1 {
			offeringId = OfferingPool[i]
		} else {
			offeringId = uuid.NewString()
		}
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
				StartDate:  time.Date(2019, time.May, 10, 5, 0, 0, 0, time.UTC),
				EndDate:    time.Date(2022, time.January, 5, 3, 0, 0, 0, time.UTC),
			}
			h.prices = append(h.prices, price)
		}

	}
}

type Holder struct {
	prices []*model.PriceConditions
}
