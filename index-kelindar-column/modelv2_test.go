package indexkelindarcolumn

import (
	"github.com/davecgh/go-spew/spew"
	"testing"
)

// Field1
// row#1 column0-1000 -> shard1
// row#1 column1000-2000 -> shard2
// row#2 column0-1000 -> shard3
// row#2 column1000-2000 -> shard3
// Field2
// row#3 column0-1000 -> shard1
// row#3 column1000-2000 -> shard1
func TestModelV2(t *testing.T) {
	h := Holder{}
	ss := Index{}
	h.Index = &ss
	h.FieldsMetadata = make(map[string]*FieldMetadata)
	h.FieldsMetadata["group"] = &FieldMetadata{Name: "group", Values: map[string]uint32{"Group1": 0, "Group2": 1}}
	h.FieldsMetadata["term"] = &FieldMetadata{Name: "term", Values: map[string]uint32{"12": 2, "24": 3, "36": 4, "48": 5, "60": 6}}

	ss.Rows = make(map[uint32]*Row)
	rs := make([]*RowSegment, 2)
	rs = append(rs, &RowSegment{shard: 1, start: 0, end: 1000})
	rs = append(rs, &RowSegment{shard: 2, start: 1000, end: 2000})
	rs2 := make([]*RowSegment, 2)
	rs2 = append(rs2, &RowSegment{shard: 3, start: 0, end: 1000})
	rs2 = append(rs2, &RowSegment{shard: 3, start: 1000, end: 2000})
	row1 := &Row{segments: rs}
	row2 := &Row{segments: rs2}
	ss.Rows[1] = row1
	ss.Rows[2] = row2

	spew.Dump(ss)
}
