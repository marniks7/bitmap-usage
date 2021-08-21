package Prices_487k_PricesPerOffering_9_7k

import (
	"github.com/RoaringBitmap/roaring"
	"github.com/stretchr/testify/assert"
	"github.com/wcharczuk/go-chart/v2"
	"github.com/wcharczuk/go-chart/v2/drawing"
	"os"
	"strconv"
	"testing"
)

func TestGenerateTestData_BuildChart(t *testing.T) {
	_, ind := prepareBitmapIndexT(t)

	//TODO it is possible to build charts with some approximation
	//		see CharValues-distribution.png in the middle
	buildChart(t, "Offering", ind.Index.OfferingBitmaps)
	buildChart(t, "Group", ind.Index.GroupBitmaps)
	buildChart(t, "Spec", ind.Index.SpecBitmaps)
	buildChart(t, "CharValues", ind.Index.CharValuesBitmaps)
	//buildChart(t, "Default", []*roaring.Bitmap{ind.Index.DefaultBitmaps})
}

func buildChart(t *testing.T, name string, bitmaps []*roaring.Bitmap) {
	graph := chart.Chart{
		XAxis: chart.XAxis{Name: "Price Index Id",
			ValueFormatter: func(v interface{}) string {
				typed := v.(float64)
				typedDate := int(typed)
				r := typedDate / 1000
				return strconv.Itoa(r) + "k"
			}},
		YAxis: chart.YAxis{Name: name, Zero: chart.GridLine{}}}
	j := 1

	graph.Series = []chart.Series{}
	for _, b := range bitmaps {
		xx := make([]float64, 0, 100)
		yy := make([]float64, 0, 100)
		iterator := b.Iterator()
		i := 0
		for iterator.HasNext() {
			next := iterator.Next()
			xx = append(xx, float64(next))
			yy = append(yy, float64(j))
			i++
		}
		j++
		viridisByY := func(xr, yr chart.Range, index int, x, y float64) drawing.Color {
			return chart.Viridis(y, yr.GetMin(), yr.GetMax())
		}
		//graph.Series = append(graph.Series, chart.ContinuousSeries{
		//	XValues: xx,
		//	YValues: yy,
		//})
		graph.Series = append(graph.Series, chart.ContinuousSeries{
			Style: chart.Style{
				StrokeWidth:      chart.Disabled,
				DotWidth:         0.05,
				DotColorProvider: viridisByY,
			},
			XValues: xx,
			YValues: yy,
		})
	}

	f, err := os.Create("stats/" + name + "-distribution.png")
	if err != nil {
		panic(err)
	}

	err = graph.Render(chart.PNG, f)
	assert.NoError(t, err)
}
