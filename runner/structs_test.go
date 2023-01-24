package runner

import (
	"reflect"
	"testing"
)

type TestStruct struct {
	Field1 string
	Field2 int
	Field3 *TestNestedStruct
}

type TestNestedStruct struct {
	NestedField1 string
	NestedField2 int
}

func TestGetValueByPath(t *testing.T) {
	testCases := []struct {
		s      interface{}
		path   string
		result interface{}
	}{
		{
			s: &TestStruct{
				Field1: "value1",
				Field2: 10,
				Field3: &TestNestedStruct{
					NestedField1: "nested value1",
					NestedField2: 20,
				},
			},
			path:   "Field1",
			result: "value1",
		},
		{
			s: &TestStruct{
				Field1: "value1",
				Field2: 10,
				Field3: &TestNestedStruct{
					NestedField1: "nested value1",
					NestedField2: 20,
				},
			},
			path:   "Field3.NestedField2",
			result: 20,
		},
		{
			s: &TestStruct{
				Field1: "value1",
				Field2: 10,
				Field3: &TestNestedStruct{
					NestedField1: "nested value1",
					NestedField2: 20,
				},
			},
			path:   "NonExistentField",
			result: nil,
		},
		{
			s: &TestStruct{
				Field1: "value1",
				Field2: 10,
				Field3: &TestNestedStruct{
					NestedField1: "nested value1",
					NestedField2: 20,
				},
			},
			path:   "Field3.NonExistentField",
			result: nil,
		},
	}
	for i, test := range testCases {
		result := getValueByPath(test.s, test.path)
		if !reflect.DeepEqual(result, test.result) {
			t.Errorf("Test case %d failed: expected %v but got %v", i, test.result, result)
		}
	}
}
