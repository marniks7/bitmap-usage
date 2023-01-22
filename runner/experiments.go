package runner

import (
	"bitmap-usage/handlers"
	"golang.org/x/exp/slices"
	"strconv"
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
	Duration        time.Duration
	Script          string
	Path            string
	Port            int
	JsonFilePath    string
	SummaryFilepath string
	Bulk            bool
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

	experiments = updateWrkConfigAndReporting(experiments, ec.Wrk)
	return experiments
}

func generateThreadConnectionExperiments(experiments []Experiment) []Experiment {
	newExperiments := make([]Experiment, 0, len(experiments))
	for _, exp := range experiments {
		for i := 1; i < 6; i++ {
			newWrk := Wrk{Threads: 2, Connections: i * 5, Duration: 10 * time.Second}
			wrk := merge(newWrk, exp.Wrk)
			newExperiments = append(newExperiments, Experiment{Name: exp.Name, Application: exp.Application, Wrk: wrk})
		}

	}
	return newExperiments
}

func updateWrkConfigAndReporting(experiments []Experiment, wrkConfig Wrk) []Experiment {
	dt := time.Now().Format("2006-01-02T15-04-05Z")
	enrichedExperiments := make([]Experiment, 0, len(experiments))
	for _, exp := range experiments {
		wrk := merge(wrkConfig, exp.Wrk)
		filename := "wrk" +
			"-t" + strconv.Itoa(wrk.Threads) +
			"-c" + strconv.Itoa(wrk.Connections) +
			"-" + strings.ToLower(exp.Name) +
			"-" + string(*exp.Application.HttpServer) +
			"-goGC" + strconv.Itoa(exp.Application.GoGC) +
			"-cpu" + strconv.Itoa(exp.Application.GoMaxProc)

		if exp.Application.DockerMemoryLimit != "" {
			filename = filename + "-ml" + exp.Application.DockerMemoryLimit
		}
		if exp.Application.GOMEMLIMIT != "" {
			filename = filename + "-gml" + exp.Application.GOMEMLIMIT
		}
		wrk.JsonFilePath = "reports/" + dt + "/" + filename + ".json"
		wrk.SummaryFilepath = "reports/" + dt + "/" + filename + ".txt"
		enrichedExperiments = append(enrichedExperiments, Experiment{Name: exp.Name, Application: exp.Application, Wrk: wrk})
	}
	return enrichedExperiments
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
