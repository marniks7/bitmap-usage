package _00k_large_groups

import (
	"bitmap-usage/benchmark/500k-large-groups/sample"
	"bitmap-usage/cache"
	"encoding/json"
	"github.com/stretchr/testify/assert"
	"os"
	"testing"
)

func TestDataStatistics(t *testing.T) {
	cs := cache.NewCatalogService(cache.NewCatalog())
	sampleService := sample.Service{Cs: cs}
	err := sampleService.GenerateTestData5Chars50Offerings()
	assert.NoError(t, err)

	statistics := cache.Statistics(cs.Catalog)
	f, err := os.Create("data-stats.json")
	if err != nil {
		panic(err)
	}
	encoder := json.NewEncoder(f)
	encoder.SetIndent("", "   ")
	err = encoder.Encode(statistics)
	assert.NoError(t, err)
}
