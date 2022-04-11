package main

import (
	"bitmap-usage/benchmark/analyze/analyze"
	"bytes"
	"github.com/rs/zerolog/log"
	"os"
	"path/filepath"
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

	analyze.MarkdownDiff(statsBitmap, statsMap, buffer)
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

	analyze.MarkdownDiff(statsBitmap, statsMap, buffer)
	return err
}
