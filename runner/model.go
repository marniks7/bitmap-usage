package runner

import (
	"bitmap-usage/handlers"
	"encoding/json"
	"errors"
	"time"
)

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

// Experiment experiment to execute
type Experiment struct {
	// ID - short id (better to use number) of the experiment to be able to differentiate one from another
	ID string
	// Name - add details here, keep short. Note, that approach (e.g. roaring32) will be included into Application
	Name string
	// Application - main info about app params
	Application Application
	// Wrk - load configuration for Wrk
	Wrk Wrk
}

// IdFieldPath path relative to Experiment
const IdFieldPath = ".ID"

// NameFieldPath path relative to Experiment
const NameFieldPath = ".Name"

// ApplicationApproachFieldPath path relative to Experiment
const ApplicationApproachFieldPath = ".Application.Approach"

// ExcludeKeyExperimentFieldsNaming - for folder and file exclude field name
// E.g. "name-map32" should be "map32"
var ExcludeKeyExperimentFieldsNaming = []string{IdFieldPath, NameFieldPath, ApplicationApproachFieldPath}

// WrkPathFieldPath path relative to Experiment
const WrkPathFieldPath = ".Wrk.Path"

// WrkScriptFieldPath path relative to Experiment
const WrkScriptFieldPath = ".Wrk.Script"

// ExcludeKeyExperimentFields
// those fields are long, might be important, but cannot add them as a file name
var ExcludeKeyExperimentFields = []string{WrkPathFieldPath, WrkScriptFieldPath}

// Application - developer-friendly way to describe params of application
type Application struct {
	HttpServer         *handlers.HttpServerType
	Approach           Approach
	FiberPrefork       bool
	GoGC               int
	GoMaxProc          int
	BitmapOptStructure bool
	BitmapOptStats     bool
	Docker             bool
	DockerMemoryLimit  string
	GOMEMLIMIT         string
}
type Approach string

const (
	Map32      Approach = "MAP32"
	Map64      Approach = "MAP64"
	Roaring32  Approach = "ROARING32"
	Roaring64  Approach = "ROARING64"
	Kelindar32 Approach = "KELINDAR32"
	Sroar      Approach = "SROAR"
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

// AppExecArgs - formatted params for application startup
type AppExecArgs struct {
	All []string
}

type FilterExperimentsConfig struct {
	Approaches        []Approach
	Bulk              bool
	DifferentVersions bool
}
