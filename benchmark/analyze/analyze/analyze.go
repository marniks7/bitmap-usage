package analyze

import (
	"bitmap-usage/benchmark/analyze/wrk"
	"encoding/json"
	"github.com/rs/zerolog/log"
	"os"
	"path/filepath"
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
