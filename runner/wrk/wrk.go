package wrk

import (
	"encoding/json"
	"errors"
	"strconv"
	"time"
)

// Wrk - developer-friendly way to describe params of WRK performance tool
type Wrk struct {
	Connections     int
	Threads         int
	Duration        Duration
	Script          string
	Path            string
	Port            int
	JsonFilePath    string
	SummaryFilepath string
	Bulk            bool
}

// WrkExecArgs - formatted params for WRK tool
type WrkExecArgs struct {
	Connections     string
	Threads         string
	Duration        string
	Script          string
	Path            string
	JsonFilePath    string
	SummaryFilepath string
}

func (wrk Wrk) Convert() WrkExecArgs {
	return WrkExecArgs{Connections: "-c" + strconv.Itoa(wrk.Connections),
		Threads:         "-t" + strconv.Itoa(wrk.Threads),
		Duration:        "-d" + strconv.Itoa(int(time.Duration(wrk.Duration).Seconds())),
		Script:          wrk.Script,
		Path:            "http://localhost:" + strconv.Itoa(wrk.Port) + wrk.Path,
		JsonFilePath:    wrk.JsonFilePath,
		SummaryFilepath: wrk.SummaryFilepath,
	}
}

// Duration - WA for marshal into user friendly format
type Duration time.Duration

func (d Duration) MarshalJSON() ([]byte, error) {
	return json.Marshal(time.Duration(d).String())
}

func (d *Duration) UnmarshalJSON(b []byte) error {
	var v interface{}
	if err := json.Unmarshal(b, &v); err != nil {
		return err
	}
	switch value := v.(type) {
	case float64:
		*d = Duration(time.Duration(value))
		return nil
	case string:
		tmp, err := time.ParseDuration(value)
		if err != nil {
			return err
		}
		*d = Duration(tmp)
		return nil
	default:
		return errors.New("invalid duration")
	}
}
