package runner

import (
	"bitmap-usage/handlers"
	"github.com/imdario/mergo"
	"golang.org/x/exp/slices"
	"strconv"
)

var DefaultTemplateExperiment = Experiment{
	Application: Application{GoGC: 1000, HttpServer: httpServerAddressable(handlers.FiberServer),
		GoMaxProc:          2,
		BitmapOptStructure: true},
}

func filterExperiments(experiments []Experiment, ec FilterExperimentsConfig) []Experiment {
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

func mergeExperiments(experiments []Experiment, ec Experiment) []Experiment {
	newExperiments := make([]Experiment, 0, len(experiments))
	for _, exp := range experiments {
		mergeExperiment(&exp, ec)
		newExperiments = append(newExperiments, exp)
	}
	return newExperiments
}

func mergeExperiment(exp *Experiment, ec Experiment) {
	newApplication := exp.Application
	err := mergo.Merge(&newApplication, ec.Application)
	if err != nil {
		panic(err)
	}
	err = mergo.Merge(&newApplication, DefaultTemplateExperiment.Application)
	if err != nil {
		panic(err)
	}

	newWrk := exp.Wrk
	err = mergo.Merge(&newWrk, ec.Wrk)
	if err != nil {
		panic(err)
	}
	err = mergo.Merge(&newWrk, DefaultTemplateExperiment.Wrk)
	if err != nil {
		panic(err)
	}
	exp.Wrk = newWrk
	exp.Application = newApplication
}

// generateExperiments - generate basic experiments. Supposed to be used called X times to generate required list
func generateExperiments(templateExperiment Experiment, ec FilterExperimentsConfig) []Experiment {
	roaring32 := Application{Approach: Roaring32}
	kelindar32 := Application{Approach: Kelindar32}
	map32 := Application{Approach: Map32}
	sroar := Application{Approach: Sroar}
	map64 := Application{Approach: Map64}
	roaring64 := Application{Approach: Roaring64}
	experiments := []Experiment{
		//{Name: "const", Application: map32, Wrk: Wrk{
		//	Path:   "/v1/search/map/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
		//}},
		{Application: map32, Wrk: Wrk{
			Path:   "/v1/search/map/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-map-multiple-request-3000.lua",
		}},
		//{Name: "const", Application: roaring32, Wrk: Wrk{
		//	Path:   "/v1/search/bitmap/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-request.lua",
		//}},
		{Application: roaring32, Wrk: Wrk{
			Path:   "/v1/search/bitmap/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-3000.lua",
		}},

		{Application: kelindar32, Wrk: Wrk{
			Path:   "/v1/search/kelindar/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-kelindar-multiple-request-3000.lua",
		}},
		{Application: roaring64, Wrk: Wrk{
			Path:   "/v1/search/bitmap/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-3000.lua",
		}},
		{Application: map64, Wrk: Wrk{
			Path:   "/v1/search/map/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-map-multiple-request-3000.lua",
		}},

		{Application: sroar, Wrk: Wrk{
			Path:   "/v1/search/bitmap/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bitmap-multiple-request-3000.lua",
		}},
	}
	bulkExperiments := []Experiment{
		{Application: roaring32, Wrk: Wrk{
			Path:   "/v5/search/bitmap/bulk/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000-nd.lua",
			Bulk:   true,
		}},
		{Application: map32, Wrk: Wrk{
			Path:   "/v4/search/map/bulk/prices",
			Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000-nd.lua",
			Bulk:   true,
		}},
		//{Application: kelindar32, Wrk: Wrk{
		//	Path:   "/v1/search/kelindar/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Application: roaring64, Wrk: Wrk{
		//	Path:   "/v1/search/bitmap/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Application: map64, Wrk: Wrk{
		//	Path:   "/v1/search/map/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
		//{Application: sroar, Wrk: Wrk{
		//	Path:   "/v1/search/bitmap/prices",
		//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
		//}},
	}
	experiments = append(experiments, bulkExperiments...)

	if ec.DifferentVersions {
		bulkExperimentsDifferentVersions := []Experiment{
			{Name: "V5", Application: roaring32, Wrk: Wrk{
				Path:   "/v5/search/bitmap/bulk/prices",
				Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000-nd.lua",
				Bulk:   true,
			}},
			{Name: "V4", Application: roaring32, Wrk: Wrk{
				Path:   "/v4/search/bitmap/bulk/prices",
				Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
				Bulk:   true,
			}},
			{Name: "V2", Application: roaring32, Wrk: Wrk{
				Path:   "/v2/search/bitmap/bulk/prices",
				Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
				Bulk:   true,
			}},
			//{Application: kelindar32, Wrk: Wrk{
			//	Path:   "/v1/search/kelindar/prices",
			//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
			//}},
			//{Application: roaring64, Wrk: Wrk{
			//	Path:   "/v1/search/bitmap/prices",
			//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
			//}},
			//{Application: map64, Wrk: Wrk{
			//	Path:   "/v1/search/map/prices",
			//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
			//}},
			//{Application: sroar, Wrk: Wrk{
			//	Path:   "/v1/search/bitmap/prices",
			//	Script: "benchmark/500k-large-groups/sample/wrk-search-price-bulk-request-3000.lua",
			//}},
		}
		experiments = append(experiments, bulkExperimentsDifferentVersions...)
	}

	experiments = mergeExperiments(experiments, templateExperiment)
	return experiments
}

//func generateThreadConnectionExperiments(experiments []Experiment) []Experiment {
//	newExperiments := make([]Experiment, 0, len(experiments))
//	for _, exp := range experiments {
//		for i := 1; i < 6; i++ {
//			newWrk := Wrk{Threads: 2, Connections: i * 5, Duration: Duration(10 * time.Second)}
//			mergedWrk := mergeExperiments(newWrk, exp.Wrk)
//			newExperiments = append(newExperiments, Experiment{Name: exp.Name, Application: exp.Application, Wrk: mergedWrk})
//		}
//
//	}
//	return newExperiments
//}

func generateIds(experiments []Experiment) []Experiment {
	enrichedExperiments := make([]Experiment, 0, len(experiments))
	for i, exp := range experiments {
		exp.ID = strconv.Itoa(i)
		enrichedExperiments = append(enrichedExperiments, exp)
	}
	return enrichedExperiments
}
func httpServerAddressable(v handlers.HttpServerType) *handlers.HttpServerType {
	return &v
}
