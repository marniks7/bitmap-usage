package runner

import (
	"encoding/json"
	"os"
)

func WriteResults(filename string, experimentWrk Reporting) error {
	data, err := json.MarshalIndent(experimentWrk, "", "  ")
	if err != nil {
		return nil
	}
	err = os.WriteFile(filename, data, os.ModePerm)
	if err != nil {
		return err
	}
	return err
}
