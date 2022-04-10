package main

import (
	"bitmap-usage/benchmark/analyze/analyze"
	"bitmap-usage/benchmark/analyze/wrk"
	"bytes"
	"fmt"
	"github.com/rs/zerolog/log"
	"math"
	"os"
	"path/filepath"
	"sort"
	"strconv"
)

func main() {
	var buf []byte
	buffer := bytes.NewBuffer(buf)
	err := diffWrkT1C1(buffer)
	if err != nil {
		log.Err(err).Msg("unable to calculate diff")
		return
	}

	buffer.Write([]byte("\n"))

	err = diffWrkT2C20(buffer)
	if err != nil {
		log.Err(err).Msg("unable to calculate diff")
		return
	}

	abs, err := filepath.Abs("benchmark/500k-large-groups/diff/wrk/diff.md")
	if err != nil {
		log.Err(err).Msg("unable to get path to file")
		return
	}
	_, err = os.Create(abs)
	if err != nil {
		log.Err(err).Msg("unable create file")
		return
	}
	err = os.WriteFile(abs, buffer.Bytes(), os.ModeAppend)
	if err != nil {
		log.Err(err).Msg("unable to write to file")
		return
	}
}

func diffWrkT1C1(buffer *bytes.Buffer) error {
	statsBitmap, err := analyze.ReadJsonWrkReport("benchmark/500k-large-groups/bitmap/wrk/json/bitmap-t1-c1.json")
	if err != nil {
		return err
	}
	statsMap, err := analyze.ReadJsonWrkReport("benchmark/500k-large-groups/map/wrk/json/map-t1-c1.json")
	if err != nil {
		return err
	}
	buffer.Write([]byte("### Timing (high level)\n"))
	buffer.Write([]byte("* 1 connection (1 processor)\n"))
	buffer.Write([]byte("* [map latest](../../map/wrk/map-t1-c1.txt)\n"))
	buffer.Write([]byte("* [bitmap latest](../../bitmap/wrk/bitmap-t1-c1.txt)\n\n"))
	buffer.Write([]byte("|Case|Bitmap, ns|Map, ns|Bitmap benefit|\n"))
	buffer.Write([]byte("|---|---|---|---|\n"))

	diff(statsBitmap, statsMap, buffer)
	return err
}

func diffWrkT2C20(buffer *bytes.Buffer) error {
	statsBitmap, err := analyze.ReadJsonWrkReport("benchmark/500k-large-groups/bitmap/wrk/json/bitmap-t2-c20.json")
	if err != nil {
		return err
	}
	statsMap, err := analyze.ReadJsonWrkReport("benchmark/500k-large-groups/map/wrk/json/map-t2-c20.json")
	if err != nil {
		return err
	}
	buffer.Write([]byte("### Timing (high level)\n"))
	buffer.Write([]byte("* 20 connections (2 processors)\n"))
	buffer.Write([]byte("* [map latest](../../map/wrk/map-t2-c20.txt)\n"))
	buffer.Write([]byte("* [bitmap latest](../../bitmap/wrk/bitmap-t2-c20.txt)\n\n"))
	buffer.Write([]byte("|Case|Bitmap, ns|Map, ns|Bitmap benefit|\n"))
	buffer.Write([]byte("|---|---|---|---|\n"))

	diff(statsBitmap, statsMap, buffer)
	return err
}

func diff(statsBitmap *wrk.Stats, statsMap *wrk.Stats, buffer *bytes.Buffer) {
	keys := make([]string, len(statsBitmap.Latency.Percentiles))
	i := 0
	for k := range statsBitmap.Latency.Percentiles {
		keys[i] = k
		i++
	}
	sort.Strings(keys)
	for _, k := range keys {
		v := statsBitmap.Latency.Percentiles[k]
		v2 := statsMap.Latency.Percentiles[k]

		magn1 := int(math.Floor(math.Log10(float64(v))))
		magn2 := int(math.Floor(math.Log10(float64(v2))))
		magnMsg := ""
		if magn2-magn1 != 0 {
			magnMsg = ", " + strconv.Itoa(magn2-magn1) + " order of magnitude"
		}
		r := (float64(v2) - float64(v)) / float64(v2)
		r2 := float64(v2) / float64(v)
		betterWorth := "better"
		if r2 < 1 {
			betterWorth = "worth"
		}
		buffer.Write([]byte("|" + k +
			"|" + strconv.Itoa(v*1000) +
			"|" + strconv.Itoa(v2*1000) +
			"|" + fmt.Sprintf("%.2f", 100*r) + "% " + betterWorth +
			", in " + fmt.Sprintf("%.1f", r2) + " times " + betterWorth + magnMsg + "|\n"))
	}
	r := (float64(statsBitmap.Requests) - float64(statsMap.Requests)) / float64(statsMap.Requests)
	r2 := float64(statsBitmap.Requests) / float64(statsMap.Requests)
	moreLess := "more"
	if r2 < 1 {
		moreLess = "less"
	}
	buffer.Write([]byte("|Requests" +
		"|" + strconv.Itoa(statsBitmap.Requests) +
		"|" + strconv.Itoa(statsMap.Requests) +
		"|" + fmt.Sprintf("%.1f", 100*r) + "% " + moreLess +
		", in " + fmt.Sprintf("%.1f", r2) + " times " + moreLess + "|\n"))
}
