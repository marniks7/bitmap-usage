package indexkelindar

import (
	"bitmap-usage/cache"
	"github.com/kelindar/bitmap"
	"strconv"
	"strings"
)

const (
	FieldNameSpec      = "spec"
	FieldNameGroup     = "group"
	FieldNameOffering  = "offering"
	FieldNameDefault   = "default"
	FieldNameCharStart = "char_"
)

func (s *Holder) IndexPricesV2(catalog *cache.Catalog) error {

	s.FieldsMetadata = make(map[string]*FieldMetadata)
	s.Index = &Index{Rows: make(map[uint32]*Row)}

	// initialize field metadata
	for _, pc := range catalog.PriceConditions {
		err := s.add(FieldNameSpec, pc.Spec)
		if err != nil {
			return err
		}
		err = s.add(FieldNameGroup, pc.GroupId)
		if err != nil {
			return err
		}
		err = s.add(FieldNameOffering, pc.OfferingID)
		if err != nil {
			return err
		}

		//TODO temporary convert bool to string
		err = s.add(FieldNameDefault, "true")
		if err != nil {
			return err
		}
		err = s.add(FieldNameDefault, "false")
		if err != nil {
			return err
		}

		for i, ch := range pc.Chars {
			v := pc.Values[i]
			err = s.add(FieldNameCharStart+strings.ToLower(ch), v)
			if err != nil {
				return err
			}
		}
	}
	indexToId := make([]string, len(catalog.PriceConditions))
	// populate values
	var key uint32
	for _, pc := range catalog.PriceConditions {
		// initialize indexes for prices
		// not that it highly influence performance
		pc.IndexId = key
		indexToId[key] = pc.ID
		key++
		err := s.addToBitmap(FieldNameSpec, pc.Spec, pc.IndexId)
		if err != nil {
			return err
		}
		err = s.addToBitmap(FieldNameGroup, pc.GroupId, pc.IndexId)
		if err != nil {
			return err
		}
		err = s.addToBitmap(FieldNameOffering, pc.OfferingID, pc.IndexId)
		if err != nil {
			return err
		}

		err = s.addToBitmap(FieldNameDefault, strconv.FormatBool(pc.IsDefault), pc.IndexId)
		if err != nil {
			return err
		}

		for i, ch := range pc.Chars {
			v := pc.Values[i]
			err = s.addToBitmap(FieldNameCharStart+strings.ToLower(ch), v, pc.IndexId)
			if err != nil {
				return err
			}
		}
	}
	s.IndexToOriginalId = indexToId
	return nil
}

func (h *Holder) add(fieldName string, fieldValue string) error {
	metadata, ok := h.FieldsMetadata[fieldName]
	if !ok {
		metadata = &FieldMetadata{Name: fieldName}
		metadata.Values = make(map[string]uint32)
		h.FieldsMetadata[fieldName] = metadata
	}
	_, ok = metadata.Values[fieldValue]
	if !ok {
		next, err := h.Index.NextBitmapIndex()
		if err != nil {
			return err
		}
		metadata.Values[fieldValue] = next
	}
	return nil
}

func (h *Holder) addToBitmap(fieldName string, fieldValue string, ind uint32) error {
	metadata := h.FieldsMetadata[fieldName]
	u := metadata.Values[fieldValue]

	row, ok := h.Index.Rows[u]
	if !ok {
		segments := make([]*RowSegment, 1)
		segments[0] = &RowSegment{shard: 0, bitmap: &bitmap.Bitmap{}}
		row = &Row{segments: segments}
		h.Index.Rows[u] = row
	}

	bm := row.segments[0].bitmap
	bm.Set(ind)
	return nil
}
