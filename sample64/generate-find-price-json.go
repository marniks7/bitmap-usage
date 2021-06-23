package sample64

import (
	model64 "bitmap-usage/model64"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"strconv"
)

func GenerateJson(size int) {
	frb := make([]model64.FindPriceRequestBulk, 0, size)
	termValues := ValuePool["Term"]
	max := len(termValues)
	for i := 0; i < size; i++ {
		frb = append(frb, model64.FindPriceRequestBulk{Id: uint16(i), OfferingId: "00d3a020-08c4-4c94-be0a-e29794756f9e",
			PriceSpecId: "MRC", GroupId: "Default",
			CharValues: []model64.CharValue{{"Term", termValues[i%max]},
				{"B2B Traffic", "5GB"}, {"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
				{"Router", "Not Included"}}})
	}
	var file []byte
	var err error
	var filename string
	if len(frb) == 1 {
		file, err = json.Marshal(frb[0])
		filename = "search-price-request.json"
	} else {
		file, err = json.Marshal(frb)
		filename = "search-price-bulk-request-" + strconv.Itoa(size) + ".json"
	}

	if err != nil {
		fmt.Println("Unable to encode object", err)
		return
	}

	_ = ioutil.WriteFile(filename, file, 0644)

}
