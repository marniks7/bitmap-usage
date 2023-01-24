package runner

import (
	"github.com/stretchr/testify/assert"
	"reflect"
	"testing"
)

func TestGenerateFileName(t *testing.T) {
	type args struct {
		file1 string
		file2 string
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{name: "loong file names", args: args{
			file1: "exp-roaring32-dockermemorylimit-200mb-gomemlimit-180mib-roaring32.json",
			file2: "exp-roaring32-dockermemorylimit-800mb-gomemlimit-650mib-roaring32.json",
		},
			want: "exp-roaring32-dockermemorylimit-200mb-gomemlimit-180mib-roaring-vs-exp-roaring32-dockermemorylimit-800mb-gomemlimit-650mib-roaring.md"},
		{name: "regular", args: args{
			file1: "exp-roaring32.json",
			file2: "exp-map32.json",
		},
			want: "exp-roaring32.json-vs-exp-map32.json.md"},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			name := GenerateMarkdownFilename(tt.args.file1, tt.args.file2)
			assert.Equalf(t, tt.want, name, "GenerateMarkdownFilename(%v, %v)", tt.args.file1, tt.args.file2)

		})
	}
}

func TestSort(t *testing.T) {
	tests := []struct {
		name     string
		pathList []StructDiff
		want     []StructDiff
	}{
		{
			name: "Test sorting with IdFieldPath first",
			pathList: []StructDiff{
				{Field: "Field1", Path: ".Application.Approach", Value: "Approach1"},
				{Field: "Field2", Path: ".Name", Value: "Name1"},
				{Field: "Field3", Path: ".ID", Value: "ID1"},
				{Field: "Field4", Path: ".Field4", Value: "Field4Value1"},
			},
			want: []StructDiff{
				{Field: "Field3", Path: ".ID", Value: "ID1"},
				{Field: "Field1", Path: ".Application.Approach", Value: "Approach1"},
				{Field: "Field2", Path: ".Name", Value: "Name1"},
				{Field: "Field4", Path: ".Field4", Value: "Field4Value1"},
			},
		},
		{
			name: "Test sorting with multiple IdFieldPath",
			pathList: []StructDiff{
				{Field: "Field1", Path: ".ID", Value: "ID1"},
				{Field: "Field2", Path: ".Name", Value: "Name1"},
				{Field: "Field3", Path: ".ID", Value: "ID2"},
				{Field: "Field4", Path: ".Name", Value: "Name2"},
			},
			want: []StructDiff{
				{Field: "Field3", Path: ".ID", Value: "ID2"},
				{Field: "Field1", Path: ".ID", Value: "ID1"},
				{Field: "Field4", Path: ".Name", Value: "Name2"},
				{Field: "Field2", Path: ".Name", Value: "Name1"},
			},
		},
		{
			name: "Test sorting with IdFieldPath only",
			pathList: []StructDiff{
				{Field: "Field1", Path: ".ID", Value: "ID1"},
				{Field: "Field2", Path: ".ID", Value: "ID2"},
				{Field: "Field3", Path: ".ID", Value: "ID3"},
				{Field: "Field4", Path: ".ID", Value: "ID4"},
			},
			want: []StructDiff{
				{Field: "Field4", Path: ".ID", Value: "ID4"},
				{Field: "Field3", Path: ".ID", Value: "ID3"},
				{Field: "Field2", Path: ".ID", Value: "ID2"},
				{Field: "Field1", Path: ".ID", Value: "ID1"},
			},
		},
		{
			name: "Test sorting with IdFieldPath mixed with other fields",
			pathList: []StructDiff{
				{Field: "Field1", Path: ".Application.Approach", Value: "Approach1"},
				{Field: "Field2", Path: ".ID", Value: "ID1"},
				{Field: "Field3", Path: ".Name", Value: "Name1"},
				{Field: "Field4", Path: ".ID", Value: "ID2"},
			},
			want: []StructDiff{
				{Field: "Field4", Path: ".ID", Value: "ID2"},
				{Field: "Field2", Path: ".ID", Value: "ID1"},
				{Field: "Field1", Path: ".Application.Approach", Value: "Approach1"},
				{Field: "Field3", Path: ".Name", Value: "Name1"},
			},
		},
		{
			name: "Test sorting for second level path",
			pathList: []StructDiff{
				{Field: "Field1", Path: ".Application.Approach", Value: "Approach1"},
				{Field: "Field2", Path: ".ID", Value: "ID1"},
				{Field: "Field3", Path: ".Name", Value: "Name1"},
				{Field: "Field4", Path: ".Application.Script", Value: "Script"},
				{Field: "Field5", Path: ".Application.Wrk", Value: "Wrk"},
			},
			want: []StructDiff{
				{Field: "Field2", Path: ".ID", Value: "ID1"},
				{Field: "Field1", Path: ".Application.Approach", Value: "Approach1"},
				{Field: "Field3", Path: ".Name", Value: "Name1"},
				{Field: "Field4", Path: ".Application.Script", Value: "Script"},
				{Field: "Field5", Path: ".Application.Wrk", Value: "Wrk"},
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			sortStructDiff(tt.pathList)
			if !reflect.DeepEqual(tt.pathList, tt.want) {
				t.Errorf("sortStructDiff() = %v, want %v", tt.pathList, tt.want)
			}
		})
	}
}
