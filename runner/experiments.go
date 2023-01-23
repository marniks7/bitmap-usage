package runner

import (
	"bitmap-usage/benchmark/analyze/wrk"
	"bitmap-usage/handlers"
	"encoding/json"
	"errors"
	"fmt"
	"golang.org/x/exp/slices"
	"reflect"
	"strings"
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

type Experiment struct {
	Name        string
	Application Application
	Wrk         Wrk
}

// NameFieldPath path relative to Experiment
const NameFieldPath = ".Name"

// ApplicationApproachFieldPath path relative to Experiment
const ApplicationApproachFieldPath = ".Application.Approach"

// ExcludeKeyExperimentFieldsNaming - for folder and file exclude field name
var ExcludeKeyExperimentFieldsNaming = []string{NameFieldPath, ApplicationApproachFieldPath}

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

// Reporting used to write back WRK results with experiment enriched data
type Reporting struct {
	Experiment Experiment
	wrk.Stats
}

// AppExecArgs - formatted params for application startup
type AppExecArgs struct {
	All []string
}

type ExperimentsConfig struct {
	Wrk                       Wrk
	Approaches                []Approach
	Bulk                      bool
	DifferentVersions         bool
	GenerateThreadConnections bool
	Application               *Application
}

func filterExperiments(experiments []Experiment, ec ExperimentsConfig) []Experiment {
	newExperiments := make([]Experiment, 0, len(experiments))
	for _, exp := range experiments {
		if len(ec.Approaches) > 0 {
			if !slices.Contains(ec.Approaches, exp.Application.Approach) {
				continue
			}
		}
		if ec.Bulk {
			if !exp.Wrk.Bulk {
				continue
			}
		} else {
			if exp.Wrk.Bulk {
				continue
			}
		}
		newExperiments = append(newExperiments, exp)
	}
	return newExperiments

}

func generateExperiments(ec ExperimentsConfig) []Experiment {
	server := handlers.FiberServer
	goMaxProc := 2
	goGC := 1000
	docker := false
	dockerMemoryLimit := ""
	goMemLimit := ""
	if ec.Application != nil {
		if ec.Application.HttpServer != nil {
			server = *ec.Application.HttpServer
		}
		if ec.Application.GoMaxProc != 0 {
			goMaxProc = ec.Application.GoMaxProc
		}

		if ec.Application.GoGC != 0 {
			goGC = ec.Application.GoGC
		}

		if ec.Application.Docker {
			docker = ec.Application.Docker
		}
		if ec.Application.DockerMemoryLimit != "" {
			dockerMemoryLimit = ec.Application.DockerMemoryLimit
		}
		if ec.Application.GOMEMLIMIT != "" {
			goMemLimit = ec.Application.GOMEMLIMIT
		}
	}

	roaring32 := Application{GoMaxProc: goMaxProc, GoGC: goGC, HttpServer: &server, BitmapOptStructure: true,
		Approach: Roaring32, Docker: docker, DockerMemoryLimit: dockerMemoryLimit,
		GOMEMLIMIT: goMemLimit}
	kelindar32 := Application{GoMaxProc: goMaxProc, GoGC: goGC, HttpServer: &server, BitmapOptStructure: true,
		Approach: Kelindar32, Docker: docker, DockerMemoryLimit: dockerMemoryLimit,
		GOMEMLIMIT: goMemLimit}
	map32 := Application{GoMaxProc: goMaxProc, GoGC: goGC, HttpServer: &server, BitmapOptStructure: true,
		Approach: Map32, Docker: docker, DockerMemoryLimit: dockerMemoryLimit,
		GOMEMLIMIT: goMemLimit}
	sroar := Application{GoMaxProc: goMaxProc, GoGC: goGC, HttpServer: &server, BitmapOptStructure: true,
		Approach: Sroar, Docker: docker, DockerMemoryLimit: dockerMemoryLimit,
		GOMEMLIMIT: goMemLimit}
	map64 := Application{GoMaxProc: goMaxProc, GoGC: goGC, HttpServer: &server, BitmapOptStructure: true,
		Approach: Map64, Docker: docker, DockerMemoryLimit: dockerMemoryLimit,
		GOMEMLIMIT: goMemLimit}
	roaring64 := Application{GoMaxProc: goMaxProc, GoGC: goGC, HttpServer: &server, BitmapOptStructure: true,
		Approach: Roaring64, Docker: docker, DockerMemoryLimit: dockerMemoryLimit,
		GOMEMLIMIT: goMemLimit}
	experiments := []Experiment{
		//{Name: string(Map32) + "-const", Application: map32, Wrk: Wrk{
		//	Path:   "/v1/search/map/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
		//}},
		{Name: string(map32.Approach), Application: map32, Wrk: Wrk{
			Path:   "/v1/search/map/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-map-multiple-request-3000.lua",
		}},
		//{Name: string(Roaring32) + "-const", Application: roaring32, Wrk: Wrk{
		//	Path:   "/v1/search/bitmap/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
		//}},
		{Name: string(roaring32.Approach), Application: roaring32, Wrk: Wrk{
			Path:   "/v1/search/bitmap/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-3000.lua",
		}},

		{Name: string(kelindar32.Approach), Application: kelindar32, Wrk: Wrk{
			Path:   "/v1/search/kelindar/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-kelindar-multiple-request-3000.lua",
		}},
		{Name: string(roaring64.Approach), Application: roaring64, Wrk: Wrk{
			Path:   "/v1/search/bitmap/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-3000.lua",
		}},
		{Name: string(map64.Approach), Application: map64, Wrk: Wrk{
			Path:   "/v1/search/map/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-map-multiple-request-3000.lua",
		}},

		{Name: string(Sroar), Application: sroar, Wrk: Wrk{
			Path:   "/v1/search/bitmap/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-3000.lua",
		}},
	}
	bulkExperiments := []Experiment{
		{Name: "Roaring32", Application: roaring32, Wrk: Wrk{
			Path:   "/v5/search/bitmap/bulk/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000-nd.lua",
			Bulk:   true,
		}},
		{Name: "Map32", Application: map32, Wrk: Wrk{
			Path:   "/v4/search/map/bulk/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000-nd.lua",
			Bulk:   true,
		}},
		//{Name: "Kelindar32", Application: kelindar32, Wrk: Wrk{
		//	Path:   "/v1/search/kelindar/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Name: "Roaring64", Application: roaring64, Wrk: Wrk{
		//	Path:   "/v1/search/bitmap/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Name: "Map64", Application: map64, Wrk: Wrk{
		//	Path:   "/v1/search/map/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Name: "Sroar", Application: sroar, Wrk: Wrk{
		//	Path:   "/v1/search/bitmap/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
	}
	experiments = append(experiments, bulkExperiments...)

	if ec.DifferentVersions {
		bulkExperimentsDifferentVersions := []Experiment{
			{Name: "Roaring32. V5", Application: roaring32, Wrk: Wrk{
				Path:   "/v5/search/bitmap/bulk/prices",
				Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000-nd.lua",
				Bulk:   true,
			}},
			{Name: "Roaring32. V4", Application: roaring32, Wrk: Wrk{
				Path:   "/v4/search/bitmap/bulk/prices",
				Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
				Bulk:   true,
			}},
			{Name: "Roaring32. V2", Application: roaring32, Wrk: Wrk{
				Path:   "/v2/search/bitmap/bulk/prices",
				Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
				Bulk:   true,
			}},
			//{Name: "Kelindar32", Application: kelindar32, Wrk: Wrk{
			//	Path:   "/v1/search/kelindar/prices",
			//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
			//}},
			//{Name: "Roaring64", Application: roaring64, Wrk: Wrk{
			//	Path:   "/v1/search/bitmap/prices",
			//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
			//}},
			//{Name: "Map64", Application: map64, Wrk: Wrk{
			//	Path:   "/v1/search/map/prices",
			//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
			//}},
			//{Name: "Sroar", Application: sroar, Wrk: Wrk{
			//	Path:   "/v1/search/bitmap/prices",
			//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
			//}},
		}
		experiments = append(experiments, bulkExperimentsDifferentVersions...)
	}

	if ec.GenerateThreadConnections {
		experiments = generateThreadConnectionExperiments(experiments)
	}
	experiments = filterExperiments(experiments, ec)
	return experiments
}

func generateThreadConnectionExperiments(experiments []Experiment) []Experiment {
	newExperiments := make([]Experiment, 0, len(experiments))
	for _, exp := range experiments {
		for i := 1; i < 6; i++ {
			newWrk := Wrk{Threads: 2, Connections: i * 5, Duration: Duration(10 * time.Second)}
			wrk := merge(newWrk, exp.Wrk)
			newExperiments = append(newExperiments, Experiment{Name: exp.Name, Application: exp.Application, Wrk: wrk})
		}

	}
	return newExperiments
}

func mergeWrkConfig(experiments []Experiment, wrkConfig Wrk) []Experiment {
	enrichedExperiments := make([]Experiment, 0, len(experiments))
	for _, exp := range experiments {
		newWrk := merge(wrkConfig, exp.Wrk)
		enrichedExperiments = append(enrichedExperiments, Experiment{Name: exp.Name, Application: exp.Application, Wrk: newWrk})
	}
	return enrichedExperiments
}

// UpdateDiskStorageInfo - update experiments by providing folder names and file names
func UpdateDiskStorageInfo(experiments []Experiment) []Experiment {
	keyExperimentFields := retrieveKeyExperimentFields(experiments)

	dt := time.Now().Format("2006-01-02T15-04-05Z")
	folderName := generateFolderName(dt, keyExperimentFields)

	enrichedExperiments := make([]Experiment, 0, len(experiments))
	for _, exp := range experiments {
		diffArgs := ""
		for _, v := range keyExperimentFields {
			trimmedPath := strings.TrimPrefix(v.Path, ".")
			field := "-" + v.Field
			// no need to add to file name those field names, only values
			// e.g. exp-name-map32-approach-map32 should be exp-map32-map32
			exclude := slices.ContainsFunc(ExcludeKeyExperimentFieldsNaming, func(s string) bool {
				return strings.EqualFold(v.Path, s)
			})
			if exclude {
				field = ""
			}
			diffArgs = diffArgs + field + "-" + fmt.Sprint(getValueByPath(exp, trimmedPath))

		}

		filename := "exp" + strings.ReplaceAll(strings.ToLower(diffArgs), " ", "")
		newWrk := exp.Wrk
		newWrk.JsonFilePath = "reports/" + folderName + "/" + filename + ".json"
		newWrk.SummaryFilepath = "reports/" + folderName + "/" + filename + ".txt"
		enrichedExperiments = append(enrichedExperiments, Experiment{Name: exp.Name, Application: exp.Application, Wrk: newWrk})
	}
	return enrichedExperiments
}

func generateFolderName(prefix string, keyExperimentFields []StructDiff) string {
	folderName := prefix
	for _, v := range keyExperimentFields {
		// no need to add those field names to folder name
		// e.g. 2023-01-22t22-45-21z-approach-dockermemorylimit-gomemlimit-name should be 2023-01-22t22-45-21z-dockermemorylimit-gomemlimit
		exclude := slices.ContainsFunc(ExcludeKeyExperimentFieldsNaming, func(s string) bool {
			return strings.EqualFold(v.Path, s)
		})
		if exclude {
			continue
		}
		folderName = folderName + "-" + v.Field
	}
	folderName = strings.ReplaceAll(strings.ToLower(folderName), " ", "")
	return folderName
}

// retrieveKeyExperimentFields - main purpose is to find difference between testing fields
// for example, if the goal to test GOGC change for different Approaches
// it should return GOGC and APPROACH
func retrieveKeyExperimentFields(experiments []Experiment) []StructDiff {
	diff := make([]Result, len(experiments), len(experiments))
	path := make(map[string]StructDiff)
	for i := 0; i < len(experiments)-1; i++ {
		result := compareStructs(experiments[i], experiments[i+1], "")
		diff[i] = result
		// it is enough to take field path from any of A or B
		for _, d := range result.A {
			if _, ok := path[d.Path]; !ok {
				path[d.Path] = d
			}

		}
	}
	pathList := make([]StructDiff, 0, len(path))
	for _, structDiff := range path {
		// exclude certain fields
		exclude := slices.ContainsFunc(ExcludeKeyExperimentFields, func(s string) bool {
			return strings.EqualFold(structDiff.Path, s)
		})
		if exclude {
			continue
		}
		pathList = append(pathList, structDiff)
	}
	slices.SortFunc(pathList, func(a, b StructDiff) bool {
		if a.Path == NameFieldPath {
			return false
		}
		return strings.Compare(a.Path, b.Path) < 0
	})
	return pathList
}

type StructDiff struct {
	Field string
	Path  string
	Value interface{}
}

type Result struct {
	A []StructDiff
	B []StructDiff
}

func compareStructs(a, b interface{}, path string) Result {
	var result Result
	av := reflect.ValueOf(a)
	bv := reflect.ValueOf(b)
	if av.Kind() == reflect.Ptr {
		av = av.Elem()
	}
	if bv.Kind() == reflect.Ptr {
		bv = bv.Elem()
	}

	for i := 0; i < av.NumField(); i++ {
		af := av.Field(i)
		bf := bv.Field(i)
		field := av.Type().Field(i)
		currentPath := path + "." + field.Name

		if af.Kind() == reflect.Struct {
			nestedResult := compareStructs(af.Interface(), bf.Interface(), currentPath)
			result.A = append(result.A, nestedResult.A...)
			result.B = append(result.B, nestedResult.B...)
		} else if !reflect.DeepEqual(af.Interface(), bf.Interface()) {
			result.A = append(result.A, StructDiff{Field: field.Name, Path: currentPath, Value: af.Interface()})
			result.B = append(result.B, StructDiff{Field: field.Name, Path: currentPath, Value: bf.Interface()})
		}
	}

	return result
}
func getValueByPath(s interface{}, path string) interface{} {
	v := reflect.ValueOf(s)
	if v.Kind() == reflect.Ptr {
		v = v.Elem()
	}
	fields := strings.Split(path, ".")
	for i, field := range fields {
		f := v.FieldByName(field)
		if !f.IsValid() {
			return nil
		}
		if i == len(fields)-1 {
			return f.Interface()
		}
		if f.Kind() == reflect.Struct || f.Kind() == reflect.Ptr {
			if f.Kind() == reflect.Ptr {
				f = f.Elem()
			}
			v = f
		} else {
			return nil
		}
	}
	return nil
}

func mergeArray(globalWrk Wrk, wrkc []*Wrk) {
	for _, wrk := range wrkc {
		merge(globalWrk, *wrk)
	}
}

func merge(from Wrk, to Wrk) Wrk {
	if from.Connections != 0 {
		to.Connections = from.Connections
	}
	if from.Threads != 0 {
		to.Threads = from.Threads
	}
	if from.Duration != 0 {
		to.Duration = from.Duration
	}

	if from.Port != 0 {
		to.Port = from.Port
	}

	if from.Script != "" {
		to.Script = from.Script
	}

	if from.Path != "" {
		to.Path = from.Path
	}

	if from.JsonFilePath != "" {
		to.JsonFilePath = from.JsonFilePath
	}

	if from.SummaryFilepath != "" {
		to.SummaryFilepath = from.SummaryFilepath
	}
	return to
}
