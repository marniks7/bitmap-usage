package runner

import (
	"github.com/stretchr/testify/assert"
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
