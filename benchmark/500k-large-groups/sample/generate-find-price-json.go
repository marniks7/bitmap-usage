package sample

import (
	"bitmap-usage/cache"
	"bitmap-usage/model"
	"encoding/json"
	"io"
	"math/rand"
	"os"
	"strconv"
)

func GenerateJsonRequest(size int) {
	var filename string
	if size == 1 {
		filename = "search-price-request.json"
	} else {
		filename = "search-price-bulk-request-" + strconv.Itoa(size) + ".json"
	}
	file, err := os.Create(filename)
	if err != nil {
		panic(err)
	}

	err = GenerateRequest(size, file, false)

	if err != nil {
		panic(err)
	}
}

func GenerateWrkRequest(size int) {
	sampleFile, err := os.ReadFile("wrk-json-report-sample.lua")
	if err != nil {
		panic(err)
	}

	var filename string
	if size == 1 {
		filename = "wrk-search-price-request.lua"
	} else {
		filename = "wrk-search-price-bulk-request-" + strconv.Itoa(size) + ".lua"
	}
	file, err := os.Create(filename)
	if err != nil {
		panic(err)
	}

	file.Write(sampleFile)
	file.Write([]byte("\nwrk.method = \"POST\"\n"))
	file.Write([]byte("wrk.headers[\"Content-Type\"] = \"application/json\"\n"))
	file.Write([]byte("wrk.body   = \""))
	err = GenerateRequest(size, file, true)
	file.Write([]byte("\""))
	if err != nil {
		panic(err)
	}

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
	priceConditions := FindPseudoRandomPriceConditions(size, 3389)
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
func GenerateRequest(size int, w io.Writer, quote bool) error {
	if size > 65535 {
		panic("bulk for >65535 items are not allowed for performance reasons")
	}

	priceConditions := FindPseudoRandomPriceConditions(size, 6892)
	if size == 1 {
		pc := priceConditions[0]
		cv := make([]model.CharValue, len(pc.Chars), len(pc.Chars))
		for j := 0; j < len(pc.Chars); j++ {
			cv[j] = model.CharValue{Char: pc.Chars[j], Value: pc.Values[j]}
		}
		write, err := json.Marshal(model.FindPriceRequest{GroupId: pc.GroupId,
			OfferingId: pc.OfferingID, PriceSpecId: pc.Spec,
			CharValues: cv})
		if err != nil {
			return err
		}
		if quote {
			s := strconv.Quote(string(write))
			bts := []byte(s)
			w.Write(bts[1 : len(s)-1])
		} else {
			w.Write(write)
		}

		return nil
	}
	fprb := make([]model.FindPriceRequestBulk, size, size)
	//if size > 1 {
	//	w.Write([]byte("["))
	//}
	for i := 0; i < size; i++ {
		pc := priceConditions[i]
		cv := make([]model.CharValue, len(pc.Chars), len(pc.Chars))
		for j := 0; j < len(pc.Chars); j++ {
			cv[j] = model.CharValue{Char: pc.Chars[j], Value: pc.Values[j]}
		}
		bulk := model.FindPriceRequestBulk{Id: uint16(i), OfferingId: pc.OfferingID,
			PriceSpecId: pc.Spec, GroupId: pc.GroupId,
			CharValues: cv}
		fprb[i] = bulk
		write, err := json.Marshal(bulk)
		if err != nil {
			return err
		}
		if quote {
			s := strconv.Quote(string(write))
			bts := []byte(s)
			w.Write(bts[1 : len(s)-1])
		} else {
			w.Write(write)
		}
		//if i < size-1 {
		//	w.Write([]byte(""))
		//}

	}
	//if size > 1 {
	//	w.Write([]byte("]"))
	//}
	return nil
}

func FindPseudoRandomPriceConditions(size int, seed int64) []model.PriceCondition {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	if err != nil {
		panic(err)
	}
	r := rand.New(rand.NewSource(seed))
	total := len(cs.Catalog.PriceConditions) - 1

	pcs := make([]model.PriceCondition, size, size)
	for i := 0; i < size; i++ {
		j := r.Int() & total
		pc := cs.Catalog.PriceConditions[j]
		pcs[i] = *pc
	}
	return pcs

}
