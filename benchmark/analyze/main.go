package main

import (
	"bitmap-usage/benchmark/analyze/analyze"
	"bytes"
	"flag"
	"github.com/rs/zerolog/log"
	"os"
	"path/filepath"
)

func main() {
	f1 := flag.String("f1", "", "First file to compare")
	f2 := flag.String("f2", "", "Second file to compare")
	o := flag.String("o", "", "Output, markdown file name")
	flag.Parse()
	var buf []byte
	buffer := bytes.NewBuffer(buf)
	err := generateMarkdownDiff(buffer, *f1, *f2)
	if err != nil {
		log.Err(err).Msg("unable to calculate diff or generate markdown file")
		return
	}
	abs, err := filepath.Abs(*o)
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

func generateMarkdownDiff(buffer *bytes.Buffer, fileName1 string, fileName2 string) error {
	case1, err := analyze.ReadJsonWrkReport(fileName1)
	if err != nil {
		return err
	}
	case2, err := analyze.ReadJsonWrkReport(fileName2)
	if err != nil {
		return err
	}

	analyze.MarkdownDiff(case1, case2, buffer, fileName1, fileName2)
	return err
}
