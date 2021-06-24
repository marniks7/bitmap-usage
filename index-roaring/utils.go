package indexroaring

import (
	"bitmap-usage/misc"
	"github.com/RoaringBitmap/roaring"
)

func (s *BitmapIndexService) GenerateBitmapStatistics() *GroupBitmapsStatistics {
	var gbs GroupBitmapsStatistics
	r := GatherBitmapStats(s.Index.SpecBitmaps, "Spec")
	AppendStats(&gbs, r)
	r = GatherBitmapStats(s.Index.OfferingBitmaps, "Offering")
	AppendStats(&gbs, r)
	r = GatherBitmapStats(s.Index.GroupBitmaps, "Group")
	AppendStats(&gbs, r)
	r = GatherBitmapStats([]*roaring.Bitmap{s.Index.DefaultBitmaps}, "Default")
	AppendStats(&gbs, r)
	r = GatherBitmapStats(s.Index.CharBitmaps, "Char")
	AppendStats(&gbs, r)
	r = GatherBitmapStats(s.Index.CharValuesBitmaps, "CharValues")
	AppendStats(&gbs, r)
	gbs.SizeHR = misc.ConvertToHumanReadableSizeUint64(gbs.Size)
	gbs.SerializedSizeHR = misc.ConvertToHumanReadableSizeUint64(gbs.SerializedSize)
	return &gbs
}

func AppendStats(gbs *GroupBitmapsStatistics, r *BitmapStatistics) {
	gbs.Stats = append(gbs.Stats, r)
	gbs.SerializedSize += r.SerializedSize
	gbs.Size += r.Size
	gbs.Cnt += r.Cnt
}

func GatherBitmapStats(ind []*roaring.Bitmap, name string) *BitmapStatistics {
	var bs BitmapStatistics
	bs.Name = name
	bs.Cnt = len(ind)
	for _, bm := range ind {
		bs.Size += bm.GetSizeInBytes()
		bs.SerializedSize += bm.GetSerializedSizeInBytes()
		bs.Stats = append(bs.Stats, bm.Stats())
	}
	bs.SizeHR = misc.ConvertToHumanReadableSizeUint64(bs.Size)
	bs.SerializedSizeHR = misc.ConvertToHumanReadableSizeUint64(bs.SerializedSize)
	return &bs
}
