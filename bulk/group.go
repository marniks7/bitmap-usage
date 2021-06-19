package bulk

import "sync"

type Group struct {
	wg    sync.WaitGroup
	err   error
	limit chan struct{}
}

func NewGroup(limit uint8) *Group {
	return &Group{limit: make(chan struct{}, limit)}
}

func (g *Group) Wait() error {
	g.wg.Wait()
	return g.err
}

func (g *Group) Go(fnc func() error) {
	g.wg.Add(1)
	g.limit <- struct{}{}
	go func() {
		defer g.wg.Done()
		if err := fnc(); err != nil && g.err != nil {
			g.err = err
		}
		<-g.limit
	}()
}
