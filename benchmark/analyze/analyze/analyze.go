package analyze

import (
	"bitmap-usage/runner/wrk"
	"encoding/json"
	"fmt"
	"github.com/rs/zerolog/log"
	"io"
	"math"
	"os"
	"path/filepath"
	"sort"
	"strconv"
	"time"
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

func MarkdownDiff(case1 *wrk.Stats, case2 *wrk.Stats, buffer io.Writer, filename1 string, filename2 string) {
	buffer.Write([]byte("### Difference Report\n"))
	buffer.Write([]byte("Case1: " + filename1 + "\n"))
	buffer.Write([]byte("Case2: " + filename2 + "\n\n"))
	buffer.Write([]byte("|Percentile|Case1|Case2|Case1 vs Case2|\n"))
	buffer.Write([]byte("|---|---|---|---|\n"))

	keys := make([]string, len(case1.Latency.Percentiles))
	i := 0
	for k := range case1.Latency.Percentiles {
		keys[i] = k
		i++
	}
	sort.Strings(keys)
	for _, k := range keys {
		v := case1.Latency.Percentiles[k]
		vd := time.Duration(v) * time.Microsecond
		v2 := case2.Latency.Percentiles[k]
		v2d := time.Duration(v2) * time.Microsecond

		magn1 := int(math.Floor(math.Log10(float64(v))))
		magn2 := int(math.Floor(math.Log10(float64(v2))))
		magnMsg := ""
		if magn2-magn1 != 0 {
			magnMsg = ", " + strconv.Itoa(magn2-magn1) + " order of magnitude"
		}
		r := (float64(v2) - float64(v)) / float64(v)
		r2 := float64(v2) / float64(v)
		betterWorth := "better"
		if r2 < 1 {
			betterWorth = "worth"
		}
		r3 := math.Abs(float64(v2) - float64(v))
		r3d := time.Duration(r3) * time.Microsecond
		buffer.Write([]byte("|" + k +
			"|" + fmt.Sprintf("%s", vd) +
			"|" + fmt.Sprintf("%s", v2d) +
			"|" + betterWorth + ": " +
			"on " + fmt.Sprintf("%s", r3d) +
			", on " + fmt.Sprintf("%.2f", 100*r) +
			"%, in " + fmt.Sprintf("%.1f", r2) +
			" times " +
			magnMsg + "|\n"))
	}
	r := (float64(case1.Requests) - float64(case2.Requests)) / float64(case2.Requests)
	r2 := float64(case1.Requests) / float64(case2.Requests)
	moreLess := "more"
	if r2 < 1 {
		moreLess = "less"
	}
	buffer.Write([]byte("|Requests, count" +
		"|" + strconv.Itoa(case1.Requests) +
		"|" + strconv.Itoa(case2.Requests) +
		"|" + moreLess + ": " +
		fmt.Sprintf("%.1f", 100*r) + "% " +
		", in " + fmt.Sprintf("%.1f", r2) + " times " + "|\n"))
}
