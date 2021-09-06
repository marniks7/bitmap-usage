package indexkelindarcolumn

import (
	"bitmap-usage/cache"
	"github.com/kelindar/bitmap"
	"github.com/kelindar/column"
)

const (
	FieldNameSpec      = "spec"
	FieldNameGroup     = "group"
	FieldNameOffering  = "offering"
	FieldNameDefault   = "default"
	FieldNameCharStart = "char_"
	FieldNameId        = "id"
)

func (s *Holder) IndexPricesV2(catalog *cache.Catalog) error {
	prices := column.NewCollection()

	prices.CreateColumn(FieldNameId, column.ForUint32())
	prices.CreateColumn(FieldNameOffering, column.ForString())
	prices.CreateColumn(FieldNameGroup, column.ForString())
	prices.CreateColumn(FieldNameSpec, column.ForString())
	prices.CreateColumn(FieldNameDefault, column.ForBool())

	// initialize field metadata
	cc := make(map[string]bool, 8)
	for _, pc := range catalog.PriceConditions {
		for _, ch := range pc.Chars {
			if _, ok := cc[ch]; !ok {
				prices.CreateColumn(FieldNameCharStart+ch, column.ForString())
				cc[ch] = true
			}
		}
	}
	// populate values
	indexToId := make([]string, len(catalog.PriceConditions))
	// populate values
	var key uint32
	cc2 := make(map[string]bool, 8)
	err := prices.Query(func(txn *column.Txn) error {
		for _, pc2 := range catalog.PriceConditions {
			pc := pc2
			pc.IndexId = key
			indexToId[key] = pc.ID
			key++

			//TODO index name could be the same for different types
			if _, ok := cc2[pc.OfferingID]; !ok {
				err := prices.CreateIndex(FieldNameOffering+pc.OfferingID, FieldNameOffering,
					func(r column.Reader) bool {
						return r.String() == pc.OfferingID
					})
				if err != nil {
					return err
				}
				cc2[pc.OfferingID] = true
			}

			if _, ok := cc2[pc.Spec]; !ok {
				err := prices.CreateIndex(FieldNameSpec+pc.Spec, FieldNameSpec,
					func(r column.Reader) bool {
						return r.String() == pc.Spec
					})
				if err != nil {
					return err
				}
				cc2[pc.Spec] = true
			}

			if _, ok := cc2[pc.GroupId]; !ok {
				err := prices.CreateIndex(FieldNameGroup+pc.GroupId, FieldNameGroup,
					func(r column.Reader) bool {
						return r.String() == pc.GroupId
					})
				if err != nil {
					panic(err)
				}
				cc2[pc.GroupId] = true
			}

			if _, ok := cc2[FieldNameDefault+"_true"]; !ok {
				err := prices.CreateIndex(FieldNameDefault+"_true", FieldNameDefault,
					func(r column.Reader) bool {
						return r.Bool()
					})

				if err != nil {
					return err
				}
				cc2[FieldNameDefault+"_true"] = true
			}

			for j, ch2 := range pc.Chars {
				ch := ch2
				i := j
				v := pc.Values[i]
				if _, ok := cc2[FieldNameCharStart+ch+"_"+v]; !ok {
					err := prices.CreateIndex(FieldNameCharStart+ch+"_"+v, FieldNameCharStart+ch, func(r column.Reader) bool {
						return r.String() == v
					})

					if err != nil {
						return err
					}
					cc2[FieldNameCharStart+ch+"_"+v] = true
				}
			}

			mp := make(map[string]interface{}, 8)
			mp[FieldNameId] = pc.IndexId
			mp[FieldNameSpec] = pc.Spec
			mp[FieldNameOffering] = pc.OfferingID
			mp[FieldNameGroup] = pc.GroupId
			mp[FieldNameDefault] = pc.IsDefault
			for i, ch := range pc.Chars {
				v := pc.Values[i]
				mp[FieldNameCharStart+ch] = v
			}

			txn.Insert(mp)
		}
		return nil // Commit
	})
	if err != nil {
		return err
	}
	s.IndexToOriginalId = indexToId
	s.Collection = prices
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
