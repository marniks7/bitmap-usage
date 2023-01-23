package runner

import (
	"reflect"
	"testing"
)

type testCase struct {
	a      interface{}
	b      interface{}
	result Result
}

type TestStruct struct {
	Field1 string
	Field2 int
	Field3 *TestNestedStruct
}

type TestNestedStruct struct {
	NestedField1 string
	NestedField2 int
}

func TestCompareStructs(t *testing.T) {
	testCases := []testCase{
		{
			a: &TestStruct{
				Field1: "value1",
				Field2: 10,
				Field3: &TestNestedStruct{
					NestedField1: "nested value1",
					NestedField2: 20,
				},
			},
			b: &TestStruct{
				Field1: "value1",
				Field2: 10,
				Field3: &TestNestedStruct{
					NestedField1: "nested value2",
					NestedField2: 20,
				},
			},
			result: Result{
				A: []StructDiff{
					{
						Field: "Field3",
						Path:  "Field3",
						Value: &TestNestedStruct{
							NestedField1: "nested value1",
							NestedField2: 20,
						},
					},
				},
				B: []StructDiff{
					{
						Field: "Field3",
						Path:  "Field3",
						Value: &TestNestedStruct{
							NestedField1: "nested value2",
							NestedField2: 20,
						},
					},
				},
			},
		},
		// Add more test cases as needed
	}

	for i, test := range testCases {
		result := compareStructs(test.a, test.b, "")
		if !reflect.DeepEqual(result, test.result) {
			t.Errorf("Test case %d failed: expected %v but got %v", i, test.result, result)
		}
	}
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
		// Add more test cases as needed
	}
	for i, test := range testCases {
		result := getValueByPath(test.s, test.path)
		if !reflect.DeepEqual(result, test.result) {
			t.Errorf("Test case %d failed: expected %v but got %v", i, test.result, result)
		}
	}
}
