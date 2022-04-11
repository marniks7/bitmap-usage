package analyze

import (
	"bitmap-usage/benchmark/analyze/wrk"
	"encoding/json"
	"fmt"
	"github.com/rs/zerolog/log"
	"io"
	"math"
	"os"
	"path/filepath"
	"sort"
	"strconv"
)

func ReadJsonWrkReport(filename string) (*wrk.Stats, error) {
	abs, err := filepath.Abs(filename)
	if err != nil {
		log.Err(err).Msg("unable to read file")
		return nil, err
	}

	file, err := os.ReadFile(abs)
	if err != nil {
		log.Err(err).Msg("unable to read file")
		return nil, err
	}
	stats := wrk.Stats{}
	err = json.Unmarshal(file, &stats)
	return &stats, err
}

func MarkdownDiff(statsBitmap *wrk.Stats, statsMap *wrk.Stats, buffer io.Writer) {
	buffer.Write([]byte("### Difference Report\n"))
	buffer.Write([]byte("|Percentile|Case1|Case2|Case1 vs Case2|\n"))
	buffer.Write([]byte("|---|---|---|---|\n"))

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
		r3 := math.Abs(float64(v2) - float64(v))
		buffer.Write([]byte("|" + k +
			"|" + strconv.Itoa(v) + "μs" +
			"|" + strconv.Itoa(v2) + "μs" +
			"|" + betterWorth + ": " +
			"on " + fmt.Sprintf("%.0f", r3) + " μs" +
			", on " + fmt.Sprintf("%.2f", 100*r) +
			"%, in " + fmt.Sprintf("%.1f", r2) +
			" times " +
			magnMsg + "|\n"))
	}
	r := (float64(statsBitmap.Requests) - float64(statsMap.Requests)) / float64(statsMap.Requests)
	r2 := float64(statsBitmap.Requests) / float64(statsMap.Requests)
	moreLess := "more"
	if r2 < 1 {
		moreLess = "less"
	}
	buffer.Write([]byte("|Requests, count" +
		"|" + strconv.Itoa(statsBitmap.Requests) +
		"|" + strconv.Itoa(statsMap.Requests) +
		"|" + moreLess + ": " +
		fmt.Sprintf("%.1f", 100*r) + "% " +
		", in " + fmt.Sprintf("%.1f", r2) + " times " + "|\n"))
}
