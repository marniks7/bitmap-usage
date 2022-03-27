package sample

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
	"bytes"
	"encoding/json"
	"io/ioutil"
	"math/rand"
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

func GenerateWrkRequestMultiple(size int, api string, filename string) {
	sampleJson, err := os.ReadFile("wrk-json-report-sample.lua")
	if err != nil {
		panic(err)
	}
	file, err := os.Create(filename)
	if err != nil {
		panic(err)
	}
	file.Write(sampleJson)
	file.Write([]byte("\n"))
	//file.Write([]byte("\nwrk.method = \"POST\"\n"))
	//file.Write([]byte("wrk.headers[\"Content-Type\"] = \"application/json\"\n"))
	priceConditions := FindPseudoRandomPriceConditions(size)
	for i := 0; i < size; i++ {
		pc := priceConditions[i]
		cv := make([]model.CharValue, len(pc.Chars), len(pc.Chars))
		for j := 0; j < len(pc.Chars); j++ {
			cv[j] = model.CharValue{Char: pc.Chars[j], Value: pc.Values[j]}
		}
		j := i + 1
		file.Write([]byte("request" + strconv.Itoa(j) + " = function()\n"))
		file.Write([]byte("  headers = {}\n"))
		file.Write([]byte("  headers[\"Content-Type\"] = \"application/json\"\n"))
		file.Write([]byte("  body = "))
		priceRequestJson, err := json.Marshal(model.FindPriceRequest{GroupId: pc.GroupId,
			OfferingId: pc.OfferingID, PriceSpecId: pc.Spec,
			CharValues: cv})
		if err != nil {
			panic(err)
		}

		quote := strconv.Quote(string(priceRequestJson))
		file.Write([]byte(quote))
		file.Write([]byte("\n"))
		file.Write([]byte("	return wrk.format(\"POST\", \"" + api + "\", headers, body)\n"))
		file.Write([]byte("end\n"))
	}
	file.Write([]byte("requests = {}\n"))
	for i := 1; i < size+1; i++ {
		file.Write([]byte("requests[" + strconv.Itoa(i) + "] = request" + strconv.Itoa(i) + "\n"))
	}
	file.Write([]byte("request = function()\n"))
	file.Write([]byte("	return requests[math.random(1, " + strconv.Itoa(size) + ")]()\n"))
	file.Write([]byte("end\n"))

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

func FindPseudoRandomPriceConditions(size int) []model.PriceCondition {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	if err != nil {
		panic(err)
	}
	r := rand.New(rand.NewSource(3389))
	total := len(cs.Catalog.PriceConditions)

	pcs := make([]model.PriceCondition, size, size)
	for i := 0; i < size; i++ {
		j := r.Int() & total
		pc := cs.Catalog.PriceConditions[j]
		pcs[i] = *pc
	}
	return pcs

}
