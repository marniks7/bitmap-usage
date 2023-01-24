package runner

import (
	"reflect"
	"strings"
)

type StructDiff struct {
	Field string
	Path  string
	Value interface{}
}

type Result struct {
	A []StructDiff
	B []StructDiff
}

func compareStructs(a, b interface{}, path string) Result {
	var result Result
	av := reflect.ValueOf(a)
	bv := reflect.ValueOf(b)
	if av.Kind() == reflect.Ptr {
		av = av.Elem()
	}
	if bv.Kind() == reflect.Ptr {
		bv = bv.Elem()
	}

	for i := 0; i < av.NumField(); i++ {
		af := av.Field(i)
		bf := bv.Field(i)
		field := av.Type().Field(i)
		currentPath := path + "." + field.Name

		if af.Kind() == reflect.Struct {
			nestedResult := compareStructs(af.Interface(), bf.Interface(), currentPath)
			result.A = append(result.A, nestedResult.A...)
			result.B = append(result.B, nestedResult.B...)
		} else if !reflect.DeepEqual(af.Interface(), bf.Interface()) {
			result.A = append(result.A, StructDiff{Field: field.Name, Path: currentPath, Value: af.Interface()})
			result.B = append(result.B, StructDiff{Field: field.Name, Path: currentPath, Value: bf.Interface()})
		}
	}

	return result
}
func getValueByPath(s interface{}, path string) interface{} {
	v := reflect.ValueOf(s)
	if v.Kind() == reflect.Ptr {
		v = v.Elem()
	}
	fields := strings.Split(path, ".")
	for i, field := range fields {
		f := v.FieldByName(field)
		if !f.IsValid() {
			return nil
		}
		if i == len(fields)-1 {
			return f.Interface()
		}
		if f.Kind() == reflect.Struct || f.Kind() == reflect.Ptr {
			if f.Kind() == reflect.Ptr {
				f = f.Elem()
			}
			v = f
		} else {
			return nil
		}
	}
	return nil
}
