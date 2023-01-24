package runner

import (
	"bitmap-usage/benchmark/analyze/analyze"
	"bitmap-usage/benchmark/analyze/wrk"
	"encoding/json"
	"fmt"
	"golang.org/x/exp/slices"
	"os"
	"path/filepath"
	"strings"
	"time"
	"unicode/utf8"
)

// MaximumFileLength didn't figure out why on my pc it is limited
// getconf -a | grep -i name_max is "255" bytes
const MaximumFileLength = 135

// Reporting used to write back WRK results with experiment enriched data
type Reporting struct {
	Experiment Experiment
	wrk.Stats
}

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

func GenerateMarkdownDifference(experiments []Experiment) {
	length := len(experiments)

	for i := 0; i < length; i++ {
		path1 := experiments[i].Wrk.JsonFilePath
		_, file1 := filepath.Split(path1)
		report1, err := analyze.ReadJsonWrkReport(reportFullpath(path1))
		if err != nil {
			panic(err)
		}
		for j := 0; j < length; j++ {
			if i == j {
				continue
			}
			path2 := experiments[j].Wrk.JsonFilePath
			_, file2 := filepath.Split(path2)
			report2, err := analyze.ReadJsonWrkReport(reportFullpath(path2))
			if err != nil {
				panic(err)
			}
			fullpath := reportDirFullpath(path1)
			filename := GenerateMarkdownFilename(file1, file2)
			fullFilename := filepath.Join(fullpath, filename)
			file, err := os.Create(fullFilename)
			if err != nil {
				panic(err)
			}
			analyze.MarkdownDiff(report1, report2, file, file1, file2)
		}
	}
}

// GenerateMarkdownFilename generate filename for Markdown report
func GenerateMarkdownFilename(file1 string, file2 string) string {
	desiredFileName := file1 + "-vs-" + file2 + ".md"
	if utf8.RuneCountInString(desiredFileName) >= MaximumFileLength {
		diff := (len(desiredFileName) - MaximumFileLength) / 2
		maxFilename1 := file1[0 : len(file1)-diff-1]
		maxFilename2 := file2[0 : len(file2)-diff-1]
		desiredFileName = maxFilename1 + "-vs-" + maxFilename2 + ".md"
	}
	return desiredFileName
}

func reportDirFullpath(fp string) string {
	dir, _ := filepath.Split(fp)
	if !filepath.IsAbs(dir) {
		dir = filepath.Join(commandDir(), dir)
	}
	return dir
}

func reportFullpath(fp string) string {
	dir, file := filepath.Split(fp)
	if !filepath.IsAbs(dir) {
		dir = filepath.Join(commandDir(), dir)
	}
	return filepath.Join(dir, file)
}

func commandDir() string {
	getwd, err := os.Getwd()
	if err != nil {
		panic(err)
	}
	dir := filepath.Dir(getwd)
	return dir
}

// updateDiskStorageInfo - update experiments by providing folder names and file names
func updateDiskStorageInfo(experiments []Experiment) []Experiment {
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
		if a.Path == IdFieldPath || b.Path == IdFieldPath {
			return false
		}
		if a.Path == ApplicationApproachFieldPath || b.Path == ApplicationApproachFieldPath {
			return false
		}
		if a.Path == NameFieldPath || b.Path == NameFieldPath {
			return false
		}
		if a.Path != b.Path {
			return a.Path < b.Path
		}
		return a.Path > b.Path
	})
	return pathList
}
