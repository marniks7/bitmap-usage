package runner

import (
	"bitmap-usage/benchmark/analyze/analyze"
	"bitmap-usage/handlers"
	"bitmap-usage/runner/wrk"
	"github.com/rs/zerolog/log"
	"github.com/stretchr/testify/assert"
	"testing"
	"time"
)

// TestPerformanceWrkExperiments - the main runner
func TestPerformanceWrkExperiments(t *testing.T) {
	wrkConfig := wrk.Wrk{Threads: 2, Connections: 20, Duration: wrk.Duration(2 * time.Second)}
	fec := FilterExperimentsConfig{}

	// uncomment required list of experiments
	experiments := BasicExperiments(fec)
	//experiments := DockerBasicExperiments(fec)
	//experiments := DockerMemoryLimitExperiments(fec)
	//experiments := DockerMemoryLimitWithGoMemLimitExperiments(fec)
	//experiments := HttpServerExperiments(fec)
	//experiments := GoGCExperiments(fec)

	experiments = enrichAllExperiments(experiments,
		Experiment{Wrk: wrkConfig},
		FilterExperimentsConfig{Approaches: []Approach{Roaring32, Map32}})

	for _, exp := range experiments {
		log.Info().Str("name", exp.Name).
			Interface("app", exp.Application).
			Interface("wrk", exp.Wrk).
			Msg("Start experiment...")
		execute(exp.Application, exp.Wrk)
		path := exp.Wrk.JsonFilePath
		// TODO do we need this check?
		if path != "" {
			log.Warn().Str("id", exp.ID).Msg("Wrk JsonFilePath is not provided. Wrk results will not be updated")
			continue
		}
		fullpath := reportFullpath(path)
		report, err := analyze.ReadJsonWrkReport(fullpath)
		if err != nil {
			log.Err(err).Msg("unable to read wrk report")
			t.FailNow()
		}
		err = WriteResults(fullpath, Reporting{Stats: *report, Experiment: exp})
		if err != nil {
			log.Err(err).Msg("unable to write back wrk report")
			t.FailNow()
		}
		assert.Zero(t, report.Errors.Write)
		assert.Zero(t, report.Errors.Read)
		assert.Zero(t, report.Errors.Timeout)
		assert.Zero(t, report.Errors.Status)
		assert.Zero(t, report.Errors.Connect)
	}
	GenerateMarkdownDifference(experiments)
}

func enrichAllExperiments(experiments []Experiment, templateExperiment Experiment, fec FilterExperimentsConfig) []Experiment {
	experiments = filterExperiments(experiments, fec)
	experiments = mergeExperiments(experiments, templateExperiment)
	experiments = generateIds(experiments)
	experiments = updateWrkFilepath(experiments)
	return experiments
}

//goland:noinspection GoUnusedExportedFunction
func BasicExperiments(fec FilterExperimentsConfig) []Experiment {
	experiments := make([]Experiment, 0, 8)
	experiments = append(experiments, generateExperiments(Experiment{}, fec)...)
	return experiments
}

//goland:noinspection GoUnusedExportedFunction
func DockerBasicExperiments(fec FilterExperimentsConfig) []Experiment {
	experiments := make([]Experiment, 0, 8)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true}}, fec)...)
	return experiments
}

//goland:noinspection GoUnusedExportedFunction
func DockerMemoryLimitExperiments(fec FilterExperimentsConfig) []Experiment {
	experiments := make([]Experiment, 0, 8)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "2GB"}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "1GB"}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "800MB"}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "500MB"}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "200MB"}}, fec)...)

	return experiments
}

//goland:noinspection GoUnusedExportedFunction
func DockerMemoryLimitWithGoMemLimitExperiments(fec FilterExperimentsConfig) []Experiment {
	experiments := make([]Experiment, 0, 8)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "2GB", GOMEMLIMIT: "1750MiB"}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "1.5GB", GOMEMLIMIT: "1250MiB"}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "1GB", GOMEMLIMIT: "750MiB"}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "800MB", GOMEMLIMIT: "650MiB"}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "500MB", GOMEMLIMIT: "400MiB"}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{Docker: true, DockerMemoryLimit: "200MB", GOMEMLIMIT: "180MiB"}}, fec)...)
	return experiments
}

//goland:noinspection GoUnusedExportedFunction
func HttpServerExperiments(fec FilterExperimentsConfig) []Experiment {
	experiments := make([]Experiment, 0, 8)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{HttpServer: httpServerAddressable(handlers.FiberServer)}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{HttpServer: httpServerAddressable(handlers.DefaultServer)}}, fec)...)
	return experiments
}

//goland:noinspection GoUnusedExportedFunction
func GoGCExperiments(fec FilterExperimentsConfig) []Experiment {
	experiments := make([]Experiment, 0, 8)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{GoGC: 1000}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{GoGC: 800}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{GoGC: 600}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{GoGC: 400}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{GoGC: 200}}, fec)...)
	experiments = append(experiments, generateExperiments(Experiment{Application: Application{GoGC: 100}}, fec)...)
	return experiments
}
