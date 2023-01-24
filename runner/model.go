package runner

import (
	"bitmap-usage/handlers"
	"bitmap-usage/runner/wrk"
)

// Experiment experiment to execute
type Experiment struct {
	// ID - short id (better to use number) of the experiment to be able to differentiate one from another
	ID string
	// Name - add details here, keep short. Note, that approach (e.g. roaring32) will be included into Application
	Name string
	// Application - main info about app params
	Application Application
	// Wrk - load configuration for Wrk
	Wrk wrk.Wrk
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

// AppExecArgs - formatted params for application startup
type AppExecArgs struct {
	All []string
}

type FilterExperimentsConfig struct {
	Approaches        []Approach
	Bulk              bool
	DifferentVersions bool
}
