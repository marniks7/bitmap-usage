package sample

import (
	"bitmap-usage/model"
	"bytes"
	"encoding/json"
	"io/ioutil"
	"os"
	"strconv"
)

func GenerateJsonRequest(size int) {
	file, filename := GenerateJsonAndReturn(size)

	_ = ioutil.WriteFile(filename+".json", file, 0644)
}

func GenerateWrkRequest(size int) {
	file, err := os.ReadFile("wrk-json-report-sample.lua")
	if err != nil {
		panic(err)
	}
	buffer := bytes.NewBuffer(file)
	buffer.Write([]byte("\nwrk.method = \"POST\"\n"))
	buffer.Write([]byte("wrk.headers[\"Content-Type\"] = \"application/json\"\n"))
	file, filename := GenerateJsonAndReturn(size)

	buffer.Write([]byte("wrk.body   = "))
	buffer.WriteString(strconv.Quote(string(file)))
	_ = ioutil.WriteFile("wrk-"+filename+".lua", buffer.Bytes(), 0644)
}

func GenerateJsonAndReturn(size int) ([]byte, string) {
	if size > 65535 {
		panic("bulk for >65535 items are not allowed for performance reasons")
	}

	frb := make([]model.FindPriceRequestBulk, 0, size)
	for i := 0; i < size; i++ {
		frb = append(frb, model.FindPriceRequestBulk{Id: uint16(i), OfferingId: "00d3a020-08c4-4c94-be0a-e29794756f9e",
			PriceSpecId: "NRC", GroupId: "group2",
			CharValues: []model.CharValue{{"Term", "24"},
				{"B2B Traffic", "5GB"},
				{"B2B Bandwidth", "900Mbps"},
				{"VPN", "5739614e-6c52-402c-ba3a-534c51b3201a"},
				{"Router", "Not Included"}}})
	}

	var file []byte
	var err error
	var filename string
	if len(frb) == 1 {
		bulk := frb[0]
		file, err = json.Marshal(model.FindPriceRequest{GroupId: bulk.GroupId,
			OfferingId: bulk.OfferingId, PriceSpecId: bulk.PriceSpecId,
			CharValues: bulk.CharValues})
		filename = "search-price-request"
	} else {
		file, err = json.Marshal(frb)
		filename = "search-price-bulk-request-" + strconv.Itoa(size)
	}

	if err != nil {
		panic(err)
	}
	return file, filename
}
