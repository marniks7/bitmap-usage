package bulk

import (
	"fmt"
	"github.com/stretchr/testify/assert"
	"sync"
	"testing"
)

var mu sync.Mutex
var count int

func TestGroup_Go(t *testing.T) {
	group := NewGroup(3)
	mutex := sync.RWMutex{}
	mutex.Lock()
	group.Go(func() error {
		incrementCounter(1)
		mutex.Lock()
		mutex.Unlock()
		return nil
	})

	group.Go(func() error {
		incrementCounter(2)
		mutex.Lock()
		mutex.Unlock()
		return nil
	})
	group.Go(func() error {
		incrementCounter(3)
		mutex.Lock()
		mutex.Unlock()
		return nil
	})
	assert.Equal(t, 1, count)
	mutex.Unlock()
	err := group.Wait()
	assert.Equal(t, 3, count)
	assert.NoError(t, err)
}

func incrementCounter(n int) {
	mu.Lock()
	defer mu.Unlock()
	count = count + 1
	fmt.Printf("Value after Worker %d is done: %d\n", n, count)
}
